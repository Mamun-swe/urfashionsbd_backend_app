<h1>Thank you for buying UR Fashions Products</h1>

<h3>Shipping Address</h3>

{{-- @if ($orderInfo)

  <p> 
   {{ $orderInfo->order_code }} <br> 
   {{  $orderInfo->user_id }} <br> 
   {{    $orderInfo->name }} <br> 
   {{  $orderInfo->phone }} <br> 
   {{  $orderInfo->email }} <br> 
   {{  $orderInfo->total_price  }} <br> 
   {{   $orderInfo->total_price }} <br> 
   {{  $orderInfo->courier_name }} <br> 
   {{   $orderInfo->district }} <br> 
   {{  $orderInfo->delivery_address }} <br> 
   {{  $orderInfo->delivery_charge }} <br> 
   {{   $orderInfo->shipping_area }} <br> 
   {{   $orderInfo->delivery_method }} <br> 
   {{   $orderInfo->coupon_code }} <br> 
   {{  $orderInfo->discount  }} <br> 
</p>
@else 
    <h3>form data not found</h3>
    
@endif --}}

@if ($ndata)
<h1>Product Details</h1>

        {{-- {{  $ndata['order_id'] }} --}}
        {{  $ndata['product_id'] }}
        {{  $ndata['quantity'] }}
        {{  $ndata['color'] }}
        {{  $ndata['size'] }}
        {{  $ndata['price'] }}



{{-- <h1>{{ $data->order_id  }}</h1> --}}

 {{-- @foreach ($data as $item)
{{ $item['order_id'] }} <br>
{{ $item['product_id'] }} <br>
{{ $item['quantity'] }} <br>
{{ $item['color'] }} <br>
@endforeach  --}}
{{-- 
<h1>{{  $orderedProduct->order_id }} <br>
    {{  $orderedProduct->product_id }}<br>
    {{  $orderedProduct->quantity }}<br>
    {{  $orderedProduct->color }} <br>
    {{  $orderedProduct->price }}
</h1> --}}
{{-- {{  $orderedProduct->product_id }}<br> --}}
    {{-- @foreach ($ndata as $item)
        {{  $item['order_id'] }}
        {{  $item['product_id'] }}
        {{  $item['quantity'] }}
        {{  $item['color'] }}
        {{  $item['size'] }}
        {{  $item['price'] }}
        <h1>
            {{  $orderedProduct->order_id }} <br>
            {{  $item->product_id }}<br>
            {{  $item->quantity }}<br>
            {{  $item->color }} <br>
            {{  $item->price }}</h1>
    @endforeach --}}

<?php

// for ($i=0; $i <count($ndata) ; $i++) { 
//    echo $ndata['order_id'] ;
//    echo $ndata['product_id']; 
//    echo $ndata['quantity'] ;
//    echo $ndata['color'] ;
//    echo $ndata['size'] ;
//    echo $ndata['price'] ;
// }


?>


{{-- {{ count($ndata) }} --}}
@else 
<h3>Product Details not found</h3>
@endif