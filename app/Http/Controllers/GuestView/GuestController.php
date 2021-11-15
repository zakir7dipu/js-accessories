<?php

namespace App\Http\Controllers\GuestView;

use App\Http\Controllers\Controller;
use App\Models\Advertisement;
use App\Models\BlogCategory;
use App\Models\BlogPost;
use App\Models\Category;
use App\Models\Pages;
use App\Models\Product;
use Illuminate\Http\Request;

class GuestController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        try {
            $advertiseGroup1 = Advertisement::all()
                ->where('status', true)
                ->random(2);
            $except = [];
            foreach ($advertiseGroup1 as $item){
                $except [] = $item->id;
            }
            $advertiseGroup2 = Advertisement::all()
                    ->where('status', true)
                    ->count();
            if ( $advertiseGroup2  >= 2){
                $advertiseGroup2 = Advertisement::all()
                    ->where('status', true)
                    ->whereNotIn('id', $except)
                    ->random(2);
            }


            return view('welcome', compact('advertiseGroup1', 'advertiseGroup2'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function productQuickView(Product $product)
    {
        try {
            $product->color = $product->attributeItems()->where('attribute_id', 1)->get();
            $product->size = $product->attributeItems()->where('attribute_id', 2)->get();
            return view('forntend.layouts.ajax.product-quick-view', compact('product'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function productSingleView($slug)
    {
        try {
            $sProduct = Product::where('slug', $slug)->first();
            $sProduct->color = $sProduct->attributeItems()->where('attribute_id', 1)->get();
            $sProduct->size = $sProduct->attributeItems()->where('attribute_id', 2)->get();
            if ($sProduct->category->parent_id != null){
                $sProduct->parent = $sProduct->category->parentCategory;
            }
            return view('forntend.pages.product-page', compact('sProduct'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function categoryElements($slug)
    {
        try {
            $category = Category::where('slug', $slug)->first();
            $products = $category->products()->paginate(12);
            $advertise = Advertisement::all()->random(1)->first();
            return view('forntend.pages.category-element', compact('category', 'products', 'advertise'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function allBlogs()
    {
        try {
            $bolgCategories = BlogCategory::where('status', true)->get();
            $blogs = BlogPost::where('status', true)->orderBy('id', 'DESC')->paginate(5);
            $recentBlogs = BlogPost::where('status', true)->orderBy('id', 'DESC')->take(2)->get();
            $data = BlogPost::where('status', true)->orderBy('id', 'DESC')->get('tags');
            $allTags = '';
            foreach ($data as $item){
                $allTags =$allTags.','. $item->tags;
            }
            $allTags = array_unique(explode(',', $allTags));
            return view('forntend.pages.blogs.index', compact('bolgCategories', 'blogs', 'recentBlogs', 'allTags'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function pageView(Pages $page)
    {
        if ($page->name == 'about'){
           return  $this->aboutPage($page);
        }
        try {
            $advertise = Advertisement::all()->random(1)->first();
            return view('forntend.pages.view-page', compact('page', 'advertise'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function aboutPage($page)
    {
        try {
            $advertise = Advertisement::all()->random(1)->first();
            $overview = $page->sections()->where(['name'=>'overview', 'status'=>true])->first();
            $mission = $page->sections()->where(['name'=>'mission', 'status'=>true])->first();
            $vision = $page->sections()->where(['name'=>'vision', 'status'=>true])->first();
            $about_img = $page->sections()->where(['name'=>'about_img', 'status'=>true])->first();
            return view('forntend.pages.about-page', compact('page', 'advertise', 'overview', 'mission', 'vision', 'about_img'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
