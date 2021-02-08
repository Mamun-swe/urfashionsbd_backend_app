<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\Subscriber;
use Illuminate\Http\Request;
use Validator;

class SubscriberController extends Controller
{
    // Get subscribers
    public function index()
    {
        $data = Subscriber::select('id', 'email')->orderBy('id', 'DESC')->paginate(20);
        if (count($data) > 0) {
            return response()->json([
                'status' => true,
                'subscribers' => $data,
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => 'Opps! subscribers not found.',
        ], 404);
    }

    // Create subscribers
    public function create(Request $request)
    {
        if (!$request->email) {
            return response()->json([
                "message" => "E-mail is required.",
            ], 501);
        }

        $rules = ([
            'email' => 'required|unique:subscribers',
        ]);

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                "status" => false,
                "message" => "This e-mail already used.",
            ], 501);
        }

        $form_data = array(
            'email' => $request->email,
        );

        $subscriber = Subscriber::create($form_data);
        if ($subscriber) {
            return response()->json(['message' => 'Succesfully subscribed us.'], 200);
        }
        return response()->json([
            'message' => 'Failed to subscribed.',
        ], 204);

    }
}
