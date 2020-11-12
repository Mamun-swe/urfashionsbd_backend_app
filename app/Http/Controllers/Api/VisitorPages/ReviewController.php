<?php

namespace App\Http\Controllers\Api\VisitorPages;

use App\Models\Review;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Validator;

class ReviewController extends Controller
{
     // All Review
     public function index()
     {
         $results = Review::orderBy('id', 'DESC')->get();
         return response()->json($results, 200);
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
 
         if($check){
             return response()->json(['message'=>'You already subimitted a review.'], 208);
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
         if($result){
             return response()->json(['status'=> true, 'message'=> 'Your review submitted.'], 200);
         }
         return response()->json(['status'=> false, 'message'=> 'Your review not submitted.'], 501);
     }
}
