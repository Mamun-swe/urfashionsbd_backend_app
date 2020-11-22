<?php

namespace App\Http\Controllers\Api\VisitorPages;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\ContactMail;
use App\Models\Coupon;
use App\Models\Order;
use App\Models\OrderedProducts;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Review;
use App\Models\Slider;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\URL;
use Validator;

// use Mail;

class HomePageController extends Controller
{

    // root URL
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

    // Homepage
    public function index()
    {
        // Categories with children category
        $categories = array();
        $cat_results = Category::where('parent_id', null)->orderBy('id', 'ASC')->get();

        foreach ($cat_results as $result) {
            $childrenArray = array();
            $children = Category::where('parent_id', $result->id)->orderBy('id', 'ASC')->get();
            foreach ($children as $child) {
                $childrenArray[] = array(
                    "id" => $child->id,
                    "parent_id" => $child->parent_id,
                    "name" => $child->name,
                    "image" => $this->rootUrl() . '' . '/categories/' . $child->image,
                );
            }

            $categories[] = array(
                "id" => $result->id,
                "parent_id" => $result->parent_id,
                "name" => $result->name,
                "image" => $this->rootUrl() . '' . '/categories/' . $result->image,
                "children" => $childrenArray,
            );
        }

        // Sliders
        $sliders = array();
        $slider_results = Slider::orderBy('id', 'DESC')->get();
        foreach ($slider_results as $slider) {
            $sliders[] = array(
                "id" => $slider->id,
                "name" => $slider->name,
                "image" => $this->rootUrl() . '' . '/SliderImage/' . $slider->image,
            );
        }

        // Latest Products
        $latestProducts = array();
        $latest_results = Product::inRandomOrder()->limit(12)->get();
        foreach ($latest_results as $latest) {
            // Make array from string
            $colors = explode(',', $latest->color);
            $sizes = explode(',', $latest->size);

            $latestProducts[] = array(
                "id" => $latest->id,
                "name" => $latest->name,
                "description" => $latest->description,
                "category_id" => $latest->category_id,
                "parent_category_id" => $latest->parent_category_id,
                "brand" => $latest->brand,
                "campaign_id" => $latest->campaign_id,
                "mrp" => $latest->mrp,
                "selling_price" => $latest->selling_price,
                "sku" => $latest->sku,
                "tags" => $latest->tags,
                "track_inventory" => $latest->track_inventory,
                "stock" => $latest->stock,
                "quantity" => $latest->quantity,
                "weight" => $latest->weight,
                "size" => array_map('trim', $sizes),
                "color" => array_map('trim', $colors),
                "feature" => $latest->feature,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $latest->image,
            );
        }

        return response()->json([
            "categories" => $categories,
            "sliders" => $sliders,
            "latestProducts" => $latestProducts,
        ], 200);
    }

    // Only Categories with Childrens
    public function categoriesWithChildrens()
    {
        $categories = array();
        $cat_results = Category::where('parent_id', null)->orderBy('id', 'ASC')->get();

        foreach ($cat_results as $result) {
            $childrenArray = array();
            $children = Category::where('parent_id', $result->id)->orderBy('id', 'ASC')->get();
            foreach ($children as $child) {
                $childrenArray[] = array(
                    "id" => $child->id,
                    "parent_id" => $child->parent_id,
                    "name" => $child->name,
                    "image" => $this->rootUrl() . '' . '/categories/' . $child->image,
                );
            }

            $categories[] = array(
                "id" => $result->id,
                "parent_id" => $result->parent_id,
                "name" => $result->name,
                "image" => $this->rootUrl() . '' . '/categories/' . $result->image,
                "children" => $childrenArray,
            );
        }

        return response()->json([
            "categories" => $categories,
        ], 200);
    }

