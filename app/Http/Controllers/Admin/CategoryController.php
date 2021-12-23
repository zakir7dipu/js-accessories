<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Category;
use App\Models\GeneralSettings;
use App\Models\Product;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class CategoryController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'All Categories';

            $categories = Category::where('parent_id', null)->orderBy('name', 'ASC')->get();
            $selectedItem = null;
            return view('backend.pages.e-commerce.categories.index', compact('title', 'generalSettings', 'categories', 'selectedItem'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * sub-category index
     */
    public function childCategoryIndex(Category $category)
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.$category->name.' | '. 'All Child Categories';
            $categories = $category->childCategory()->orderBy('name', 'ASC')->get();
            $selectedItem = null;
            return view('backend.pages.e-commerce.categories.index', compact('title', 'generalSettings', 'categories', 'selectedItem'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Add New Category';
            $categories = Category::where(['parent_id' => null, 'status'=> true])->orderBy('name', 'ASC')->get();
            $selectedItem = null;

            return view('backend.pages.e-commerce.categories.form', compact('title', 'generalSettings', 'categories', 'selectedItem'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        $this->validate($request, [
            'category' => ['nullable', 'max:20'],
            'sub_category' => ['nullable', 'max:20'],
            'name' => ['required', 'max:200'],
            'status' => ['nullable']
        ]);
        // for validation check
        $acceptable = ['png'];
        if ($request->hasFile('icon')) {
            foreach ($request->icon as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only png file is supported.');
                }
            }
        }

        if ($request->sub_category){
            $parent = $request->sub_category;
        }elseif ($request->category){
            $parent = $request->category;
        }else{
            $parent = null;
        }

        try {
            $category = new Category();
            $category->parent_id = $parent;
            $category->name = clean($request->name);
            if ($request->hasFile('icon')){
                $images = $request->icon;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                }
                Image::make($image->getRealPath())
//                    ->resize(128, 128)
                    ->save(public_path('/upload/categories/' . $filename));
                $path = "/upload/categories/".$filename;
                $category->icon = $path;
            }
            $category->slug = strtolower(str_replace(' ', '_', clean($request->name))).'_'.time();
            $category->status = $request->has('status');
            $category->save();
            return $this->backWithSuccess('Category has been saved successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  Category $category
     * @return \Illuminate\Http\Response
     */
    public function show(Category $category)
    {
        try {
            if ($category->status){
                $category->update(['status' => false]);
                $notification = (object)[
                    'status' => false,
                    'message' => "Deactivated Successfully......"
                ];
            }else{
                $category->update(['status' => true]);
                $notification = (object)[
                    'status' => true,
                    'message' => "Activated Successfully......"
                ];
            }
            return response()->json($notification);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * get the sub-category according to category
     */
    public function subCategory(Category $category)
    {
        try {
            $subCategories = [];
            $subCategories[] = '<option value="'.null.'">'.__('Select One').'</option>';
            foreach ($category->childCategory()->orderBy('name', 'ASC')->get() as $child){
                $subCategories[] = '<option value="'.$child->id.'">'.$child->name.'</option>';
            }
            if (count($subCategories) <= 1){
                $subCategories[] = '<option value="'.null.'">'.__('There is no item').'</option>';
            }
            return response()->json($subCategories);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Category $category
     * @return \Illuminate\Http\Response
     */
    public function edit(Category $category)
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Add New Category';
            $categories = Category::where(['parent_id' => null, 'status'=> true])->orderBy('name', 'ASC')->get();
            $selectedItem = $category;
            $parent = $category->parentCategory;
            if ($parent) {
                if (!$parent->parent_id) {
                    $superParent = $parent;
                    $parent = null;
                } else {
                    $superParent = $parent->parentCategory;
                }
                $selectedItem->category = $superParent;
                $selectedItem->sub_category = $parent;
            }else{
                $selectedItem->category = null;
                $selectedItem->sub_category = null;
            }

            return view('backend.pages.e-commerce.categories.form', compact('title', 'generalSettings', 'categories' ,'selectedItem'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Category $category
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Category $category)
    {
        $this->validate($request, [
            'category' => ['nullable', 'max:20'],
            'sub_category' => ['nullable', 'max:20'],
            'name' => ['required', 'max:200'],
            'status' => ['nullable']
        ]);
        // for validation check
        $acceptable = ['png'];
        if ($request->hasFile('icon')) {
            foreach ($request->icon as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only png file is supported.');
                }
            }
        }

        if ($request->sub_category){
            $parent = $request->sub_category;
        }elseif ($request->category){
            $parent = $request->category;
        }else{
            $parent = null;
        }

        try {
            $category->parent_id = $parent;
            $category->name = clean($request->name);
            if ($request->hasFile('icon')){
                if ($category->icon){
                    if (file_exists(public_path($category->icon))){
                        unlink(public_path($category->icon));
                    }
                }

                $images = $request->icon;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                }
                Image::make($image->getRealPath())
//                    ->resize(128, 128)
                    ->save(public_path('/upload/categories/' . $filename));
                $path = "/upload/categories/".$filename;
                $category->icon = $path;
            }
            $category->slug = strtolower(str_replace(' ', '_', clean($request->name))).'_'.time();
            $category->status = $request->has('status');
            $category->save();
            return $this->backWithSuccess('Category has been updated successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Category $category
     * @return \Illuminate\Http\Response
     */
    public function destroy(Category $category)
    {
        try {
            foreach ($category->childCategory as $child){
                foreach ($child->childCategory as $sChild){
                    $sChild->delete();
                }
                $child->delete();
            }
            $category->delete();

            return $this->backWithSuccess('Category has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function forceDestroy(Category $category)
    {
        try {
            foreach ($category->childCategory as $child){
                foreach ($child->childCategory as $sChild){
                    if ($sChild->icon){
                        if (file_exists(public_path($sChild->icon))){
                            unlink(public_path($sChild->icon));
                        }
                    }
                    foreach ($sChild->products as $product){
                        $this->destroyProduct($product);
                    }
                    $sChild->forceDelete();
                }

                if ($child->icon){
                    if (file_exists(public_path($child->icon))){
                        unlink(public_path($child->icon));
                    }
                }
                foreach ($child->products as $product){
                    $this->destroyProduct($product);
                }
                $child->forceDelete();
            }

            if ($category->icon){
                if (file_exists(public_path($category->icon))){
                    unlink(public_path($category->icon));
                }
            }
            foreach ($category->products as $product){
                $this->destroyProduct($product);
            }
            $category->forceDelete();

            return $this->backWithSuccess('Category has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function destroyProduct($product)
    {
        try {
            $product->suppliers()->sync([]);
            $product->attributes()->sync([]);
            $product->attributeItems->each->forceDelete();
            foreach ($product->productImages as $image){
                if (file_exists(public_path($image->image))){
                    unlink(public_path($image->image));
                }
                $image->forceDelete();
            }
            $product->forceDelete();
            return $this->backWithSuccess($product->name.' has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
