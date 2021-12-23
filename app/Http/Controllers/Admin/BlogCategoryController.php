<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BlogCategory;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use function Symfony\Component\Translation\t;

class BlogCategoryController extends Controller
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Blog Categories';
            $categories = BlogCategory::all();
            return view('backend.pages.blogs.categories.index', compact('title', 'generalSettings', 'categories'));
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
            $modalHeader = '<div class="modal-header">
                    <h5 class="modal-title" id="blogCategoryModalTitle">'. __('Add New Blog Category') .'</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>';
            $form = '<form action="'. route('admin.blog.category.store') .'" method="post">
                    <div class="modal-body">
                        <input type="hidden" name="_token" value="'.csrf_token().'">
                        <p class="mb-1 font-weight-bold">'.__('Category Name :').'</p>
                        <div class="input-group input-group-lg mb-3">
                            <input type="tel" name="name" class="form-control text-capitalize" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                   placeholder="'.__('Category phone').'" value="'.old('name').'">
                            <br>
                        </div>
                        <table class="table table-responsive-sm">
                            <label for="programStatus">
                                <span class="font-weight-bold">'.__('Publish Status').'</span>
                            </label>
                            <tbody>
                            <tr>
                                <td>
                                    <label class="switch float-left">
                                        <input type="checkbox" name="status" id="blogCategoryStatus">
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">'.__('Close').'</button>
                        <button type="submit" class="btn btn-danger">'.__('Save').'</button>
                    </div>
                </form>';
            $output = $modalHeader . $form;
            return response()->json($output);
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
            'name' => ['required', 'string']
        ]);

        try {
            if (str_contains($request->name, ',')){
                $categories = explode(',', $request->name);
                foreach ($categories as $category){
                    BlogCategory::create([
                        'name' => ucwords($category),
                        'status' => $request->has('status')
                    ]);
                }
            }else{
                BlogCategory::create([
                    'name' => ucwords($request->name),
                    'status' => $request->has('status')
                ]);
            }

            return $this->backWithSuccess('Blog category has been created successfully');
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
    public function show(BlogCategory $category)
    {
        try {
            $modalHeader = '<div class="modal-header">
                    <h5 class="modal-title" id="blogCategoryModalTitle">'. __('Edit ').$category->name .'</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>';
            $form = '<form action="'. route('admin.blog.category.update', $category->id) .'" method="post">
                    <div class="modal-body">
                        '.method_field('PUT').'
                        <input type="hidden" name="_token" value="'.csrf_token().'">
                        <p class="mb-1 font-weight-bold">'.__('Category Name :').'</p>
                        <div class="input-group input-group-lg mb-3">
                            <input type="tel" name="name" class="form-control text-capitalize" aria-label="Large" aria-describedby="inputGroup-sizing-sm"
                                   placeholder="'.__('Category phone').'" value="'.$category->name.'">
                            <br>
                        </div>
                        <table class="table table-responsive-sm">
                            <label for="programStatus">
                                <span class="font-weight-bold">'.__('Publish Status').'</span>
                            </label>
                            <tbody>
                            <tr>
                                <td>
                                    <label class="switch float-left">
                                        <input type="checkbox" name="status" '.($category->status?'checked':'').'>
                                        <span class="slider round"></span>
                                    </label>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">'.__('Close').'</button>
                        <button type="submit" class="btn btn-danger">'.__('Save').'</button>
                    </div>
                </form>';
            $output = $modalHeader . $form;
            return response()->json($output);
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(BlogCategory $category)
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
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, BlogCategory $category)
    {
        $this->validate($request, [
            'name' => ['required', 'string']
        ]);

        try {
            $category->update(['name' => ucwords($request->name), 'status' => $request->has('status')]);
            return $this->backWithSuccess('Blog category has been updated successfully');
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
    public function destroy(BlogCategory $category)
    {
        try {
            foreach ($category->posts as $post){
                $post->delete();
            }
            $category->delete();
            return $this->backWithSuccess('Blog category has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function forceDestroy(BlogCategory $category)
    {
        try {
            foreach ($category->posts as $post){
                if ($post->thumbnail){
                    if (file_exists(public_path($post->thumbnail))){
                        unlink(public_path($post->thumbnail));
                    }
                }
                $post->forceDelete();
            }
            $category->forceDelete();
            return $this->backWithSuccess('Blog category has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
