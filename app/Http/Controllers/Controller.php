<?php

namespace App\Http\Controllers;

use App\Models\DistrictList;
use App\Models\FeatureProduct;
use App\Models\GeneralSettings;
use App\Models\Product;
use App\Models\Slider;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\View;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function __construct(){
        $generalSettings = GeneralSettings::first();
        $districts = DistrictList::all();
        $sliders = Slider::where('status', true)->get();
        $featureProductSection = FeatureProduct::first();
        $featureProducts = Product::where('featured', true)->take($featureProductSection?$featureProductSection->number_of_content:6)->get();
        View::share('districts', $districts);
        View::share('generalSettings', $generalSettings);
        View::share('sliders', $sliders);
        View::share('featureProductSection', $featureProductSection);
        View::share('featureProducts', $featureProducts);
    }
    public function backWithError($message)
    {
        $notification = [
            'message' => $message,
            'alert-type' => 'error'
        ];
        return back()->with($notification);
    }

    public function backWithSuccess($message)
    {
        $notification = [
            'message' => $message,
            'alert-type' => 'success'
        ];
        return back()->with($notification);
    }

    public function backWithWarning($message)
    {
        $notification = [
            'message' => $message,
            'alert-type' => 'warning'
        ];
        return back()->with($notification);
    }

    public function redirectBackWithWarning($message, $route)
    {
        $notification = [
            'message' => $message,
            'alert-type' => 'warning'
        ];
        return redirect()->route($route)->with($notification);
    }
}
