<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderedProducts;
use App\Models\Product;
use Carbon\Carbon;
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
            $data[] = array(
                "id" => $result->id,
                "order_code" => $result->order_code,
                "name" => $result->name,
                "phone" => $result->phone,
                "total_price" => $result->total_price,
                "partial_payment" => $result->partial_payment,
                "shipping_area" => $result->shipping_area,
                "delivery_method" => $result->delivery_method,
                "status" => $result->status,
            );
        }
        return response()->json($data);
    }

    // Show Single Product
    public function ShowProduct(Request $request, $id)
    {
        $orderedProducts = array();
        $result = Order::where('id', $id)->first();
        $orders = OrderedProducts::where('order_id', $result->id)->get();
        $coupon = Coupon::where('code', $result->coupon_code)->select('type')->first();
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

        $data = (object) [
            "id" => $result->id,
            "order_code" => $result->order_code,
            "name" => $result->name,
            "phone" => $result->phone,
            "email" => $result->email,
            "total_price" => $result->total_price,
            "partial_payment" => $result->partial_payment,
            "courier_name" => $result->courier_name,
            "district" => $result->district,
            "delivery_address" => $result->delivery_address,
            "delivery_charge" => $result->delivery_charge,
            "shipping_area" => $result->shipping_area,
            "delivery_method" => $result->delivery_method,
            "coupon_code" => $result->coupon_code,
            "coupon_type" => $coupon ? $coupon->type : null,
            "discount" => $result->discount,
            "status" => $result->status,
            "products" => $orderedProducts,
        ];

        $this->PriceUpdate($id);

        return response()->json($data, 200);
    }

    // Update Total Price
    public function PriceUpdate($order_id)
    {
        $total = 0;
        $products = OrderedProducts::where('order_id', $order_id)->get();
        foreach ($products as $product) {
            $total += $product->quantity * $product->price;
        }

        $order = Order::where('id', $order_id)->first();
        if ($order->coupon_code) {
            $coupon = Coupon::where('code', $order->coupon_code)->select('type')->first();
            if ($coupon->type == 'fixed') {
                $total = $total - $order->discount;
            }
            if ($coupon->type == 'percent') {
                $total = ($total * $order->discount) / 100;
            }
        }

        $order->total_price = $total;

        $action = $order->update();
        if ($action) {
            return true;
        }
        return false;

    }

    // Add Product into order
    public function AddProduct(Request $request)
    {
        $rules = [
            'order_id' => 'required',
            'product_id' => 'required',
            'quantity' => 'required',
            'size' => 'required',
            'color' => 'required',
            'price' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ], 422);
        }

        $result = OrderedProducts::create($request->all());
        if ($result) {
            $this->PriceUpdate($request->order_id);
        }
        return response()->json(['status' => true, 'message' => 'Successfully product added'], 200);
    }

    // Remove Product
    public function DestroyProduct($id)
    {
        $order = OrderedProducts::where('id', $id)->first();
        $result = OrderedProducts::where('id', $id)->delete();
        if ($result) {
            $this->PriceUpdate($order->order_id);
        }
        return response()->json(['status' => true, 'message' => 'Product successfully deleted.'], 200);
    }

    // Edit Ordered Product
    public function EditOrderedProduct(Request $request, $id)
    {
        $data = OrderedProducts::where('id', $id)->first();
        if ($data) {
            $result = OrderedProducts::where('id', $id)->update($request->all());
            if ($result) {
                $this->PriceUpdate($data->order_id);
            }
            return response()->json(['message' => 'Successfully updated.'], 200);
        }
    }

    // Apply Coupon
    public function ApplyCoupon(Request $request)
    {
        $coupon = Coupon::where('code', $request->coupon_code)->first();
        if (!$coupon) {
            return response()->json([
                'status' => false,
                'message' => 'Coupon not found',
            ], 404);
        }

        if ($coupon->validation_date < Carbon::today()) {
            return response()->json([
                'status' => false,
                'message' => 'coupon has been expired',
            ], 208);
        }

        $apply = Order::where('id', $request->order_id)
            ->update([
                'coupon_code' => $coupon->code,
                'discount' => $coupon->discount_percent ? $coupon->discount_percent : $coupon->discount_amount,
            ]);

        if ($apply) {
            $this->PriceUpdate($request->order_id);
            return response()->json([
                'status' => true,
                'message' => 'Coupon successfully applied',
                $request->all(),
                $coupon,
            ], 200);
        }
    }

    // Add Partial Payment
    public function PartialPayment(Request $request)
    {
        if (!$request->partial_payment) {
            return response()->json([
                'status' => false,
                'message' => 'Partial payment is required.',
            ], 422);
        }

        $check = Order::where('id', $request->order_id)->first();
        if (!$check) {
            return response()->json([
                'status' => false,
                'message' => 'Opps! Order not found.',
            ], 404);
        }

        $check->update(['partial_payment' => $request->partial_payment]);
        return response()->json([
            'status' => true,
            'message' => 'Partial payment added.',
        ], 200);

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
                'message' => 'Successfully order created.',
            ], 200);
        }
    }

    // Edit Ordered Customer Details
    public function EditOrderedCustomer(Request $request, $id)
    {
        $data = Order::where('id', '=', $id)->first();
        if ($data) {
            $result = Order::where('id', $data->id)->update($request->all());
            if ($result) {
                return response()->json(['message' => 'Successfully updated.'], 200);
            }
        }
    }

}
