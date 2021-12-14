<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

	<title>{{ config('app.name') }}</title>

	<link rel='stylesheet' type='text/css' href='{{ asset('invoices/css/style.css') }}' />
	<link rel='stylesheet' type='text/css' href='{{ asset('invoices/css/print.css') }}' media="print" />

</head>

<body>
	<div id="page-wrap">

		<h6 id="header">{{ __('INVOICE') }}</h6>

		<div id="identity" style="padding: 0 10px;">

            <span id="address">
                {!! $contact->address .'</br>'.$contact->email.'</br>'.$contact->phone !!}
            </span>

            <div id="logo">
                {!! $generalSettings?'<img src="'.asset($generalSettings->site_tag_image).'" data-src="'.asset($generalSettings->logo).'" alt="Porto Logo">':'<img src="'.asset('forntend/assets/images/logo.png').'" data-src="'.asset('forntend/assets/images/logo-black.png').'" alt="Porto Logo">' !!}
            </div>

		</div>

		<div style="clear:both"></div>

		<div id="customer">

            {!! ucwords($order->address->name) .'<br>'. ucwords($order->address->phone) .'<br>'. ucwords($order->address->company_name) .'<br>'. ucwords($order->address->street_address) .'<br>'. ucwords($order->address->police_station).','. ucwords($order->address->state) .'<br>'. ucwords($order->address->country) .'-'. ucwords($order->address->postal_code) !!}

            <table id="meta">
                <tr>
                    <td class="meta-head">Invoice #</td>
                    <td>{{ $order->invoice }}</td>
                </tr>
                <tr>

                    <td class="meta-head">Date</td>
                    <td>{{ date('M d, Y', strtotime($order->created_at)) }}</td>
                </tr>
                <tr>
                    <td class="meta-head">Amount</td>
                    <td><div class="due">{{ $order->price }}</div></td>
                </tr>

            </table>

		</div>

		<table id="items">

		  <tr>
		      <th>{{ __('Item') }}</th>
		      <th>{{ __('Description') }}</th>
		      <th>{{ __('Unit Cost') }}</th>
		      <th>{{ __('Quantity') }}</th>
		      <th>{{ __('Price') }}</th>
		  </tr>

            @foreach($order->product as $key => $product)
                <tr class="item-row">
                    <td>{{ $key+1 }}.</td>
                    <td class="description">{!! $product->product->name .'</br>'.$product->specification !!}</td>
                    <td>{{ $product->product->currency->symbol.' '.(str_replace(',','',$product->price_qty) / $product->qty) }}</td>
                    <td>{{ $product->qty }}</td>
                    <td>{{ $product->product->currency->symbol.' '.$product->price_qty }}</td>
                </tr>
            @endforeach

		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Subtotal</td>
		      <td class="total-value"><div>{{ $order->price }}</div></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">Total</td>
		      <td class="total-value"><div>{{ $order->price }}</div></td>
		  </tr>

		</table>

		<div id="terms">
		  <h5>Thank You</h5>
            For Shopping from {{ config('app.url') }}
		</div>

	</div>

</body>

</html>
