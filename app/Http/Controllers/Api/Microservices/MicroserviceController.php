<?php

namespace App\Http\Controllers\Api\Microservices;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Product;
use App\Models\ProductImage;
use Illuminate\Support\Facades\URL;

class MicroserviceController extends Controller
{
    public function rootUrl()
    {
        return $url = URL::to('');
    }

    // Reseller Dashboard
    public function Dashboard()
    {
        $productsTotal = Product::count();

        $products = array();
        $results = Product::orderBy('id', 'DESC')->limit(10)->get();

        foreach ($results as $result) {
            $products[] = array(
                "id" => $result->id,
                "name" => $result->name,
                "sku" => $result->sku,
                "selling_price" => $result->selling_price,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $result->image,
            );
        }

        return response()->json([
            'productsTotal' => $productsTotal,
            'products' => $products,
        ], 200);
    }

    // Search with SKU
    public function SearchBysku($sku)
    {
        $products = array();
        $results = Product::where('sku', $sku)
            ->select('id', 'name', 'sku','color','size','quantity', 'mrp', 'selling_price','image')
            ->get();
        foreach ($results as $result) {

            // Make array from string
            $colors = explode(',', $result->color);
            $sizes = explode(',', $result->size);

            $products[] = array(
                "id" => $result->id,
                "name" => $result->name,
                "sku" => $result->sku,
                "color" => array_map('trim', $colors),
                "size" => array_map('trim', $sizes),
                "quantity" => $result->quantity,
                "mrp" => $result->mrp,
                "selling_price" => $result->selling_price,
                "image" => $this->rootUrl() . '' . '/basic_image/' . $result->image,
            );
        }
        return response()->json($products, 200);
    }

    // Single Product with ID
    public function SingleProduct($id)
    {
        $data = Product::find($id);
        if (!$data) {
            return response()->json(['message' => 'Product not found'], 404);
        }

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

        // Single Product
        $product = (object) [
            "id" => $data->id,
            "name" => $data->name,
            "description" => $data->description,
            "category_id" => $data->category_id,
            "parent_category_id" => $data->parent_category_id,
            "brand" => $data->brand,
            "mrp" => $data->mrp,
            "selling_price" => $data->selling_price,
            "sku" => $data->sku,
            "tags" => $data->tags,
            "track_inventory" => $data->track_inventory,
            "stock" => $data->stock,
            "quantity" => $data->quantity,
            "weight" => $data->weight,
            "size" => $data->size,
            "color" => $data->color,
            "feature" => $data->feature,
            "image" => $this->rootUrl() . '' . '/basic_image/' . $data->image,
            "images" => $imagesArray,
        ];

        return response()->json($product, 200);
    }
}
