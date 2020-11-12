<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Coupon;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Validator;

class CouponController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {

        $data = Coupon::all();
        if ($data) {
            return response()->json([
                'status' => true,
                'coupons' => $data,
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => "coupon not found",
        ], 404);
    }

    /**
     * Coupon request from user site
     * @param $code
     *
     *
     * @return \Illuminate\Http\JsonResponse
     */

    public function getCoupon($code)
    {
        $coupon = Coupon::where('code', $code)->first();
        if ($coupon) {
            if ($coupon->validation_date < Carbon::today()) {
                return response()->json([
                    'status' => false,
                    'message' => 'Sorry! coupon has been expired',
                ], 410);
            }
            return response()->json([
                'status' => true,
                'message' => 'Success! reading coupon with code',
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => 'Failed! Coupon Not Found',
        ], 404);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $rules = ([
            'type' => 'required',
            'name' => 'required|unique:coupons',
            'code' => 'required|unique:coupons',
        ]);

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                "status" => false,
                "message" => "This coupon Already created",
            ], 501);
        }

        $coupon = new Coupon();
        $coupon->name = $request->name;
        $coupon->code = $request->code;
        $coupon->type = $request->type;
        $coupon->discount_amount = $request->discount_amount;
        $coupon->discount_percent = $request->discount_percent;
        $coupon->validation_date = $request->validation_date;

        $response = $coupon->save();
        if ($response) {
            return response()->json([
                'status' => true,
                'message' => "Successfully coupon created.",
            ], 200);
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Coupon  $coupon
     * @return \Illuminate\Http\JsonResponse
     */
    public function show(Coupon $coupon)
    {
        $coupon = Coupon::find($coupon);
        if ($coupon) {
            return response()->json([
                'status' => true,
                'message' => "Success! Coupon show successfully",
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => "Failed! data not fount",
        ], 404);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Coupon  $coupon
     * @return \Illuminate\Http\Response
     */
    public function edit(Coupon $coupon)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param \Illuminate\Http\Request $request
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     * @throws \Illuminate\Validation\ValidationException
     */
    public function update(Request $request, $id)
    {
        $this->validate($request, [
            'type' => 'required',
            'name' => 'required',
            'code' => 'required',
        ]);
        $coupon = Coupon::find($id);
        $coupon->name = $request->name;
        $coupon->code = $request->code;
        $coupon->type = $request->type;
        $coupon->discount_percent = $request->discount_percent;
        $coupon->discount_amount = $request->discount_amount;
        $coupon->validation_date = $request->validation_date;
        $coupon->type == 'fixed' ?
        $coupon->discount_percent = null :
        $coupon->discount_amount = null;

        $update = $coupon->save();
        if ($update) {
            return response()->json([
                'status' => true,
                'message' => "Successfully coupon updated",
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => "Failed! Coupon update failed",
        ], 501);

    }

    /**
     * Remove the specified resource from storage.
     *
     * @param $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $coupon = Coupon::find($id);
        if ($coupon) {
            $coupon->delete();
            return response()->json([
                'status' => true,
                'message' => 'Successfully coupon deleted',
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => 'Coupon Not found',
        ], 404);

    }
}
