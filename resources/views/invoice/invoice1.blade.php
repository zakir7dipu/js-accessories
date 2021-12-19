<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv='Content-Type' content='text/html; charset=UTF-8' />

	<title>{{ config('app.name') }}</title>

	<link rel='stylesheet' type='text/css' href='{{ asset('invoices/css/style.css') }}' />
	<link rel='stylesheet' type='text/css' href='{{ asset('invoices/css/print.css') }}' media="print" />
{{--    <script src="{{ asset('forntend/assets/js/jquery.min.js') }}"></script>--}}
{{--    <script src="{{ asset('invoices/js/html2pdf.bundle.js') }}"></script>--}}
    <script src="{{ asset('invoices/js/invoice.js') }}"></script>
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
                    <td id="thisInvoice">{{ $order->invoice }}</td>
                </tr>
                <tr>

                    <td class="meta-head">Date</td>
                    <td>{{ date('M d, Y', strtotime($order->created_at)) }}</td>
                </tr>
                <tr>
                    <td class="meta-head">Amount</td>
                    <td><div class="due">{{ $currencySymbol.' '.$order->price }}</div></td>
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
                @if($product->product)
                    <tr class="item-row">
                        <th>{{ $key+1 }}.</th>
                        <td class="description">{!! $product->product->name .'</br>'.$product->specification !!}</td>
                        <td class="text-right">{{ $currencySymbol.' '.(str_replace(',','',$product->price_qty) / $product->qty) }}</td>
                        <td class="text-center">{{ $product->qty }}</td>
                        <td class="text-right">{{ $currencySymbol.' '.$product->price_qty }}</td>
                    </tr>
                @else
                    <tr>
                        <th>{{ $key+1 }}</th>
                        <td>
                            {{ __('Product was deleted by admin...') }}
                        </td>
                    </tr>
                @endif
            @endforeach

		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">{{ __('Subtotal') }}</td>
		      <td class="total-value text-right"><div>{{ $currencySymbol.' '.$order->price }}</div></td>
		  </tr>
		  <tr>
		      <td colspan="2" class="blank"> </td>
		      <td colspan="2" class="total-line">{{ __('Total') }}</td>
		      <td class="total-value text-right"><div>{{ $currencySymbol.' '.$order->price }}</div></td>
		  </tr>

		</table>

		<div id="terms">
		  <h5>Thank You</h5>
            For Shopping from {{ config('app.url') }}
		</div>

	</div>
    <div class="downloadArea no-print" style="text-align: center;">
        <button onclick="downloadInvoice();">{{ __('Download') }}</button>
    </div>
</body>

</html>
