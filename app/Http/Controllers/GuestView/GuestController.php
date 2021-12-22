<?php

namespace App\Http\Controllers\GuestView;

use App\Http\Controllers\Controller;
use App\Models\Advertisement;
use App\Models\AttributeItem;
use App\Models\BlogCategory;
use App\Models\BlogPost;
use App\Models\Category;
use App\Models\ContactMessage;
use App\Models\Pages;
use App\Models\Product;
use App\Models\Subscribtion;
use Gloudemans\Shoppingcart\Facades\Cart;
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

            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('welcome', compact('advertiseGroup1', 'advertiseGroup2', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // product quick view
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

    // single product view
    public function productSingleView($slug)
    {
        try {
            $sProduct = Product::where('slug', $slug)->first();
            $sProduct->color = $sProduct->attributeItems()->where('attribute_id', 1)->get();
            $sProduct->size = $sProduct->attributeItems()->where('attribute_id', 2)->get();
            if ($sProduct->category->parent_id != null){
                $sProduct->parent = $sProduct->category->parentCategory;
            }
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.product-page', compact('sProduct', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // category element view
    public function categoryElements($slug)
    {
        try {
            $category = Category::where('slug', $slug)->first();
            $products = $category->products()->paginate(12);
            $productFeatures = $this->productFeature();
            $advertise = Advertisement::all()->random(1)->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.category-element', compact('category', 'products', 'productFeatures', 'advertise', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // blog & single blog
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
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.blogs.index', compact('bolgCategories', 'blogs', 'recentBlogs', 'allTags', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function singleBlog(BlogPost $post)
    {
        try {
            $bolgCategories = BlogCategory::where('status', true)->get();
            $recentBlogs = BlogPost::where('status', true)->orderBy('id', 'DESC')->take(2)->get();
            $data = BlogPost::where('status', true)->orderBy('id', 'DESC')->get('tags');
            $allTags = '';
            foreach ($data as $item){
                $allTags =$allTags.','. $item->tags;
            }
            $allTags = array_unique(explode(',', $allTags));
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.blogs.blog-post', compact('post', 'bolgCategories', 'recentBlogs', 'allTags', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // all basic page view
    public function pageView(Pages $page)
    {
        if ($page->name == 'about'){
           return  redirect()->route('view-aboutPage-page');
        }elseif ($page->name == 'contact'){
           return  redirect()->route('view-contact-page');
        }
        try {
            $advertise = Advertisement::all()->random(1)->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.view-page', compact('page', 'advertise', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // about page
    public function aboutPage()
    {
        $page = Pages::where('name', 'about')->first();
        try {
            $advertise = Advertisement::all()->random(1)->first();
            $overview = $page->sections()->where(['name'=>'overview', 'status'=>true])->first();
            $mission = $page->sections()->where(['name'=>'mission', 'status'=>true])->first();
            $vision = $page->sections()->where(['name'=>'vision', 'status'=>true])->first();
            $about_img = $page->sections()->where(['name'=>'about_img', 'status'=>true])->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.about-page', compact('page', 'advertise', 'overview', 'mission', 'vision', 'about_img', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // contact page
    public function contactPage()
    {
        $page = Pages::where('name', 'contact')->first();
        try {
            $map = $page->sections()->where(['name'=>'map', 'status'=>true])->first()?$page->sections()->where('name','map')->first():null;
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.contact', compact('page', 'map', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function storeContactMessage(Request $request)
    {
        $this->validate($request, [
            'contact-name' => ['required', 'string', 'max:255'],
            'contact-message' => ['required', 'string', 'max:255'],
        ]);
        try {
            ContactMessage::create([
                'contact-name'=>$request['contact-name'],
                'contact-email'=>$request['contact-email'],
                'contact-phone'=>$request['contact-phone'],
                'contact-message'=>$request['contact-message']
            ]);
            return $this->backWithSuccess('Message has been save successfully.');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // find product
    public function getProduct(Product $product)
    {
        $product->image = $product->productImages()->first()->image;
        $product->discount = ($product->price * $product->discount) / 100;
        $product->currence = $product->currency->symbol;
        $product->wish_date = date('Y-m-d H:i:s', time());
        return response()->json($product);
    }

    // wish list
    public function myWishList()
    {
        try {
            return view('forntend.pages.wish-list', [
                'title' => 'My Wish-list',
                'carts' => Cart::instance('shopping_cart')->content(),
                'cartTotal' => Cart::instance('shopping_cart')->subtotal()
            ]);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // shopping cart
    public function setCart(Product $product)
    {
        try {
//            Cart::instance('shopping_cart')->destroy();
            $product->color = $product->attributeItems()->where('attribute_id', 1)->first();
            $product->size = $product->attributeItems()->where('attribute_id', 2)->first();
            $product->image = $product->productImages()->first()->image;
            $product->currence = $product->currency->symbol;
            $price = $product->discount?($product->price-($product->price*$product->discount)/100):$product->price;
            $cart = Cart::instance('shopping_cart')->add([
                'id' => $product->id,
                'name' => $product->name,
                'qty' => 1,
                'price' => $price,
                'options' => [
                    'image' => $product->image,
                    'currence' => $product->currence,
                    'discount' => $product->discount?($product->price*$product->discount)/100:0,
                    'size' => $product->size?$product->size->id:$product->size,
                    'color' => $product->color?$product->color->id:$product->color,
                    'slug' => $product->slug
                ]
            ]);
            $data = [
                'status' => 'success',
                'info' => [
                    'cart' => $cart,
                    'count' => Cart::instance('shopping_cart')->count()
                ]
            ];
            return response()->json($data);
        }catch (\Throwable $th){
            $data = [
                'status' => 'error',
                'info' => $th->getMessage()
            ];
            return response()->json($data);
        }
    }

    public function setCartForm(Request $request, Product $product)
    {
        try {
            $product->image = $product->productImages()->first()->image;
            $product->currence = $product->currency->symbol;
            $price = $product->discount?($product->price-($product->price*$product->discount)/100):$product->price;
            Cart::instance('shopping_cart')->add([
                'id' => $product->id,
                'name' => $product->name,
                'qty' => $request->qty,
                'price' => $price,
                'options' => [
                    'image' => $product->image,
                    'currence' => $product->currence,
                    'discount' => $product->discount?($product->price*$product->discount)/100:0,
                    'size' => $request->size,
                    'color' => $request->color,
                    'slug' => $product->slug
                ]
            ]);
            return $this->backWithSuccess('Cart has been added successfully.');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function wishToCart(Request $request)
    {
        try {
//            Cart::instance('shopping_cart')->destroy();
            $cartProducts = [];
            foreach ($request->products as $item){
                $product = Product::find($item);
                if ($product){
                    $product->color = $product->attributeItems()->where('attribute_id', 1)->first();
                    $product->size = $product->attributeItems()->where('attribute_id', 2)->first();
                    $product->image = $product->productImages()->first()->image;
                    $product->currence = $product->currency->symbol;
                    $price = $product->discount?($product->price-($product->price*$product->discount)/100):$product->price;
                    $cart = Cart::instance('shopping_cart')->add([
                        'id' => $product->id,
                        'name' => $product->name,
                        'qty' => 1,
                        'price' => $price,
                        'options' => [
                            'image' => $product->image,
                            'currence' => $product->currence,
                            'discount' => $product->discount?($product->price*$product->discount)/100:0,
                            'size' => $product->size?$product->size->id:$product->size,
                            'color' => $product->color?$product->color->id:$product->color,
                            'slug' => $product->slug
                        ]
                    ]);
                    $cartProducts[] = $cart;
                }
            }

            $data = [
                'status' => 'success',
                'info' => [
                    'cart' => $cartProducts,
                    'count' => Cart::instance('shopping_cart')->count(),
                ],
                'message' => 'All Products have been added to cart successfully.'
            ];
            return response()->json($data);
        }catch (\Throwable $th){
            $data = [
                'status' => 'error',
                'info' => [],
                'message' => $th->getMessage()
            ];
            return response()->json($data);
        }
    }

    public function getCart()
    {
        try {
            $data = [
                'status' => 'success',
                'info' => [
                    'cart' => Cart::instance('shopping_cart')->content(),
                    'count' => Cart::instance('shopping_cart')->count()
                ]
            ];
            return response()->json($data);
        }catch (\Throwable $th){
            $data = [
                'status' => 'error',
                'info' => $th->getMessage()
            ];
            return response()->json($data);
        }
    }

    public function destroyCart($cart)
    {
        try {
            Cart::instance('shopping_cart')->remove($cart);
            $data = [
                'status' => 'success',
                'info' => 'Cart item has been removed successfully.'
            ];
            return response()->json($data);
        }catch (\Throwable $th){
            $data = [
                'status' => 'error',
                'info' => $th->getMessage()
            ];
            return response()->json($data);
        }
    }

    public function myCartItems()
    {
        try {
            $title = 'My Cart-list';
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.cart-list', compact('title', 'carts', 'cartTotal'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function updateCartForm(Request $request, $cart)
    {
        try {
            Cart::instance('shopping_cart')->update($cart, $request->qty);
            return $this->backWithSuccess('Cart item has been updated successfully.');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function cartDestroy()
    {
        try {
            Cart::instance('shopping_cart')->destroy();
            return $this->backWithSuccess('Cart list has been cleared successfully...');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    // search
    public function headerProductSearch(Request $request)
    {
        $this->validate($request, [
            'quarry_string' => ['required', 'string'],
            'quarry_element' => ['required']
        ]);
        $quarryString = clean($request->quarry_string);
        $quarryElement = clean($request->quarry_element);
        $category = Category::find($quarryElement);
        try {
            $products = $category->products()->where('name', 'LIKE', "%$quarryString%")->orderBy('name','ASC')->paginate(12);
            $productFeatures = $this->productFeature();
            $advertise = Advertisement::all()->random(1)->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.category-element', compact('category', 'products', 'advertise', 'carts', 'cartTotal', 'productFeatures'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function searchCategory(Category $category = null)
    {
        if ($category){
            return response()->json($category->products);
        }else{
            return response()->json([]);
        }

    }

    public function searchByAttribute(Request $request)
    {
        $this->validate($request, [
            'quarry_string' => ['required', 'string'],
            'quarry_element' => ['required']
        ]);
        $quarryString = clean($request->quarry_string);
        $quarryElement = clean($request->quarry_element);
        $category = Category::find($quarryElement);
        try {
            $items = AttributeItem::where('name', 'LIKE', "%$quarryString%")->get();
            $data = [];
            foreach ($items as $item){
                if ($category->id === $item->product->category_id){
                    $data[] =  $item->product;
                }
            }
            $products = $this->paginate($data, 12);
            $productFeatures = $this->productFeature();
            $advertise = Advertisement::all()->random(1)->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.category-element', compact('category', 'products', 'advertise', 'carts', 'cartTotal', 'productFeatures'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function searchByPrice(Request $request)
    {
        $this->validate($request, [
            'quarry_element' => ['required'],
            'min_price' => ['required'],
            'max_price' => ['required'],
        ]);
        $minPrice = clean($request->min_price);
        $maxPrice = clean($request->max_price);
        $quarryElement = clean($request->quarry_element);
        $category = Category::find($quarryElement);
        try {

            $products = $category->products()->whereBetween('price', [$minPrice,$maxPrice])->orderBy('name','ASC')->paginate(12);
            $productFeatures = $this->productFeature();
            $advertise = Advertisement::all()->random(1)->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.category-element', compact('category', 'products', 'advertise', 'carts', 'cartTotal', 'productFeatures'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function searchByFeature(Request $request)
    {
        $this->validate($request, [
            'quarry_element' => ['required'],
            'orderby' => ['required']
        ]);
        $orderby = clean($request->orderby);
        $orderby = str_replace(" sorting", '', $request->orderby);
        $orderby = str_replace(" ", '_', strtolower($orderby));
        $quarryElement = clean($request->quarry_element);
        $category = Category::find($quarryElement);
        try {
            if ($orderby === "default"){
                $products = $category->products()->orderBy('name','ASC')->paginate(12);
            }else{
                $products = $category->products()->where($orderby, true)->orderBy('name','ASC')->paginate(12);
            }
            $productFeatures = $this->productFeature();
            $advertise = Advertisement::all()->random(1)->first();
            $carts = Cart::instance('shopping_cart')->content();
            $cartTotal = Cart::instance('shopping_cart')->subtotal();
            return view('forntend.pages.category-element', compact('category', 'products', 'advertise', 'carts', 'cartTotal', 'productFeatures'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function subscription(Request $request)
    {
        if (!$request->email){
            $notification = [
                'status' => 'warning',
                'message' => 'You did not provide any email'
            ];
            return response()->json($notification);
        } else if (strlen(trim($request->email)) === 0){
            $notification = [
                'status' => 'warning',
                'message' => 'You did not provide any email'
            ];
            return response()->json($notification);
        } else if (Subscribtion::where('email', strtolower($request->email))->count() > 0){
            $notification = [
                'status' => 'warning',
                'message' => 'You are already subscribed by this email.'
            ];
            return response()->json($notification);
        }

        try {
            Subscribtion::create([
                "email" => $request->email
            ]);

            $notification = [
                'status' => 'success',
                'message' => 'Successfully subscribed...'
            ];
            return response()->json($notification);
        }catch (\Throwable $th){
            $notification = [
                'status' => 'warning',
                'message' => $th->getMessage()
            ];
            return response()->json($notification);
        }
        return response()->json($request->all());
    }

    // shurjaPay
    public function successPayment()
    {
        return response()->json([
            'status' => true
        ]);
    }

    public function cancelPayment()
    {
        return response()->json([
            'status' => false
        ]);
    }
}
