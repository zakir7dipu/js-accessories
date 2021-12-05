<?php

use App\Actions\Fortify\UpdateUserPassword;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AdvertisementController;
use App\Http\Controllers\Admin\AppSettingsController;
use App\Http\Controllers\Admin\BlogCategoryController;
use App\Http\Controllers\Admin\BlogPostController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SliderController;
use App\Http\Controllers\Admin\SupplierController;
use App\Http\Controllers\Client\ClientController;
use App\Http\Controllers\GuestView\GuestController;
use App\Http\Controllers\Api\DistrictController;
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
    Route::get('/destroy/{cart}', [GuestController::class, 'destroyCart']);
});

//district-info
Route::get('/district-info', [DistrictController::class, 'getDistrictInfo']);

Route::prefix('/admin')->as('admin.')->middleware(['auth:sanctum', 'verified'])->group(function () {
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
    Route::prefix('/settings')->as('settings.')->group(function (){
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
    });

    //pages
    Route::prefix('/page')->as('page.')->group(function (){
        Route::get('/view/{page}', [AppSettingsController::class, 'pageIndex'])->name('index');
        Route::post('/view/{page}', [AppSettingsController::class, 'pageStore']);
    });

    //suppliers
    Route::resource('supplier',SupplierController::class);

    //customers
    Route::prefix('/customer')->as('customer.')->group(function (){
        Route::get('/', [AdminController::class, 'customersIndex'])->name('index');
        Route::get('/view/{customer}', [AdminController::class, 'customersView'])->name('view');
    });

    // widget
    Route::prefix('widget')->as('widget.')->group(function (){
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
    Route::prefix('advertisement')->as('advertisement.')->group(function (){

    });
    Route::resource('advertisement', AdvertisementController::class);


    //blogs
    Route::prefix('/blog')->as('blog.')->group(function (){
        //category
        Route::resource('/category', BlogCategoryController::class);
        //post
        Route::resource('/post', BlogPostController::class);
        //comment settings
        Route::get('/comment-settings',[BlogPostController::class, 'commentSettingsIndex'])->name('comment-settings');
        Route::post('/comment-settings',[BlogPostController::class, 'storeCommentSettings']);
    });

    //e-commerce
    Route::prefix('/e-commerce')->as('e-commerce.')->group(function (){
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
    });

});

Route::prefix('/my-account')->as('client.')->middleware(['auth:sanctum', 'verified', 'role:customer'])->group(function (){
    Route::get('/dashboard', [ClientController::class, 'index'])->name('dashboard');
});