    // Products of a Category
    public function productsOfCategory($id)
    {
        $products = array();
        $category = Category::where('id', '=', $id)->first();
        if (!$category) {
            return response()->json(["message" => "Category not found"], 501);
        }

        $categoryProducts = Product::where('category_id', $category->id)
            ->orWhere('parent_category_id', $category->id)
            ->inRandomOrder()
            ->get();

        foreach ($categoryProducts as $product) {
            // Make array from string
            $colors = explode(',', $product->color);
            $sizes = explode(',', $product->size);

            $products[] = array(
                "id" => $product->id,
                "name" => $product->name,
                "description" => $product->description,
                "category_id" => $product->category_id,
                "parent_category_id" => $product->parent_category_id,
                "brand" => $product->brand,
                "campaign_id" => $product->campaign_id,
                "mrp" => $product->mrp,
                "selling_price" => $product->selling_price,
                "sku" => $product->sku,
                "tags" => $product->tags,
                "track_inventory" => $product->track_inventory,
                "stock" => $product->stock,
                "quantity" => $product->quantity,
                "weight" => $product->weight,
                "size" => array_map('trim', $sizes),
                "color" => array_map('trim', $colors),
                "feature" => $product->feature,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $product->image,
            );
        }

        return response()->json($products, 200);
    }

    // Single Product
    public function singleProduct($id)
    {
        $data = Product::find($id);
        if ($data) {
            // Additional images
            $imagesArray = array();
            $images = ProductImage::where('product_id', $data->id)->get();
            foreach ($images as $image) {
                $imagesArray[] = array(
                    "id" => $image->id,
                    "product_id" => $image->product_id,
                    "image" => $this->rootUrl() . '' . '/additional_images/' . $image->image,
                );
            }

            // Reviews
            $reviewsArray = array();
            $reviews = Review::where('product_id', $id)
                ->where('status', 'approved')
                ->orderBy('id', 'DESC')
                ->get();
            foreach ($reviews as $review) {
                $reviewsArray[] = array(
                    "id" => $review->id,
                    "name" => $review->name,
                    "rating" => $review->rating,
                    "comment" => $review->comment,
                );
            }

            // Related Products
            $products = array();
            $result = Product::where('stock', 1)
                ->where('id', '!=', $data->id)
                ->where('name', 'like', '%' . $data->name . '%')
                ->orWhere('sku', 'like', '%' . $data->name . '%')
                ->orWhere('tags', 'like', '%' . $data->name . '%')
                ->get();

            foreach ($result as $product) {
                $products[] = array(
                    "id" => $product->id,
                    "name" => $product->name,
                    "description" => $product->description,
                    "category_id" => $product->category_id,
                    "parent_category_id" => $product->parent_category_id,
                    "brand" => $product->brand,
                    "campaign_id" => $product->campaign_id,
                    "mrp" => $product->mrp,
                    "selling_price" => $product->selling_price,
                    "sku" => $product->sku,
                    "tags" => $product->tags,
                    "track_inventory" => $product->track_inventory,
                    "stock" => $product->stock,
                    "quantity" => $product->quantity,
                    "weight" => $product->weight,
                    "size" => $product->size,
                    "color" => $product->color,
                    "feature" => $product->feature,
                    "image" => $this->rootUrl() . '' . '/basic_image/' . $product->image,
                );
            }

            // Make array from string
            $colors = explode(',', $data->color);
            $sizes = explode(',', $data->size);

            // Single Product
            $product = (object) [
                "id" => $data->id,
                "name" => $data->name,
                "description" => $data->description,
                "category_id" => $data->category_id,
                "parent_category_id" => $data->parent_category_id,
                "brand" => $data->brand,
                "campaign_id" => $data->campaign_id,
                "mrp" => $data->mrp,
                "selling_price" => $data->selling_price,
                "sku" => $data->sku,
                "tags" => $data->tags,
                "track_inventory" => $data->track_inventory,
                "stock" => $data->stock,
                "quantity" => $data->quantity,
                "weight" => $data->weight,
                "size" => array_map('trim', $sizes),
                "color" => array_map('trim', $colors),
                "feature" => $data->feature,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $data->image,
                "images" => $imagesArray,
                "reviews" => $reviewsArray,
                "relatedProducts" => $products,
            ];

            return response()->json($product, 200);
        }

        return response()->json(['message' => 'Product not found'], 204);
    }

