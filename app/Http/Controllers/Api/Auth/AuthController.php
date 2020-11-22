<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;
use Validator;

class AuthController extends Controller
{
    // Private Token
    private $apiToken;
    public function __construct()
    {
        $this->apiToken = uniqid(base64_encode(str_random(60)));
    }

    // ROOT URL
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    // Login
    public function Login(Request $request)
    {
        $rules = [
            'email' => 'required|email',
            'password' => 'required|min:8',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ]);
        } else {

            $user = User::where('email', $request->email)->first();
            if ($user) {

                if (password_verify($request->password, $user->password)) {
                    // Update Token
                    $postArray = ['api_token' => $this->apiToken];
                    $login = User::where('email', $request->email)->update($postArray);

                    if ($login) {
                        return response()->json([
                            'id' => $user->id,
                            'status' => true,
                            'token' => $user->role . '.' . $this->apiToken,
                        ]);
                    }
                } else {
                    return response()->json([
                        'status' => false,
                        'message' => 'Invalid email or password.',
                    ], 401);
                }

            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Invalid email or password.',
                ], 401);
            }
        }
    }

    // Register
    public function Register(Request $request)
    {
        $checkUser = User::where('phone_number', $request->phone_number)
            ->where('email', $request->email)
            ->first();
        if ($checkUser) {
            return response()->json([
                'status' => false,
                'message' => 'Account already created.',
            ], 208);
        }
        $rules = [
            'name' => 'required|string',
            'email' => 'required|string|email|max:255|unique:users',
            'phone_number' => 'required|string|max:255|unique:users|regex:/(01)[0-9]{9}/',
            'password' => 'required|string|min:8',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'status' => false,
                'message' => $validator->messages(),
            ], 422);
        } else {
            $form_data = array(
                'name' => $request->name,
                'email' => $request->email,
                'phone_number' => $request->phone_number,
                'password' => bcrypt($request->password),
            );

            $user = User::create($form_data);
            if ($user) {
                return response()->json([
                    'status' => true,
                    'message' => 'Succesfully account created.',
                ], 200);
            } else {
                return response()->json([
                    'status' => false,
                    'message' => 'Registration failed, please try again.',
                ], 204);
            }

        }
    }

    // Me
    public function Me(Request $request)
    {
        $tokenExplode = explode(".", $request->bearerToken());
        $token = $tokenExplode[1];
        $user = User::where('api_token', '=', $token)->first();
        if ($user) {
            $obj = (object) [
                'id' => $user->id,
                'name' => $user->name,
                'email' => $user->email,
                'phone_number' => $user->phone_number,
                'role' => $user->role,
                'image' => $user->image ? $this->rootUrl() . '/users/' . $user->image : $this->rootUrl() . '/avator/avator.jpg',
            ];
            return response()->json($obj);
        } else {
            return response()->json([
                'message' => 'User not found',
            ], 204);
        }
    }

    // Logout
    public function Logout(Request $request)
    {
        $tokenExplode = explode(".", $request->bearerToken());
        $token = $tokenExplode[1];
        $user = User::where('api_token', '=', $token)->first();
        if ($user) {
            $postArray = ['api_token' => null];
            $logout = User::where('id', $user->id)->update($postArray);
            if ($logout) {
                return response()->json(['message' => 'success'], 200);
            }
        } else {
            return response()->json([
                'message' => 'Token not found',
            ], 404);
        }
    }

    // Password Reset
    public function passwordReset(Request $request)
    {
        
        $rules = [
            'email' => 'required|email',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ], 422);
        }

        $email = $request->email;
        $data = User::where('email', $email)->first();
        if (!$data) {
            return response()->json([
                'status' => false,
                'message' => 'Email Not Match',
            ], 404);
        }

        $code = rand(50000000, 100000000);
        $data->password = bcrypt($code);
        $data->update();
        if ($data) {
            Mail::send('Mail.resetPassword', ['data' => $data, 'code' => $code], function ($message) use ($data) {
                $message->from('billing@urfashionsbd.com', 'UR Fashion');
                $message->to($data->email, $data->name)->subject("Password Reset");
            });
            if (Mail::failures()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Failed! Internal Server Error',
                ], 501);
            }
            return response()->json([
                'status' => true,
                'message' => 'password Update success',
            ], 200);
        } else {
            return response()->json([
                'status' => false,
                'message' => 'passowrd fail to update',
            ], 404);
        }

    }

}
