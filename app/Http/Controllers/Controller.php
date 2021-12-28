<?php

namespace App\Http\Controllers;

use App\Models\Advertisement;
use App\Models\Attribute;
use App\Models\BlogPostCommentSettings;
use App\Models\Category;
use App\Models\CetegorySection;
use App\Models\Company;
use App\Models\ContactMessage;
use App\Models\DistrictList;
use App\Models\FeatureProduct;
use App\Models\GeneralSettings;
use App\Models\InfoSection;
use App\Models\NewArrivalProductsSection;
use App\Models\Pages;
use App\Models\Product;
use App\Models\ProductFilterGallerySection;
use App\Models\Slider;
use App\Models\SocialMediaLink;
use App\Models\Supplier;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Bus\DispatchesJobs;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Pagination\LengthAwarePaginator;
use Illuminate\Pagination\Paginator;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Collection;
use Illuminate\Support\Facades\View;

class Controller extends BaseController
{
    use AuthorizesRequests, DispatchesJobs, ValidatesRequests;

    public function __construct()
    {
        $generalSettings = GeneralSettings::first();
        $districts = DistrictList::all();
        $sliders = Slider::where('status', true)->get();
        $featureProductSection = FeatureProduct::first();
        $featureProducts = Product::where('featured', true)->take($featureProductSection ? $featureProductSection->number_of_content : 6)->get();
        $categorySection = CetegorySection::first();
        $sectionCategories = Category::where(['parent_id' => null, 'status' => true])->orderBy('id', 'ASC')->take($categorySection ? $categorySection->number_of_content : 6)->get();
        $newArrivalSection = NewArrivalProductsSection::first();
        $newArrivalProducts = Product::where('featured', true)->take($newArrivalSection ? $newArrivalSection->number_of_content : 6)->get();
        $socialMediaLinks = SocialMediaLink::all();

        $productFilterGallerySection = ProductFilterGallerySection::first();
        $bestSellers = Product::where(['bestseller' => true, 'status' => true])->take($productFilterGallerySection ? $productFilterGallerySection->number_of_content : 6)->get();
        $populars = Product::where(['popular' => true, 'status' => true])->take($productFilterGallerySection ? $productFilterGallerySection->number_of_content : 6)->get();
        $trendings = Product::where(['trending' => true, 'status' => true])->take($productFilterGallerySection ? $productFilterGallerySection->number_of_content : 6)->get();
        $discounts = Product::where('status', true)->where('discount', '!=', null)->take($productFilterGallerySection ? $productFilterGallerySection->number_of_content : 6)->get();
        $infoSection = InfoSection::take(3)->get();
        $suppliers = Supplier::where('status', true)->get();
        $parentCategories = Category::where(['parent_id' => null, 'status' => true])->orderBy('name', 'ASC')->get();
        $pages = Pages::all();
        $companyContact = Company::first();
        $contact = Company::first();
        $popupAd = Advertisement::all()
            ->where('status', true)
            ->random(1);
        $commentSetting = BlogPostCommentSettings::first();
        $size = Attribute::where('name', 'size')->first();
        $sizeDatas = $size->items;
        $allSizes = [];
        foreach ($sizeDatas as $item) {
            $allSizes[] = ucwords($item->name);
        }
        $allSizes = array_unique($allSizes);
        $color = Attribute::where('name', 'color')->first();
        $colorDatas = $color->items;
        $allColors = [];
        foreach ($colorDatas as $item) {
            $allColors[] = ucwords($item->name);
        }
        $allColors = array_unique($allColors);
        $orderPermissions = $this->orderPermission();
        $themeColors = $this->themeColors();
        $unreadContactMessages = ContactMessage::where('status', false)->get();

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
        View::share('socialMediaLinks', $socialMediaLinks);
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
        View::share('contact', $contact);
        View::share('popupAd', $popupAd);
        View::share('commentSetting', $commentSetting);
        View::share('allSizes', $allSizes);
        View::share('allColors', $allColors);
        View::share('orderPermissions', $orderPermissions);
        View::share('themeColors', $themeColors);
        View::share('unreadContactMessages', $unreadContactMessages);
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

    public function redirectBackWithSuccess($message, $route, $data=null)
    {
        $notification = [
            'message' => $message,
            'alert-type' => 'success'
        ];
        return redirect()->route($route)->with($notification);
    }

    public function redirectBackWithError($message, $route)
    {
        $notification = [
            'message' => $message,
            'alert-type' => 'error'
        ];
        return redirect()->route($route)->with($notification);
    }

    public function productFeature()
    {
        return $array = [
            "Default sorting",
            "Featured sorting",
            "New Arrival sorting",
            "Popular sorting",
            "Bestseller sorting",
            "Trending sorting",
        ];
    }

    public function orderPermission()
    {
        return $array = [
            (object)[
                'name' => 'Canceled',
                'permission_code' => 0
            ],
            (object)[
                'name' => 'Pending',
                'permission_code' => 1
            ],
            (object)[
                'name' => 'Approved',
                'permission_code' => 2
            ],
            (object)[
                'name' => 'Process to delivery',
                'permission_code' => 3
            ],
            (object)[
                'name' => 'Delivered',
                'permission_code' => 4
            ],
        ];
    }

    /**
     * The attributes that are mass assignable.
     * to make pagination for custom array
     * @var array
     */
    public function paginate($items, $perPage, $page = null, $options = [])
    {
        $page = $page ?: (Paginator::resolveCurrentPage() ?: 1);
        $items = $items instanceof Collection ? $items : Collection::make($items);
        return new LengthAwarePaginator($items->forPage($page, $perPage), $items->count(), $perPage, $page, $options);
    }

    public function themeColors()
    {
        return $colors = [
            'blue',
            'orange',
            'silver',
        ];
    }
}

