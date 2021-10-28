<?php

use App\Actions\Fortify\UpdateUserPassword;
use App\Http\Controllers\Admin\AdminController;
use App\Http\Controllers\Admin\AppSettingsController;
use App\Http\Controllers\Admin\BlogCategoryController;
use App\Http\Controllers\Admin\BlogPostController;
use App\Http\Controllers\Admin\CategoryController;
use App\Http\Controllers\Admin\ProductController;
use App\Http\Controllers\Admin\SupplierController;
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

Route::get('/', function () {
    return view('welcome');
});

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
    });

    //suppliers
    Route::resource('supplier',SupplierController::class);

    //customers
    Route::prefix('/customer')->as('customer.')->group(function (){
        Route::get('/', [AdminController::class, 'customersIndex'])->name('index');
        Route::get('/view/{customer}', [AdminController::class, 'customersView'])->name('view');
    });

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
