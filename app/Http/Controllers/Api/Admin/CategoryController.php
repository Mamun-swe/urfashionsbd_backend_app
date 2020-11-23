<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;
use Validator;

class CategoryController extends Controller
{
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    // Null Check function
    public function nullCheck($data)
    {
        if ($data == 'null') {
            return null;
        }
        return $data;
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $parentCategories = array();
        $results = Category::where('parent_id', null)->orderBy('id', 'DESC')->get();

        foreach ($results as $result) {
            $childrenArray = array();
            $children = Category::where('parent_id', $result->id)->orderBy('id', 'DESC')->get();
            foreach ($children as $child) {
                $childrenArray[] = array(
                    "id" => $child->id,
                    "parent_id" => $child->parent_id,
                    "name" => $child->name,
                    "image" => $this->rootUrl() . '' . '/categories/' . $child->image,
                    "created_at" => $child->created_at,
                    "updated_at" => $child->updated_at,
                );
            }

            $parentCategories[] = array(
                "id" => $result->id,
                "parent_id" => $result->parent_id,
                "name" => $result->name,
                "image" => $this->rootUrl() . '' . '/categories/' . $result->image,
                "created_at" => $result->created_at,
                "updated_at" => $result->updated_at,
                "children" => $childrenArray,
            );
        }

        return response()->json($parentCategories);
    }

    // All Category
    public function Allcategory()
    {
        $data = Category::all();
        return response()->json($data, 200);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $check = Category::where('name', $request->name)
            ->first();

        if ($check) {
            return response()->json(['message' => 'This category already created.'], 200);
        }

        $rules = [
            'name' => ['required', 'unique:categories'],
            'image' => 'required',
        ];

        $validator = Validator::make($request->all(), $rules);
        if ($validator->fails()) {
            return response()->json([
                'message' => $validator->messages(),
            ]);
        }
        $file = $request->file('image');
        $extension = $file->getClientOriginalExtension();
        $filename = time() . '.' . $extension;
        $file->move('categories', $filename);

        $form_data = array(
            'parent_id' => $this->nullCheck($request->parent_id),
            'name' => $request->name,
            'image' => $filename,
        );

        $store = Category::create($form_data);
        if ($store) {
            return response()->json([
                'status' => true,
                'message' => 'Category created',
            ], 200);
        }
        return response()->json([
            'status' => false,
            'message' => 'Category create failed, internal server error',
        ], 501);
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {

        $this->validate($request, [
            'name' => ['required'],
        ]);

        $category = Category::find($id);

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            $old_image = public_path() . '/categories/' . $category->image;
            unlink($old_image);
            $file->move('categories', $filename);

            $form_data = array(
                'name' => $request->name,
                'parent_id' => $this->nullCheck($request->parent_id),
                'image' => $filename,
            );

            $record = Category::find($id);
            $record->update($form_data);
            return response()->json([
                'status' => true,
                'message' => 'Successfully category updated',
            ], 200);

        } else {
            $form_data = array(
                'name' => $request->name,
                'parent_id' => $this->nullCheck($request->parent_id),
            );

            $record = Category::find($id);
            $record->update($form_data);
            return response()->json([
                'status' => true,
                'message' => 'Successfully category updated',
            ], 200);
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $category = Category::find($id);
        Category::where('id', $id)->delete();
        $old_image = public_path() . '/categories/' . $category->image;
        unlink($old_image);
        return response()->json([
            'status' => true,
            'message' => 'Category and clild categories successfully deleted.',
        ], 200);
    }
}
