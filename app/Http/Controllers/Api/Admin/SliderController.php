<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Slider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class SliderController extends Controller
{
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function index()
    {
        $sliders = array();
        $results = Slider::all();
        if (count($results) > 0) {
            foreach ($results as $result) {
                $sliders[] = array(
                    "id" => $result->id,
                    "category_id" => $result->category_id,
                    "name" => $result->name,
                    "image" => $this->rootUrl() . '' . '/SliderImage/' . $result->image,
                );
            }
            return response()->json($sliders, 200);
        }
        return response()->json(['status' => false, 'message' => 'Opps ! Slider not found.'], 404);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\JsonResponse
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'name' => ['required', 'unique:sliders'],
            'image' => 'required',
        ]);
        $slider = new Slider();
        $slider->category_id = $request->category_id;
        $slider->name = $request->name;
        if ($request->file('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $fileName = time() . '.' . $extension;
            $file->move('SliderImage', $fileName);
            $slider->image = $fileName;
            $data = $slider->save();
            if ($data) {
                return response()->json([
                    'status' => true,
                    'message' => 'Successfully slider created.',
                ], 200);
            }
            return response()->json([
                'status' => true,
                'message' => 'Failed! Server Error',
            ], 501);
        }
        return response()->json([
            'status' => true,
            'message' => 'Sorry! Data not Found',
        ], 404);
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function show(Slider $slider)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function edit(Slider $slider)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Models\Slider  $slider
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Slider $slider)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Slider $id
     * @return \Illuminate\Http\JsonResponse
     */
    public function destroy($id)
    {
        $slider = Slider::find($id);
        $old_image = public_path() . '/SliderImage/' . $slider->image;
        unlink($old_image);
        Slider::where('id', $id)->delete();
        return response()->json([
            'status' => true,
            'message' => 'Slider successfully deleted.',
        ], 200);
    }
}
