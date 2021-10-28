<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\BlogCategory;
use App\Models\BlogPost;
use App\Models\BlogPostCommentSettings;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class BlogPostController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        if (BlogCategory::count() === 0){
            return $this->redirectBackWithWarning('Add any category at blog category.', 'admin.blog.category.index');
        }
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Blog Posts';
            $posts = BlogPost::all();
            return view('backend.pages.blogs.post.index', compact('title', 'generalSettings', 'posts'));
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'New Blog Posts';
            $categories = BlogCategory::where('status', true)->get();
            $post = null;
            return view('backend.pages.blogs.post.form', compact('title', 'generalSettings', 'categories', 'post'));
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
            'category' => ['required', 'integer'],
            'title' => ['required', 'string', 'max:255'],
            'body' => ['required', 'string',],
            'post_tags' => ['nullable', 'string'],
            'status' => ['nullable'],
            'thumbnail' => ['nullable'],
        ]);
        // for validation check
        $acceptable = ['jpeg', 'jpeg', 'png', 'jpg', 'gif'];
        if ($request->hasFile('thumbnail')) {
            foreach ($request->thumbnail as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                }
            }
        }

        try {
            $inputs = $request->all();
            unset($inputs['_token']);
            if ($request->hasFile('thumbnail')) {
                $images = $request->thumbnail;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                }
                Image::make($image->getRealPath())
//                    ->resize(128, 128)
                    ->save(public_path('/upload/bolg-post/' . $filename));
                $path = "/upload/bolg-post/".$filename;
                $inputs['thumbnail'] = $path;
            }

            $slug = str_replace(' ', '-', strtolower(clean($inputs['title']))).'-'.time();

            $post = new BlogPost();
            $post->category_id = $inputs['category'];
            $post->user_id = auth()->user()->id;
            $post->title = clean($inputs['title']);
            if ($request->hasFile('thumbnail')) {
                $post->thumbnail = clean($inputs['thumbnail']);
            }
            $post->body = clean($inputs['body']);
            $post->tags = clean($inputs['post_tags']);
            $post->slug = $slug;
            $post->status = $inputs['status']?true:false;
            $post->save();
            return $this->backWithSuccess('Blog post has been saved successfully');
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
    public function show(BlogPost $post)
    {
        try {
            if ($post->status){
                $post->update(['status' => false]);
                $notification = (object)[
                    'status' => false,
                    'message' => "Deactivated Successfully......"
                ];
            }else{
                $post->update(['status' => true]);
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
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit(BlogPost $post)
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'New Blog Posts';
            $categories = BlogCategory::where('status', true)->get();
            return view('backend.pages.blogs.post.form', compact('title', 'generalSettings', 'categories', 'post'));
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
    public function update(Request $request, BlogPost $post)
    {
        $this->validate($request, [
            'category' => ['required', 'integer'],
            'title' => ['required', 'string', 'max:255'],
            'body' => ['required', 'string',],
            'post_tags' => ['nullable', 'string'],
            'status' => ['nullable'],
            'thumbnail' => ['nullable'],
        ]);
        // for validation check
        $acceptable = ['jpeg', 'jpeg', 'png', 'jpg', 'gif'];
        if ($request->hasFile('thumbnail')) {
            foreach ($request->thumbnail as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                }
            }
        }

        try {
            $inputs = $request->all();
            unset($inputs['_token']);
            if ($request->hasFile('thumbnail')) {
                if ($post->thumbnail){
                    if (file_exists(public_path($post->thumbnail))){
                        unlink(public_path($post->thumbnail));
                    }
                }

                $images = $request->thumbnail;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                }
                Image::make($image->getRealPath())
//                    ->resize(128, 128)
                    ->save(public_path('/upload/bolg-post/' . $filename));
                $path = "/upload/bolg-post/".$filename;
                $inputs['thumbnail'] = $path;
            }

            $post->category_id = $inputs['category'];
            $post->title = clean($inputs['title']);
            if ($request->hasFile('thumbnail')) {
                $post->thumbnail = clean($inputs['thumbnail']);
            }
            $post->body = clean($inputs['body']);
            $post->tags = clean($inputs['post_tags']);
            $post->status = $inputs['status']?true:false;
            $post->save();
            return $this->backWithSuccess('Blog post has been updated successfully');
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
    public function destroy(BlogPost $post)
    {
        try {
            if ($post->thumbnail){
                if (file_exists(public_path($post->thumbnail))){
                    unlink(public_path($post->thumbnail));
                }
            }
            $post->delete();
            return $this->backWithSuccess('Blog post has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
    /*
     * Comment Settings
     */
    public function commentSettingsIndex()
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '. 'Blog Post\'s Comment Settings';
            $commentSetting = BlogPostCommentSettings::first();
            return view('backend.pages.blogs.comment',compact('generalSettings', 'title', 'commentSetting'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function storeCommentSettings(Request $request)
    {
        $this->validate($request, [
            'code' => ['required']
        ]);
        try {
            $commentSetting = BlogPostCommentSettings::first()?BlogPostCommentSettings::first(): new BlogPostCommentSettings();
            $commentSetting->code = $request->code;
            $commentSetting->save();
            return $this->backWithSuccess('Comment settings updated successfully.');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
