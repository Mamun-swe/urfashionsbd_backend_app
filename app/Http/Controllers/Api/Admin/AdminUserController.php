<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Validator;

class AdminUserController extends Controller
{
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    //all user's list
    public function index(Request $request)
    {
        $data = array();
        $users = User::all();
        if (count($users) > 0) {
            foreach ($users as $user) {
                $data[] = array(
                    "id" => $user->id,
                    "name" => $user->name,
                    "email" => $user->email,
                    "phone_number" => $user->phone_number,
                    "image" => $user->image ? $this->rootUrl() . '/users/' . $user->image : $this->rootUrl() . '/avator/avator.jpg',
                    "role" => $user->role,
                );
            }
            return response()->json($data, 200);
        }
        return response()->json([
            'status' => false,
            'message' => 'User not found',
        ], 404);
    }

    // Create User
    public function store(Request $request)
    {
        $user = User::where('email', $request->email)
            ->orWhere('phone_number', $request->phone_number)
            ->first();

        if ($user) {
            return response()->json(['status' => false, 'message' => 'Account already created.'], 208);
        }

        $rules = [
            'name' => 'required',
            'email' => ['required', 'unique:users'],
            'phone_number' => ['required', 'unique:users'],
            'role' => 'required',
            'password' => 'required|string|min:8',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ]);
        }

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;
            $file->move('users', $filename);

            $form_data = array(
                'name' => $request->name,
                'email' => $request->email,
                'phone_number' => $request->phone_number,
                'role' => $request->role,
                'password' => bcrypt($request->password),
                'image' => $filename,
            );

            $user = User::create($form_data);
            if ($user) {
                return response()->json(['message' => 'Succesfully account created.'], 200);
            } else {
                return response()->json([
                    'message' => 'Account create failed, please try again.',
                ], 501);
            }
        } else {
            $form_data = array(
                'name' => $request->name,
                'email' => $request->email,
                'phone_number' => $request->phone_number,
                'role' => $request->role,
                'password' => bcrypt($request->password),
            );

            $user = User::create($form_data);
            if ($user) {
                return response()->json(['message' => 'Succesfully account created.'], 200);
            } else {
                return response()->json([
                    'message' => 'Account create failed, please try again.',
                ], 501);
            }
        }
    }

    //update indivisual user profile
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'name' => 'required',
            'phone_number' => 'required',
            'email' => 'required',
            'role' => 'required',
        ]);

        $user = User::find($id);
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            if ($user->image) {
                $old_image = public_path() . '/users/' . $user->image;
                unlink($old_image);
            }
            $file->move('users', $filename);

            $user->name = $request->name;
            $user->email = $request->email;
            $user->phone_number = $request->phone_number;
            $user->role = $request->role;
            $user->image = $filename;
            $user->save();

            return response()->json([
                'status' => true,
                'message' => 'Successfully user updated',
            ], 200);
        }

        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone_number = $request->phone_number;
        $user->role = $request->role;
        $user->save();

        return response()->json([
            'status' => true,
            'message' => 'Successfully user updated',
        ], 200);
    }

    // Admin Profile Update
    public function adminProfileUpdate(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'image' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ]);
        }

        $user = User::find($id);
        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            if ($user->image) {
                $old_image = public_path() . '/users/' . $user->image;
                unlink($old_image);
            }

            $file->move('users', $filename);
            $form_data = array(
                'name' => $request->name,
                'image' => $filename,
            );

            $user->update($form_data);
            return response()->json([
                'status' => true,
                'message' => 'Successfully account update',
            ], 200);
        }

        $form_data = array(
            'name' => $request->name,
        );

        $user->update($form_data);
        return response()->json([
            'status' => true,
            'message' => 'Successfully account update',
        ], 200);
    }

    // Admin password update
    public function updateAdminPassword(Request $request, $id)
    {
        $rules = [
            'old_password' => 'required',
            'new_password' => 'required|string|min:8',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ]);
        }

        $user = User::where('id', $id)->first();
        if ($user) {
            if (password_verify($request->old_password, $user->password)) {
                // Update Password
                $updateArr = ['password' => bcrypt($request->new_password)];
                User::where('id', $id)->update($updateArr);
                return response()->json([
                    'status' => true,
                    'message' => 'Successfully password updated.',
                ], 200);
            }

            return response()->json([
                'status' => false,
                'message' => 'Invalid old password.',
            ], 401);

        }
    }

    //Delete Custormer Account
    public function destroy($id)
    {
        $user = User::find($id);
        if ($user) {
            if ($user->image) {
                $image = public_path() . '/users/' . $user->image;
                unlink($image);
                $user->delete();
                return response()->json(['status' => true, 'message' => 'Successfully account deleted.'], 200);
            }
            $user->delete();
            return response()->json(['status' => true, 'message' => 'Successfully account deleted.'], 200);
        }

        return response()->json([
            'status' => false,
            'message' => 'nothing to delete',
        ], 204);
    }
}
