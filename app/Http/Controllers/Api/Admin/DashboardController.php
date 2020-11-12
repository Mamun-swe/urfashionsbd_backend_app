<?php

namespace App\Http\Controllers\Api\Admin;

use App\Http\Controllers\Controller;
use App\Models\Order;
use App\Models\Product;

class DashboardController extends Controller
{
   // index
   public function index()
   {
       $total_sales = Order::where('status', '=', 'completed')->count();
       $total_orders = Order::count();
       $total_products = Product::count();
       $latest_orders = Order::orderBy('id', 'DESC')
           ->select('id', 'order_code', 'name', 'status')
           ->take(10)
           ->get();

       return response()->json([
           'total_sales' => $total_sales,
           'total_orders' => $total_orders,
           'total_products' => $total_products,
           'latest_orders' => $latest_orders,
       ], 200);
   }

   // Chart Report
   public function chartReport($year)
   {
       for ($i = 1; $i <= 12; $i++) {
           $orders = Order::where('status', 'completed')
               ->whereYear('created_at', $year)
               ->whereMonth('created_at', $i)
               ->get()->count();
           $totalOrders[] = $orders;
       }
       for ($i = 1; $i <= 12; $i++) {
           $orders = Order::where('status', 'completed')
               ->whereYear('created_at', $year)
               ->whereMonth('created_at', $i)
               ->get()->sum('total_price');
           $totalSales[] = $orders;
       }

       $arr = [
           'totalOrders' => $totalOrders,
           'totalSales' => $totalSales,
       ];
       return response()->json($arr, 200);
   }
}
