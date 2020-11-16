<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\OrderedProducts;
use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Validator;

class OrderController extends Controller
{
   // Root URL
   public function rootUrl()
   {
       return $url = URL::to('');
   }

   // Random Order Code
   public function randomCode()
   {
       $id = random_int(100, 10000);
       $result = 'UR' . $id;
       return $result;
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
               ->select('name', 'brand', 'mrp', 'selling_price', 'size', 'color', 'image')
               ->first();

               // Make array from string
                $colors = explode(',', $product->color);
                $sizes = explode(',', $product->size);

                $productObj = (object) [
                    'name' => $product->name,
                    'brand' => $product->brand,
                    'mrp' => $product->mrp,
                    'selling_price' => $product->selling_price,
                    'size' => array_map('trim', $sizes),
                    'color' => array_map('trim', $colors),
                    'image' => $this->rootUrl() . '/basic_image/' . $product->image,
                ];
                $orderedProducts[] = array(
                    'id' => $order->id,
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

    // Create Order
    public function CreateOrder(Request $request)
    {
        $rules = [
            'name' => 'required|string',
            'phone' => 'required|string|max:255|regex:/(01)[0-9]{9}/',
            'district' => 'required|string',
            'delivery_address' => 'required|string',
            'courier_name' => 'required|string',
            'shipping_area' => 'required|string',
            'delivery_method' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ], 422);
        }

        $form_data = array(
            'order_code' => $this->randomCode(),
            'name' => $request->name,
            'phone' => $request->phone,
            'email' => $request->email ? $request->email : null,
            'total_price' => $request->total_price,
            'courier_name' => $request->courier_name,
            'district' => $request->district,
            'delivery_address' => $request->delivery_address,
            'delivery_charge' => $request->delivery_charge,
            'shipping_area' => $request->shipping_area,
            'delivery_method' => $request->delivery_method,
            'status' => $request->order_status,
            'coupon_code' => $request->coupon_code ? $request->coupon_code : null,
            'discount' => $request->discount ? $request->discount : null,
        );

        $result = Order::create($form_data);
        if ($result) {
            foreach ($request->products as $product) {
                $orderedProduct = new OrderedProducts();
                $orderedProduct->order_id = $result->id;
                $orderedProduct->product_id = $product['id'];
                $orderedProduct->quantity = $product['quantity'];
                $orderedProduct->color = $product['color'];
                $orderedProduct->size = $product['size'];
                $orderedProduct->price = $product['selling_price'];
                $orderedProduct->save();
            }

            return response()->json([
                'status' => true,
                'message' => 'Successfully order created.'
            ], 200);
        }
    }

    // Edit Order
    public function EditOrder(Request $request, $id)
    {
        $data = Order::where('id', '=', $id)->first();
        if ($data) {
            $result = Order::where('id', $data->id)->update($request->all());
            if ($result) {
                return response()->json(['message' => 'Successfully updated.'], 200);
            }
        }
    }

     // Edit Ordered Product
     public function EditOrderedProduct(Request $request, $id)
     {
         $data = OrderedProducts::where('id', $id)->first();
         if ($data) {
             $result = OrderedProducts::where('id', $id)->update($request->all());
             if ($result) {
                 return response()->json(['message' => 'Successfully updated.'], 200);
             }
         }
     }
}
