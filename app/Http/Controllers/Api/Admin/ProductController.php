<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\URL;

class ProductController extends Controller
{
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $products = array();
        $results = Product::orderBy('id', 'DESC')->get();
        foreach ($results as $result) {
            $imagesArray = array();
            $images = ProductImage::where('product_images.product_id', $result->id)->get();
            foreach ($images as $image) {
                $imagesArray[] = array(
                    "id" => $image->id,
                    "product_id" => $image->product_id,
                    "image" => $this->rootUrl() . '' . '/additional_images/' . $image->image,
                );
            }

            $products[] = array(
                "id" => $result->id,
                "name" => $result->name,
                "description" => $result->description,
                "category_id" => $result->category_id,
                "parent_category_id" => $result->parent_category_id,
                "brand" => $result->brand,
                "campaign_id" => $result->campaign_id,
                "mrp" => $result->mrp,
                "selling_price" => $result->selling_price,
                "sku" => $result->sku,
                "tags" => $result->tags,
                "track_inventory" => $result->track_inventory,
                "stock" => $result->stock,
                "quantity" => $result->quantity,
                "weight" => $result->weight ? $result->weight : null,
                "size" => $result->size,
                "color" => $result->color,
                "feature" => $result->feature,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $result->image,
                "created_at" => $result->created_at,
                "updated_at" => $result->updated_at,
                "images" => $imagesArray,
            );
        }
        return response()->json($products);
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
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $sku = Product::where('sku', $request->sku)->first();
        if ($sku) {
            return response()->json([
                'status' => false,
                'message' => 'SKU already exist',
            ]);
        }

        $file = $request->file('basic_image');
        $extension = $file->getClientOriginalExtension();
        $filename = time() . '.' . $extension;
        $file->move('basic_image', $filename);

        $form_data = array(
            'name' => $request->name,
            'description' => $request->description,
            'category_id' => $request->category_id,
            'parent_category_id' => $request->parent_category_id,
            'brand' => $request->brand,
            'campaign_id' => null,
            'mrp' => $request->mrp,
            'selling_price' => $request->selling_price,
            'sku' => $request->sku,
            'tags' => $request->tags,
            'track_inventory' => true,
            'stock' => $request->stock,
            'quantity' => $request->quantity,
            'weight' => $request->weight ? $request->weight : null,
            'size' => $request->size,
            'color' => $request->color,
            'feature' => false,
            'image' => $filename,
        );

        $product = Product::create($form_data);
        if ($request->hasFile('additional_images')) {
            foreach ($request->additional_images as $file) {
                $extension = $file->getClientOriginalExtension();
                $filename = uniqid() . '.' . $extension;
                $file->move('additional_images', $filename);

                $form_data_images = array(
                    'product_id' => $product->id,
                    'image' => $filename,
                );
                ProductImage::create($form_data_images);
            }

            return response()->json([
                'status' => true,
                'message' => 'Successfully product uploaded',
            ]);
        } else {
            return response()->json([
                'status' => true,
                'message' => 'Successfully product uploaded',
            ]);
        }

        return response()->json('Product upload failed !', 501);
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
        $record = Product::find($id);
        $record->update($request->all());
        return response()->json([
            'status' => true,
            'message' => 'Successfully product updated',
        ], 200);
    }

    // Update Basic file
    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function updateBasicFile(Request $request, $id)
    {
        $old = Product::find($id);
        if ($request->hasFile('basic_image')) {
            $file = $request->file('basic_image');
            $extension = $file->getClientOriginalExtension();
            $filename = time() . '.' . $extension;

            $old_image = public_path() . '/basic_image/' . $old->image;
            unlink($old_image);

            $file->move('basic_image', $filename);

            $form_data = array(
                'image' => $filename,
            );

            $old->update($form_data);
            return response()->json([
                'status' => true,
                'message' => 'Successfully image updated',
            ], 200);
        }

    }

    // Update Additional Files
    public function updateAdditionalFiles(Request $request)
    {
        if ($request->hasFile('additional_images')) {
            foreach ($request->additional_images as $file) {
                $extension = $file->getClientOriginalExtension();
                $filename = uniqid() . '.' . $extension;
                $file->move('additional_images', $filename);

                $form_data_images = array(
                    'product_id' => $request->id,
                    'image' => $filename,
                );
                ProductImage::create($form_data_images);
            }
        }

        return response()->json([
            'status' => true,
            'message' => 'Successfully images uploaded',
        ]);
    }

    // Remove specific image from addtitional images
    public function destroyImage($id)
    {
        $image = ProductImage::find($id);
        ProductImage::where('id', $id)->delete();
        $old_image = public_path() . '/additional_images/' . $image->image;
        unlink($old_image);
        return response()->json([
            'status' => true,
            'message' => 'Successfully image deleted.',
        ], 200);
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        $product = Product::find($id);
        $old_image = public_path() . '/basic_image/' . $product->image;
        unlink($old_image);
        $images = ProductImage::where('product_id', $id)->get();
        foreach ($images as $image) {
            $additional_old_image = public_path() . '/additional_images/' . $image->image;
            unlink($additional_old_image);
            ProductImage::where('product_id', $id)->delete();
        }
        Product::where('id', $id)->delete();

        return response()->json([
            'status' => true,
            'message' => 'Product successfully deleted.',
        ], 200);
    }

    // Search with product SKU
    public function searchProduct($sku)
    {
        $products = array();
        $results = Product::where('sku', $sku)->get();
        foreach ($results as $result) {

            // Make array from string
            $colors = explode(',', $result->color);
            $sizes = explode(',', $result->size);

            $products[] = array(
                "id" => $result->id,
                "name" => $result->name,
                "description" => $result->description,
                "category_id" => $result->category_id,
                "parent_category_id" => $result->parent_category_id,
                "brand" => $result->brand,
                "campaign_id" => $result->campaign_id,
                "mrp" => $result->mrp,
                "selling_price" => $result->selling_price,
                "sku" => $result->sku,
                "tags" => $result->tags,
                "track_inventory" => $result->track_inventory,
                "stock" => $result->stock,
                "quantity" => $result->quantity,
                "weight" => $result->weight,
                "size" => array_map('trim', $sizes),
                "color" => array_map('trim', $colors),
                "feature" => $result->feature,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $result->image,
            );
        }
        return response()->json($products, 200);
    }
}
