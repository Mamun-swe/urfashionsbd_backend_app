<?php

namespace App\Http\Controllers\Api\VisitorPages;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\Review;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Validator;

class ReviewController extends Controller
{
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    // All Review
    public function index()
    {
        $reviews = array();
        $results = Review::orderBy('id', 'DESC')->get();
        foreach ($results as $result) {
            $data = Product::where('id', $result->product_id)->first();
            $product = (object) [
                "id" => $data->id,
                "name" => $data->name,
                "brand" => $data->brand,
                "sku" => $data->sku,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $data->image,
            ];

            $reviews[] = array(
                "id" => $result->id,
                "name" => $result->name,
                "email" => $result->email,
                "rating" => $result->rating,
                "comment" => $result->comment,
                "status" => $result->status,
                "product" => $product,
            );
        }

        return response()->json($reviews, 200);
    }

    // Update Review Status
    public function changeStatus(Request $request, $id)
    {
        if (!$request->status) {
            return response()->json(['message' => 'Status is required'], 422);
        }

        $data = Review::where('id', '=', $id)->first();
        if ($data) {
            $result = Review::where('id', $data->id)->update(['status' => $request->status]);
            if ($result) {
                return response()->json(['message' => 'success'], 200);
            }
        } else {
            return response()->json([
                'message' => 'Review not found',
            ], 404);
        }
    }

    // Create Review
    public function create(Request $request)
    {
        $check = Review::where('email', $request->email)
            ->where('product_id', $request->product_id)
            ->first();

        if ($check) {
            return response()->json(['message' => 'You already subimitted a review.'], 208);
        }

        $rules = [
            'product_id' => 'required',
            'name' => 'required',
            'email' => 'required|string|email',
            'rating' => 'required',
            'comment' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ], 422);
        }

        $form_data = array(
            'product_id' => $request->product_id,
            'user_id' => $request->user_id ? $request->user_id : null,
            'name' => $request->name,
            'email' => $request->email,
            'rating' => $request->rating,
            'comment' => $request->comment,
        );

        $result = Review::create($form_data);
        if ($result) {
            return response()->json(['status' => true, 'message' => 'Your review submitted.'], 200);
        }
        return response()->json(['status' => false, 'message' => 'Your review not submitted.'], 501);
    }
}
