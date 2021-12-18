<?php

use App\Actions\Fortify\UpdateUserPassword;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdvertisementController;
use App\Http\Controllers\Admin\AppSettingsController;
use App\Http\Controllers\Admin\BlogCategoryController;
use App\Http\Controllers\Admin\BlogPostController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\CustomUserController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\SupplierController;
use App\Http\Controllers\Client\ClientController;
use App\Http\Controllers\Client\ClientOrderController;
use App\Http\Controllers\GuestView\GuestController;
use App\Http\Controllers\Api\DistrictController;
use App\Http\Controllers\PaymentMethodInputController;
use App\Http\Controllers\ProductOrderController;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

Route::get('/setup', function (){
    \Illuminate\Support\Facades\Artisan::call('storage:link');
    \Illuminate\Support\Facades\Artisan::call('cache:clear');
    \Illuminate\Support\Facades\Artisan::call('view:clear');
    echo 'done';
    return redirect()->route('home');
});

Route::get('/', [GuestController::class, 'index'])->name('home');
Route::get('/invoice/{order}', [ClientOrderController::class, 'invoice'])->name('invoice');

// product quick view
Route::get('/product-quick-view/{product}', [GuestController::class, 'productQuickView'])->name('product-quick-view');
// product single view
Route::get('single-product/{slug}', [GuestController::class, 'productSingleView'])->name('single-product');
// show shop page according to category
Route::get('/category/{slug}', [GuestController::class, 'categoryElements'])->name('category-elements');
//blogs
Route::prefix('blog')->as('blog.')->group(function (){
    Route::get('/', [GuestController::class, 'allBlogs'])->name('index');
    Route::get('/view/{post}', [GuestController::class, 'singleBlog'])->name('per-blog');
});
//page view
Route::get('/page/{page}', [GuestController::class, 'pageView'])->name('view-page');
// sote contact message
Route::post('/contact-store', [GuestController::class, 'storeContactMessage'])->name('contact-store');
//get product
Route::get('/product-info/{product}', [GuestController::class, 'getProduct']);

// my Wish List
Route::get('/my-wishes', [GuestController::class, 'myWishList'])->name('my-wishes');

// my cart
Route::prefix('/my-cart')->as('cart.')->group(function (){
    Route::get('/get', [GuestController::class, 'getCart']);
    Route::get('/set/{product}', [GuestController::class, 'setCart']);
    Route::post('/set/wish-to-cart', [GuestController::class, 'wishToCart']);
    Route::post('/set/{product}', [GuestController::class, 'setCartForm'])->name('set');
    Route::put('/update/{cart}', [GuestController::class, 'updateCartForm'])->name('update');
    Route::get('/destroy/{cart}', [GuestController::class, 'destroyCart']);
    Route::get('/items', [GuestController::class, 'myCartItems'])->name('items');
    Route::delete('/destroy', [GuestController::class, 'cartDestroy'])->name('destroy');
});

// product search
Route::prefix('/search')->as('search.')->group(function (){
    Route::get('/', [GuestController::class, 'headerProductSearch'])->name('header');
    Route::get('/category/{category?}', [GuestController::class, 'searchCategory'])->name('category');
    Route::get('/attribute', [GuestController::class, 'searchByAttribute'])->name('attribute');
    Route::get('/price', [GuestController::class, 'searchByPrice'])->name('price');
    Route::get('/feature', [GuestController::class, 'searchByFeature'])->name('feature');
});

//district-info
Route::get('/country', [DistrictController::class, 'getCountry']);
Route::post('/district', [DistrictController::class, 'getDistrict']);
Route::post('/police-station', [DistrictController::class, 'getPoliceStation']);
Route::post('/order-area', [DistrictController::class, 'saveOrderArea']);
Route::get('/order-area/{country},{state},{police_station}', [DistrictController::class, 'trackOrderArea']);
Route::get('/district-info', [DistrictController::class, 'getDistrictInfo']);

//subscription
Route::post('/subscription', [GuestController::class, 'subscription'])->name('subscription');