    // Search Product
    public function searchProducts($key)
    {
        $products = array();
        $result = Product::where('stock', 1)
            ->where('name', 'like', '%' . $key . '%')
            ->orWhere('sku', 'like', '%' . $key . '%')
            ->orWhere('tags', 'like', '%' . $key . '%')
            ->get();

        foreach ($result as $product) {
            // Make array from string
            $colors = explode(',', $product->color);
            $sizes = explode(',', $product->size);

            $products[] = array(
                "id" => $product->id,
                "name" => $product->name,
                "description" => $product->description,
                "category_id" => $product->category_id,
                "parent_category_id" => $product->parent_category_id,
                "brand" => $product->brand,
                "campaign_id" => $product->campaign_id,
                "mrp" => $product->mrp,
                "selling_price" => $product->selling_price,
                "sku" => $product->sku,
                "tags" => $product->tags,
                "track_inventory" => $product->track_inventory,
                "stock" => $product->stock,
                "quantity" => $product->quantity,
                "weight" => $product->weight,
                "size" => array_map('trim', $sizes),
                "color" => array_map('trim', $colors),
                "feature" => $product->feature,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $product->image,
            );
        }

        return response()->json($products, 200);
    }

    // Get Coupon
    public function getCoupon($code)
    {
        $coupon = Coupon::where('code', $code)->first();
        if ($coupon) {
            if ($coupon->validation_date < Carbon::today()) {
                return response()->json(null, 'coupon has been expired', 208);
            }
            return response()->json($coupon, 200);
        }
        return $this->sendError(null, 'coupon not valid');
    }

    // Confirm Order
    public function confirmOrder(Request $request)
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

        $orderCode = $this->randomCode();
        $form_data = array(
            'order_code' => $orderCode,
            'user_id' => $request->id ? $request->id : null,
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
            'coupon_code' => $request->coupon_code ? $request->coupon_code : null,
            'discount' => $request->discount ? $request->discount : null,
        );

        $result = Order::create($form_data);
        if ($result) {
            $orderedProduct = new OrderedProducts();

            foreach ($request->products as $product) {
                $orderedProduct->order_id = $result->id;
                $orderedProduct->product_id = $product['id'];
                $orderedProduct->quantity = $product['quantity'];
                $orderedProduct->color = $product['color'];
                $orderedProduct->size = $product['size'];
                $orderedProduct->price = $product['price'];
                $orderedProduct->save();

            }

            if ($request->email) {
                Mail::send('Mail.orderInvoice', ['ndata' => $request, 'orderCode' => $orderCode, 'productInfo' => $request->products], function ($message) use ($request) {
                    $message->to($request->email, 'user')->subject('Order Confirmation');
                    $message->from('billing@urfashionsbd.com', 'UR Fashion');
                });
                if (Mail::failures()) {
                    return response()->json([
                        'status' => false,
                        'message' => 'Failed! Internal Server Error',
                    ], 501);
                }
            }

            $url = "http://bangladeshsms.com/smsapi";
            $data = [
                "api_key" => "R60013405f958b54ab81b9.45973387 ",
                "type" => "{content type}",
                "contacts" => $request->phone,
                "senderid" => "8809612446650",
                "msg" => "Thank you for your new order from UR Fashions. Your order number:".$orderCode."Hotline: 01918836801 Regards! https://urfashionsbd.com",
            ];
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, 1);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $response = curl_exec($ch);
            curl_close($ch);

            return response()->json($this->randomCode(), 200);
        }
    }

    // Contact Mail Send
    public function sendEmail(Request $request)
    {

        $rules = [
            'name' => 'required|string',
            'email' => 'required|string|email',
            'phone' => 'required|string|max:255|regex:/(01)[0-9]{9}/',
            'subject' => 'required|string',
            'message' => 'required|string',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ], 422);
        }

        $data = new ContactMail();
        $data->name = $request->get('name');
        $data->email = $request->get('email');
        $data->phone = $request->get('phone');
        $data->subject = $request->get('subject');
        $data->message = $request->get('message');

        Mail::send('Mail.index', compact('data'), function ($message) use ($data) {
            $message->from($data->email, $data->name);
            $message->to('billing@urfashionsbd.com', 'UR Fashion')->subject($data->subject);

        });

        if (Mail::failures()) {
            return response()->json([
                'status' => false,
                'message' => 'Failed! Internal Server Error',
            ], 501);
        }

        return response()->json([
            'status' => true,
            'message' => 'Success! Mail Send Successful',
        ], 200);
    }

}
