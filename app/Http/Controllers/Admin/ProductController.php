<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Attribute;
use App\Models\AttributeItem;
use App\Models\Category;
use App\Models\Currency;
use App\Models\GeneralSettings;
use App\Models\Product;
use App\Models\ProductImage;
use App\Models\Supplier;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class ProductController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (Category::count() === 0){
            return $this->redirectBackWithWarning('Add any category at product category.', 'admin.e-commerce.category.index');
        }
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'All Products';
            $products = Product::all();
            $selectedItem = null;
            return view('backend.pages.e-commerce.products.index', compact('title', 'generalSettings', 'products', 'selectedItem'));
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Create New Product';
            $categories = Category::where('parent_id', null)->get();
            $currencies = Currency::all();
            $product = null;
            $selectedItem = null;
            $suppliers = Supplier::where('status', true)->get();
            return view('backend.pages.e-commerce.products.form', compact('title', 'generalSettings', 'product', 'categories', 'currencies', 'suppliers', 'selectedItem'));
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
            'sub_category' => ['required'],
            'pro_category' => ['nullable'],
            'name' => ['required', 'string', 'max:100'],
            'description' => ['required', 'string'],
            'price' => ['required'],
            'currency' => ['required'],
            'short_description' => ['required', 'string', 'max:200'],
            'tags' => ['nullable', 'string'],
            'unit_name' => ['required', 'string', 'max:200'],
            'gross_weight' => ['required', 'string', 'max:200'],
            'sku' => ['required', 'string', 'max:200'],
            'discount' => ['nullable'],
            'supplier' => ['nullable']
        ]);

        $productColor = [];
        if ($request->has('color_name')){
            if (count($request->color_name) !== count($request->color_details)){
                return $this->backWithWarning('Color attributes are not imputed correctly, please them correctly and try again later..');
            }else{
                for ($c = 0; $c < count($request->color_name); $c++){
                    $productColor [] = (object)[
                        'name' => $request->color_name[$c],
                        'details' => $request->color_details[$c],
                    ];
                }
            }
        }

        $productSize = [];
        if ($request->has('size_name')){
            if (count($request->size_name) !== count($request->size_details)){
                return $this->backWithWarning('Size attributes are not imputed correctly, please them correctly and try again later..');
            }else{
                for ($s = 0; $s < count($request->size_name); $s++){
                    $productSize [] = (object)[
                        'name' => $request->size_name[$s],
                        'details' => $request->size_details[$s],
                    ];
                }
            }
        }

        // for product image check
        $acceptable = ['jpeg', 'png', 'jpg', 'gif'];
        if ($request->hasFile('product_images')) {
            foreach ($request->product_images as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                }
            }
        }

        try {
            $product = new Product();
            $product->category_id = $request->pro_category!=null?$request->pro_category:$request->sub_category;
            $product->name = clean($request->name);
            $product->description = $request->description;
            $product->currency_id = $request->currency;
            $product->price = $request->price;
            $product->short_description = clean($request->short_description);
            $product->status = $request->has('status');
            $product->featured = $request->has('featured');
            $product->new_arrival = $request->has('new_arrival');
            $product->popular = $request->has('popular');
            $product->bestseller = $request->has('bestseller');
            $product->trending = $request->has('trending');
            $product->discount = $request->discount > 0?clean($request->discount):null;
            $product->slug = time();
            $product->sku = clean($request->sku);
            $product->unit_name = clean($request->unit_name);
            $product->gross_weight = clean($request->gross_weight);
            $product->tags = clean($request->tags);
            $product->save();

            if ($request->hasFile('product_images')) {
                $images = $request->product_images;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                    Image::make($image->getRealPath())
                    ->resize(800, 800)
                        ->save(public_path('/upload/products/' . $filename));
                    $path = "/upload/products/".$filename;
                    $productImage = new ProductImage();
                    $productImage->product_id = $product->id;
                    $productImage->name = $image->getClientOriginalName();
                    $productImage->image =$path;
                    $productImage->save();
                }
            }

            if (count($productColor) > 0){
                $attributes = Attribute::where('name', 'color')->first();
                $product->attributes()->sync([$attributes->id]);
//                'attribute_id', 'product_id', 'name', 'details'
                foreach ($productColor as $color){
                    $attributeItem = new AttributeItem();
                    $attributeItem->attribute_id = $attributes->id;
                    $attributeItem->product_id = $product->id;
                    $attributeItem->name = clean($color->name);
                    $attributeItem->details = clean($color->details);
                    $attributeItem->save();
                }
            }

            if (count($productSize) > 0){
                $attributes = Attribute::where('name', 'size')->first();
                $product->attributes()->sync([$attributes->id]);
//                'attribute_id', 'product_id', 'name', 'details'
                foreach ($productSize as $size){
                    $attributeItem = new AttributeItem();
                    $attributeItem->attribute_id = $attributes->id;
                    $attributeItem->product_id = $product->id;
                    $attributeItem->name = clean($size->name);
                    $attributeItem->details = clean($size->details);
                    $attributeItem->save();
                }
            }

            if ($request->supplier){
                $supplier = Supplier::find($request->supplier);
                if ($supplier){
                    $product->suppliers()->sync([$supplier->id]);
                }
            }
            $notification = [
                'message' => 'Product has been saved successfully',
                'alert-type' => 'success'
            ];
            return redirect()->route('admin.e-commerce.product.edit',$product->id)->with($notification);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show(Product $product)
    {
        $colors = [];
        $sizes = [];
        $colorAttribute = Attribute::where('name', 'color')->first();
        $sizeAtributes = Attribute::where('name', 'size')->first();
        foreach ($product->attributeItems as $item){
            if ($item->attribute_id === $colorAttribute->id){
                $colors[] = $item;
            }elseif ($item->attribute_id === $sizeAtributes->id){
                $sizes[] = $item;
            }
        }
        $data = (object)[
            'colors' => $colors,
            'sizes' => $sizes,
        ];
        return response()->json($data);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(Product $product)
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Edit '.$product->name;
            $categories = Category::where('parent_id', null)->get();
            $currencies = Currency::all();
            $suppliers = Supplier::where('status', true)->get();
            $selectedItem = $product->category;
            $parent = $product->category->parentCategory;
            if (!$parent->parent_id) {
                $selectedItem->sub_category = $product->category;
                $selectedItem->pro_category = null;
            }else{
                $selectedItem->sub_category = $parent;
                $selectedItem->pro_category = $product->category;
            }
            return view('backend.pages.e-commerce.products.form', compact('title', 'generalSettings', 'product', 'categories', 'currencies', 'suppliers', 'selectedItem'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Product $product)
    {
        $this->validate($request, [
            'sub_category' => ['required'],
            'pro_category' => ['nullable'],
            'name' => ['required', 'string', 'max:100'],
            'description' => ['required', 'string'],
            'price' => ['required'],
            'currency' => ['required'],
            'short_description' => ['required', 'string', 'max:200'],
            'tags' => ['nullable', 'string'],
            'unit_name' => ['required', 'string', 'max:200'],
            'gross_weight' => ['required', 'string', 'max:200'],
            'sku' => ['required', 'string', 'max:200'],
            'discount' => ['nullable'],
            'supplier' => ['nullable']
        ]);

        $productColor = [];
        if ($request->has('color_name')){
            if (count($request->color_name) !== count($request->color_details)){
                return $this->backWithWarning('Color attributes are not imputed correctly, please them correctly and try again later..');
            }else{
                for ($c = 0; $c < count($request->color_name); $c++){
                    $productColor [] = (object)[
                        'name' => $request->color_name[$c],
                        'details' => $request->color_details[$c],
                    ];
                }
            }
        }

        $productSize = [];
        if ($request->has('size_name')){
            if (count($request->size_name) !== count($request->size_details)){
                return $this->backWithWarning('Size attributes are not imputed correctly, please them correctly and try again later..');
            }else{
                for ($s = 0; $s < count($request->size_name); $s++){
                    $productSize [] = (object)[
                        'name' => $request->size_name[$s],
                        'details' => $request->size_details[$s],
                    ];
                }
            }
        }

        // for product image check
        $acceptable = ['jpeg', 'png', 'jpg', 'gif'];
        if ($request->hasFile('product_images')) {
            foreach ($request->product_images as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                }
            }
        }

        try {
            $product->category_id = $request->pro_category!=null?$request->pro_category:$request->sub_category;
            $product->name = clean($request->name);
            $product->description = $request->description;
            $product->currency_id = $request->currency;
            $product->price = $request->price;
            $product->short_description = clean($request->short_description);
            $product->status = $request->has('status');
            $product->featured = $request->has('featured');
            $product->new_arrival = $request->has('new_arrival');
            $product->popular = $request->has('popular');
            $product->bestseller = $request->has('bestseller');
            $product->trending = $request->has('trending');
            $product->discount = $request->discount > 0?clean($request->discount):null;
            $product->sku = clean($request->sku);
            $product->unit_name = clean($request->unit_name);
            $product->gross_weight = clean($request->gross_weight);
            $product->tags = clean($request->tags);
            $product->save();

            if ($request->hasFile('product_images')) {
                $images = $request->product_images;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                    Image::make($image->getRealPath())
                    ->resize(800, 800)
                        ->save(public_path('/upload/products/' . $filename));
                    $path = "/upload/products/".$filename;
                    $productImage = new ProductImage();
                    $productImage->product_id = $product->id;
                    $productImage->name = $image->getClientOriginalName();
                    $productImage->image =$path;
                    $productImage->save();
                }
            }

            //remove old attributes and attribute items
            $product->attributes()->sync([]);
            $product->attributeItems->each->delete();

            // add new attributes and attribute items
            if (count($productColor) > 0){
                $attributes = Attribute::where('name', 'color')->first();
                $product->attributes()->sync([$attributes->id]);
//                'attribute_id', 'product_id', 'name', 'details'
                foreach ($productColor as $color){
                    $attributeItem = new AttributeItem();
                    $attributeItem->attribute_id = $attributes->id;
                    $attributeItem->product_id = $product->id;
                    $attributeItem->name = clean($color->name);
                    $attributeItem->details = clean($color->details);
                    $attributeItem->save();
                }
            }

            if (count($productSize) > 0){
                $attributes = Attribute::where('name', 'size')->first();
                $product->attributes()->sync([$attributes->id]);
//                'attribute_id', 'product_id', 'name', 'details'
                foreach ($productSize as $size){
                    $attributeItem = new AttributeItem();
                    $attributeItem->attribute_id = $attributes->id;
                    $attributeItem->product_id = $product->id;
                    $attributeItem->name = clean($size->name);
                    $attributeItem->details = clean($size->details);
                    $attributeItem->save();
                }
            }

            if ($request->supplier){
                $supplier = Supplier::find($request->supplier);
                if ($supplier){
                    $product->suppliers()->sync([$supplier->id]);
                }
            }


            return $this->backWithSuccess('Product has been saved successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy(Product $product)
    {
        try {
            $product->suppliers()->sync([]);
            $product->attributes()->sync([]);
            $product->attributeItems->each->delete();
            foreach ($product->productImages as $image){
                if (file_exists(public_path($image->image))){
                    unlink(public_path($image->image));
                }
                $image->delete();
            }
            $product->delete();
            return $this->backWithSuccess($product->name.' has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function destroyAttribute(AttributeItem $item)
    {
        try {
            $attribute = $item->attribute;
            $product = $item->product;
            $item->delete();
            $attributeItems = [];
            foreach ($product->attributeItems as $attributeItem){
                if ($attributeItem->attribute_id === $attribute->id){
                    $attributeItems[] = $attributeItem;
                }
            }
            if (count($attributeItems) === 0){
                $attribute->products()->sync([]);
            }

            return response()->json($attribute);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function deleteImage(ProductImage $image)
    {
        try {
            if (file_exists(public_path($image->image))){
                unlink(public_path($image->image));
            }
            $image->delete();
            return response()->json('success');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function featureActivation(Request $request, Product  $product)
    {
        try {
            if ($product->getAttribute($request->type)){
                $product->update([$request->type => false]);
                $notification = (object)[
                    'alertType' => 'warning',
                    'message' => "Product'\s' ".$request->type." deactivated successfully"
                ];
            }else{
                $product->update([$request->type => true]);
                $notification = (object)[
                    'alertType' => 'success',
                    'message' => "Product'\s' ".$request->type." activated successfully"
                ];
            }
            return response()->json($notification);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
