<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderedProducts;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class OrderController extends Controller
{
   // Root URL
   public function rootUrl()
   {
       return $url = URL::to('');
   }

   // All Orders
   public function index()
   {
       $data = array();
       $results = Order::orderBy('id', 'DESC')->get();
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
           );
       }
       return response()->json($data);
   }

   // Change Status
   public function changeStatus(Request $request, $id)
   {
       if (!$request->status) {
           return response()->json(['message' => 'Status is required'], 422);
       }

       $data = Order::where('id', '=', $id)->first();
       if ($data) {
           $result = Order::where('id', $data->id)->update(['status' => $request->status]);
           if ($result) {
               return response()->json(['message' => 'success'], 200);
           }
       } else {
           return response()->json([
               'message' => 'Order not found',
           ], 404);
       }
   }
}
