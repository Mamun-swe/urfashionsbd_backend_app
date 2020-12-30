<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>Ur Fashion Email</title>
</head>

<body >
  <div style="width: 700px;margin: auto;background-color: #80808024;height: auto;padding: 20px;">
    <div class="container">
      <div style="text-align: center;">
          <img src="https://urfashionsbd.com/static/media/logo.4307c02b.png" style="width: 75px;">
          <h1>UR Fashion</h1>
          <p>35/A Purana Palton Line (V I P Road,<br> Opposite of
            Ananda Bhoban- near City Bank),<br> 1000 Dhaka,
            Dhaka Division, Bangladesh<br> <a href="tel:+880 1918-836801">Phone: +880
              1918-836801</a> <br> <a href="mailto:urfashionbd@gmail.com"
             >Email: urfashionbd@gmail.com</a> </p>
      </div>
  </div>
  <div class="container" style="padding-top: 40px;">
    <div style="float: left;">
          <h5>Bill To:</h5>
          @if ($ndata)

          <p><strong>Name            :  </strong> {{ $ndata->name }} <br>
            <strong>Phone            :  </strong> {{ $ndata->phone }} <br>
            <strong>Email            :  </strong> {{ $ndata->email }}<br>
            <strong>District         :  </strong> {{ $ndata->district }}<br>
            <strong>Shipping Area    :  </strong> {{ $ndata->shipping_area }}<br>
            <strong>Delivery Address :  </strong> {{ $ndata->delivery_address }} <br>
            <strong>Courier          :  </strong>{{ $ndata->courier_name }} <br>
          </p>
      </div>
        <div style="width: 200px; padding-left: 60px;margin-left: auto;">
          <h5>Order Details</h5>

         <p>Invoice         :  @if ( $orderCode) {{ $orderCode }}  @endif<br>
            Order Status    :   pending <br>
            Delivery Method :   {{ $ndata->delivery_method }} <br>
            Coupon Code     :   {{ $ndata->coupon_code }}<br>
            Order Date      :   <?php echo date("Y/m/d"); ?>
          </p>
        </div>
    </div>
    <div class="container" style="padding-top: 40px;">
      <style>
          table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
          }
      </style>
      <table style="width: 100%;">
        <thead>
          <tr>
            <th style="text-align: start;">Name</th>
            <th style="text-align: start;">SKU</th>
            <th style="text-align: start;" >size</th>
            <th style="text-align: start;">Color</th>
            <th style="text-align: start;">Quantity</th>
            <th style="text-align: start;">Price</th>
          </tr>
        </thead>
        <tbody>
       @foreach ($productInfo as $item)
         <tr>
            <td>{{ $item['name'] }}</td>
            <td>{{ $item['sku'] }}</td>
            <td>{{ $item['size'] }}</td>
            <td>
              <span
                style="width: 20px; height: 20px; background: <?php echo $item['color']; ?>;display:block;"
              >
            </span>
            </td>
            <td>{{ $item['quantity'] }}</td>
            <td>{{ $item['selling_price'] }}</td>
          </tr>
          @endforeach
        </tbody>
      </table>
  </div>

  <div class="container" style="padding-top: 20px;">
    <div style="margin-left: auto;padding-right: 40px; width: 112px;">
          <p>SubTotal       : {{ $ndata->total_price - $ndata->delivery_charge }}<br>
            Discount        : {{ $ndata->discount }}<br>
            Delivery        : {{ $ndata->delivery_charge }}<br>
          </p>
          <h4>Total : {{ $ndata->total_price - $ndata->discount }} Tk</h4>
        </div>
    </div>
  @endif
  </div>
</body>

</html>