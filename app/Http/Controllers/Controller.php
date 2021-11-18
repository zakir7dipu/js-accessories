<?php

namespace App\Http\Controllers;

use App\Models\Category;
use App\Models\CetegorySection;
use App\Models\Company;
use App\Models\DistrictList;
use App\Models\FeatureProduct;
use App\Models\GeneralSettings;
use App\Models\InfoSection;
use App\Models\NewArrivalProductsSection;
use App\Models\Pages;
use App\Models\Product;
use App\Models\ProductFilterGallerySection;
use App\Models\Slider;
use App\Models\Supplier;
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
        $categorySection = CetegorySection::first();
        $sectionCategories = Category::where(['parent_id' => null, 'status' => true])->orderBy('id', 'ASC')->take($categorySection?$categorySection->number_of_content:6)->get();
        $newArrivalSection = NewArrivalProductsSection::first();
        $newArrivalProducts = Product::where('featured', true)->take($newArrivalSection?$newArrivalSection->number_of_content:6)->get();

        $productFilterGallerySection = ProductFilterGallerySection::first();
        $bestSellers = Product::where(['bestseller' => true, 'status' => true])->take($productFilterGallerySection?$productFilterGallerySection->number_of_content:6)->get();
        $populars = Product::where(['popular' => true, 'status' => true])->take($productFilterGallerySection?$productFilterGallerySection->number_of_content:6)->get();
        $trendings = Product::where(['trending' => true, 'status' => true])->take($productFilterGallerySection?$productFilterGallerySection->number_of_content:6)->get();
        $discounts = Product::where('status', true)->where('discount', '!=', null)->take($productFilterGallerySection?$productFilterGallerySection->number_of_content:6)->get();
        $infoSection = InfoSection::take(3)->get();
        $suppliers = Supplier::where('status', true)->get();
        $parentCategories = Category::where(['parent_id' => null, 'status' => true])->orderBy('name', 'ASC')->get();
        $pages = Pages::all();
        $companyContact = Company::first();

        View::share('districts', $districts);
        View::share('generalSettings', $generalSettings);
        View::share('sliders', $sliders);
        View::share('featureProductSection', $featureProductSection);
        View::share('featureProducts', $featureProducts);
        View::share('categorySection', $categorySection);
        View::share('sectionCategories', $sectionCategories);
        View::share('newArrivalSection', $newArrivalSection);
        View::share('newArrivalProducts', $newArrivalProducts);
        View::share('productFilterGallerySection', $productFilterGallerySection);
        View::share('newArrivalProducts', $newArrivalProducts);
        View::share('bestSellers', $bestSellers);
        View::share('populars', $populars);
        View::share('trendings', $trendings);
        View::share('discounts', $discounts);
        View::share('infoSection', $infoSection);
        View::share('suppliers', $suppliers);
        View::share('parentCategories', $parentCategories);
        View::share('pages', $pages);
        View::share('companyContact', $companyContact);
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
