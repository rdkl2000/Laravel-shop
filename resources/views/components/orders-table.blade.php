<table class="table">
  <thead>
  <tr>
    <th colspan="2">Product</th>
    <th>Quantity</th>
    <th>Unit price</th>
    <th>Discount</th>
    <th colspan="2">Total</th>
  </tr>
  </thead>
  <tbody>
  @php
    $total = 0;
  @endphp
  @foreach($basket as $product)
    <tr>
      <td><a href="#"><img src="/img/detailsquare.jpg" alt="{{$product['name']}}"></a></td>
      <td><a href="/products/{{$product['id']}}">{{$product['name']}}</a></td>
      <td>
        <input type="number" min="1" max="1000" value="{{$product['quantity']}}" class="form-control">
      </td>
      <td>${{$product['price']}}</td>
      <td>${{$product['discount']}}</td>
      <td>${{$product['total']}}</td>
      <td><a href="#"><i class="fa fa-trash-o"></i></a></td>
    </tr>
    @php
    $total+=$product['total'];
    @endphp
  @endforeach
  </tbody>
  <tfoot>
  <tr>
    <th colspan="5">Total</th>
    <th colspan="2">${{$total}}</th>
  </tr>
  </tfoot>
</table>
