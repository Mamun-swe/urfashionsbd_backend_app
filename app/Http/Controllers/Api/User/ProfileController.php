<?php

namespace App\Http\Controllers\Api\User;

use App\Http\Controllers\Controller;
use App\Models\User;
use App\Models\Order;
use App\Models\OrderedProducts;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\URL;
use Validator;

class ProfileController extends Controller
{
    // ROOT URL
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    // Update Account Details
    public function updateUserAccountDetails(Request $request)
    {
        $this->validate($request, [
            'name' => 'required',
            'phone_number' => 'required',
        ]);
        $tokenExplode = explode(".", $request->bearerToken());
        $token = $tokenExplode[1];
        $user = User::where('api_token', '=', $token)->first();
        if ($user) {
            $user->name = $request->name;
            $user->phone_number = $request->phone_number;

            if ($request->file('image')) {
                $file = $request->file('image');
                $extension = $file->getClientOriginalExtension();
                $fileName = time() . '.' . $extension;
                if ($user->image == true) {
                    $oldImage = public_path() . '/users/' . $user->image;
                    unlink($oldImage);
                }
                $file->move('users', $fileName);
                $user->image = $fileName;
            }
            $user->update();
            if ($user) {
                return response()->json([
                    'status' => true,
                    'message' => 'User Account Update Successful ',
                ], 200);
            }
            return response()->json([
                'status' => false,
                'message' => 'Account Update Failed. Internal Server Error',
            ], 501);
        }
        return response()->json([
            'status' => false,
            'message' => 'User Token not match ',
        ], 404);

    }

    // user Password update
    public function updateUserPassword(Request $request, $id)
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

    // My Orders
    public function myOrders($id, $email)
    {
        $data = array();
        $results = Order::where('user_id', $id)
            ->where('email', $email)
            ->orderBy('id', 'DESC')
            ->get();
        foreach ($results as $result) {
            $orderedProducts = array();
            $orders = OrderedProducts::where('order_id', $result->id)->get();
            foreach ($orders as $order) {
                $product = Product::where('id', $order->product_id)
                ->select('name', 'brand', 'mrp', 'selling_price', 'image')
                ->first();
                $productObj = (object) [
                    'name' => $product->name,
                    'brand' => $product->brand,
                    'mrp' => $product->mrp,
                    'selling_price' => $product->selling_price,
                    'image' => $this->rootUrl() . '/basic_image/' . $product->image,
                ];
                $orderedProducts[] = array(
                    "order_id" => $order->order_id,
                    "product_id" => $order->product_id,
                    "product" => $productObj,
                    "quantity" => $order->quantity,
                    "size" => $order->size,
                    "color" => $order->color,
                    "price" => $order->price,
                );
            }

            $data[] = array(
                "id" => $result->id,
                "order_code" => $result->order_code,
                "name" => $result->name,
                "phone" => $result->phone,
                "phone" => $result->phone,
                "email" => $result->email,
                "total_price" => $result->total_price,
                "courier_name" => $result->courier_name,
                "district" => $result->district,
                "delivery_address" => $result->delivery_address,
                "delivery_charge" => $result->delivery_charge,
                "shipping_area" => $result->shipping_area,
                "delivery_method" => $result->delivery_method,
                "coupon_code" => $result->coupon_code,
                "discount" => $result->discount,
                "status" => $result->status,
                "products" => $orderedProducts,
                "created_at" => $result->created_at,
            );
        }
        return response()->json($data);
    }
}