Route::prefix('/admin')->as('admin.')->middleware(['auth:sanctum', 'admin', 'verified'])->group(function () {
// dashboard rout
    Route::get('/dashboard', [AdminController::class, 'index'])->name('dashboard');
    // profile routs
    Route::prefix('/profile')->group(function (){
        Route::get('/', [AdminController::class, 'profile'])->name('profile');
        Route::post('/', [AdminController::class, 'profileUpdate']);
        Route::post('/info', [AdminController::class, 'profileInfoUpdate'])->name('profile-info');
        Route::post('/password-update', [UpdateUserPassword::class, 'updateAdminPassword'])->name('password-update');
    });

    //settings
    Route::prefix('/settings')->as('settings.')->middleware('permission:settings')->group(function (){
        //general
        Route::get('/', [AppSettingsController::class, 'index'])->name('index');
        Route::post('/', [AppSettingsController::class, 'storeGeneralSettings']);
        //smtp
        Route::get('/smtp', [AppSettingsController::class, 'smtpIndex'])->name('smtp');
        Route::post('/smtp', [AppSettingsController::class, 'storeSmtpSettings']);
        //api
        Route::get('/api', [AppSettingsController::class, 'apiIndex'])->name('api');
        Route::post('/api', [AppSettingsController::class, 'storeApiSettings']);
        //sms
        Route::get('/sms', [AppSettingsController::class, 'smsIndex'])->name('sms');
        Route::post('/sms', [AppSettingsController::class, 'storeSmsSettings']);
        //social media link
        Route::get('/social-media-link', [AppSettingsController::class, 'socialMediaLinkIndex'])->name('social-media-link');
        Route::post('/social-media-link', [AppSettingsController::class, 'storeSocialMediaLink']);
        //contact
        Route::post('/company-contact', [AppSettingsController::class, 'storeContact'])->name('company-contact');
        //order
        Route::get('/order', [AppSettingsController::class, 'orderIndex'])->name('order-index');
        Route::get('/order-country/{country}', [AppSettingsController::class, 'orderCountryDeactivate'])->name('order-country-delete');
        Route::get('/order-state/{state}', [AppSettingsController::class, 'orderStateDeactivate'])->name('order-state-delete');
        Route::get('/order-police-station/{thana}', [AppSettingsController::class, 'orderThanaDeactivate'])->name('order-police-station-delete');
        //payment
        Route::prefix('/payment')->as('payment.')->group(function (){
            Route::get('/', [AppSettingsController::class, 'paymentIndex'])->name('index');
            Route::get('/method/{payment}', [PaymentMethodInputController::class, 'getMethodForm'])->name('method');
            Route::post('/store/{payment}', [PaymentMethodInputController::class, 'storePayment'])->name('store');
        });

        //user
        Route::resource('/user', CustomUserController::class)->only(['index', 'store', 'destroy']);
    });

    //pages
    Route::prefix('/page')->as('page.')->middleware('permission:pages')->group(function (){
        Route::get('/view/{page}', [AppSettingsController::class, 'pageIndex'])->name('index');
        Route::post('/view/{page}', [AppSettingsController::class, 'pageStore']);
    });

    //suppliers
    Route::resource('supplier',SupplierController::class)->middleware('permission:suppliers');

    //customers
    Route::prefix('/customer')->as('customer.')->middleware('permission:customers')->group(function (){
        Route::get('/', [AdminController::class, 'customersIndex'])->name('index');
        Route::get('/view/{customer}', [AdminController::class, 'customersView'])->name('view');
    });

    // widget
    Route::prefix('widget')->as('widget.')->middleware('permission:widget')->group(function (){
        //slider
        Route::resource('/slider', SliderController::class);

        // feature Product Widget Index
        Route::prefix('feature-products')->as('feature-products.')->group(function (){
            Route::get('/', [AppSettingsController::class, 'featureProductWidgetIndex'])->name('index');
            Route::post('/', [AppSettingsController::class, 'featureProductWidgetStore']);
        });

        // category section index
        Route::prefix('category-section')->as('category-section.')->group(function (){
            Route::get('/', [AppSettingsController::class, 'categorySectionIndex'])->name('index');
            Route::post('/', [AppSettingsController::class, 'categorySectionStore']);
        });

        // new arrival products
        Route::prefix('new-arrival')->as('new-arrival.')->group(function (){
            Route::get('/', [AppSettingsController::class, 'newArrivalProductWidgetIndex'])->name('index');
            Route::post('/', [AppSettingsController::class, 'newArrivalProductWidgetStore']);
        });

        // products filter gallery
        Route::prefix('filter-gallery')->as('filter-gallery.')->group(function (){
            Route::get('/', [AppSettingsController::class, 'productFilterGalleryWidgetIndex'])->name('index');
            Route::post('/', [AppSettingsController::class, 'productFilterGalleryWidgetStore']);
        });

        // info section
        Route::prefix('info-section')->as('info-section.')->group(function (){
            Route::get('/', [AppSettingsController::class, 'infoSectionIndex'])->name('index');
            Route::post('/info/{column}', [AppSettingsController::class, 'infoColumnStore'])->name('store');
            Route::get('/info-section-Activation', [AppSettingsController::class, 'infoSectionActivation']);
        });
    });

    // advertisement
    Route::resource('advertisement', AdvertisementController::class)->middleware('permission:advertisement');


    //blogs
    Route::prefix('/blog')->as('blog.')->middleware('permission:blog')->group(function (){
        //category
        Route::resource('/category', BlogCategoryController::class);
        //post
        Route::resource('/post', BlogPostController::class);
        //comment settings
        Route::get('/comment-settings',[BlogPostController::class, 'commentSettingsIndex'])->name('comment-settings');
        Route::post('/comment-settings',[BlogPostController::class, 'storeCommentSettings']);
    });

    //e-commerce
    Route::prefix('/e-commerce')->as('e-commerce.')->middleware('permission:ecommerce')->group(function (){
        //category
        Route::resource('/category', CategoryController::class);
        Route::get('/category-sub-category/{category}', [CategoryController::class, 'subCategory'])->name('category-sub-category');
        Route::get('/category/child/{category}', [CategoryController::class, 'childCategoryIndex'])->name('child-category.index');
        //products
        Route::resource('/product', ProductController::class);
        //remove product attribute
        Route::delete('/product/atribute-item/{item}', [ProductController::class, 'destroyAttribute']);
        //remove product image
        Route::delete('/product/image/{image}', [ProductController::class, 'deleteImage']);
        // feature activation
        Route::post('/feature-activation/{product}', [ProductController::class, 'featureActivation']);
        // orders
        Route::prefix('/order')->as('order.')->group(function (){
            Route::get('/', [ClientOrderController::class, 'index'])->name('index');
            Route::get('/single/{order}', [ClientOrderController::class, 'orderSingle'])->name('single');
            Route::post('/single/{order}', [ClientOrderController::class, 'statusUpdate'])->name('approval');
        });

    });
});

Route::prefix('/my-account')->as('client.')->middleware(['auth:sanctum', 'verified', 'role:customer'])->group(function (){
    Route::get('/dashboard', [ClientController::class, 'index'])->name('dashboard');
    // profile routs
    Route::prefix('/profile')->group(function (){
        Route::get('/', [ClientController::class, 'profile'])->name('profile');
        Route::post('/', [ClientController::class, 'profileUpdate']);
        Route::post('/info', [ClientController::class, 'profileInfoUpdate'])->name('profile-info');
        Route::post('/password-update', [UpdateUserPassword::class, 'updateAdminPassword'])->name('password-update');
    });
    // checkout
    Route::prefix('/checkout')->as('checkout.')->group(function (){
        Route::get('/', [ClientController::class, 'checkoutIndex'])->name('index');
        Route::get('/method/{payment}', [ClientController::class, 'checkoutMethod'])->name('method');
    });
    // order
    Route::prefix('/order')->as('order.')->group(function (){
        Route::get('/', [ClientOrderController::class, 'index'])->name('index');
        Route::post('/', [ClientOrderController::class, 'store'])->name('store');
    });

});
