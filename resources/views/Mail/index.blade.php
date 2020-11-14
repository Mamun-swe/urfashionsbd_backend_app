@if ($data)
<h1>Hello! I'm {{ $data->name }}</h1> 
<p>Phone Number: {{ $data->phone }}</p>
<p>Email: {{ $data->email }}</p>
<br>
<p>{{ $data->message }}</p>
@else 
 <h1>Hello Ur Fashion</h1>
 @endif


