<!doctype html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css">

  <title>Ur Fashion Email</title>
</head>

<body style="width: 100%;">
  <div class="container"
    style="background-color: #01028f ;width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;">
    <div class="container"
      style="width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;">
      <div class=" bd-highlight "
        style="color: white; padding-top: 40px;display: flex!important;box-sizing: border-box;">
        <div class="p-2 bd-highlight">
          <img src="https://urfashionsbd.com/static/media/logo.66f865ce.png" style="width: 75px;">
          <h1 style="padding-top: 5px">Invoice</h1>
        </div>
        <div class=" bd-highlight"
          style="color: white;margin-left: auto!important;padding: .5rem!important;box-sizing: border-box; margin-right: 58px;">
          <h1>UR Fashion</h1>
          <p>35/A Purana Palton,<br>Dhaka 1000<br><a href="tel:+880 1918-836801" style="color: white;">+880
              1918-836801</a> <br> <a href="mailto:urfashionbd@gmail.com"
              style="color: white;">urfashionbd@gmail.com</a> </p>
        </div>
      </div>
    </div>
  </div>
  <div class="container"
    style="background-color: #f1f0f0;width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto; ">
    <div class="container"
      style="width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;padding-bottom: 20px">
      <div class=" bd-highlight mb-3"
        style="color: black; padding-top: 20px;margin-bottom: 1rem!important; display: flex!important;box-sizing: border-box;width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;">
        <div class="p-2 bd-highlight">
          <h5>Bill To:</h5>
          @if ($ndata)
              
          <p><strong>Name:</strong> {{ $ndata->name }} <br>
            <strong>Phone:</strong> {{ $ndata->phone }} <br>
            <strong>Email:</strong> {{ $ndata->email }}<br>
            <strong>District:</strong> {{ $ndata->district }}<br>
            <strong>Shipping Area:</strong> {{ $ndata->shipping_area }}<br>
            <strong>Delivery Address:</strong> {{ $ndata->delivery_address }} <br>
            <strong>Courier:</strong>{{ $ndata->delivery_method }} <br>
          </p>
        </div>
        <div class="bd-highlight" style="color: black;margin-left: auto!important;padding: .5rem!important;margin-right: 58px;">
        
          <p>
            @if ( $orderCode)
            <strong>Invoice: {{ $orderCode }}</strong> <br>
            @endif
            <strong>Date: 10/12/2020</strong>
          </p>
        </div>
      </div>

      <style>
        .table thead th {
          vertical-align: bottom;
          border-bottom: 2px solid #dee2e6 !important;
        }

        .table td,
        .table th {
          padding: .75rem;
          vertical-align: top;
          border-top: 1px solid #dee2e6 !important;
        }

        th {
          text-align: inherit;
          text-align: -webkit-match-parent;
        }

        tr {
          display: table-row;
          vertical-align: inherit;
          border-color: inherit;
        }

        thead {
          display: table-header-group;
          vertical-align: middle;
          border-color: inherit;
        }

        tbody {
          display: table-row-group;
          vertical-align: middle;
          border-color: inherit;
        }
      </style>

      <table class="table" style="width: 100%;margin-bottom: 0rem;color: #212529;border-collapse: collapse;display: table; border-spacing: 2px;
border-color: grey;  ">
        <thead>
          <tr>
            <th style="text-align: start;">Name</th>
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
            <td>{{ $item['size'] }}</td>
            <td>{{ $item['color'] }}</td>
            <td>{{ $item['quantity'] }}</td>
            <td>{{ $item['selling_price'] }}</td> 
          </tr>
          @endforeach
        </tbody>
      </table>
    </div>
  </div>

  <div class="container" style="background-color: #01028f; color: #fff; margin-bottom: 20px; padding: 20px;width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;">
    <div class="container" style="width: 100%;padding-right: 15px;padding-left: 15px;margin-right: auto;margin-left: auto;">
      <div class="bd-highlight"
        style="flex-direction: row-reverse!important;display: flex!important;box-sizing: border-box !important;">
        <div class=" bd-highlight" style="padding: .5rem!important;margin-left: auto;
        margin-right: 71px;">
          <strong>SubTotal: {{ $ndata->total_price }}</strong> <br>
          <strong>Discount: {{ $ndata->discount }}</strong> <br>
          <strong>Delivery Cost: {{ $ndata->delivery_charge }}</strong><br>
          <h1 style="float: right;">Total: {{ $ndata->total_price + $ndata->delivery_charge -  $ndata->discount }}</h1>
        </div>
      </div>
    </div>
  </div>
  @endif
</body>

</html>