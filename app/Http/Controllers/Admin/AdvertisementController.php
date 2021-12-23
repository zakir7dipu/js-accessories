<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\Advertisement;
use App\Models\GeneralSettings;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class AdvertisementController extends Controller
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Advertisement Settings';
            $advertisements = Advertisement::all();
            return view('backend.pages.advertisement-layouts.form', compact('title', 'generalSettings', 'advertisements'));
        }catch(\Throwable $th){
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
            Advertisement::create([
                'title' => 'Advertisement '. Advertisement::count()
            ]);
            return $this->backWithSuccess('An Advertise has been created successfully');
        }catch(\Throwable $th){
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
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  Advertisement $advertisement
     * @return \Illuminate\Http\Response
     */
    public function show(Advertisement $advertisement)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Advertisement $advertisement
     * @return \Illuminate\Http\Response
     */
    public function edit(Advertisement $advertisement)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Advertisement $advertisement
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Advertisement $advertisement)
    {
        $this->validate($request, [
            'title' => ['nullable', 'string', 'max:100'],
            'line1' => ['nullable', 'string', 'max:100'],
            'line2' => ['nullable', 'string', 'max:100'],
            'line3' => ['nullable', 'string', 'max:100'],
            'btn_text' => ['nullable', 'string', 'max:100'],
            'btn_url' => ['nullable', 'string', 'max:100']
        ]);
        // for product image check
        $acceptable = ['jpeg', 'png', 'jpg', 'gif'];
        if ($request->hasFile('image')) {
            foreach ($request->image as $img) {
                if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                    return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                }
            }
        }
        try {
            $advertisement->update([
                'title' => $request->title,
                'line1' => $request->line1,
                'line2' => $request->line2,
                'line3' => $request->line3,
                'btn_text' => $request->btn_text,
                'btn_url' => $request->btn_url,
                'status' => $request->has('status')
            ]);

            if ($request->hasFile('image')){
                if ($advertisement->image){
                    if (file_exists(public_path($advertisement->image))){
                        unlink(public_path($advertisement->image));
                    }
                }

                $images = $request->image;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                    Image::make($image->getRealPath())
                    ->resize(1583, 540)
                        ->save(public_path('/upload/advertises/' . $filename));
                }
                $path = "/upload/advertises/".$filename;
                $advertisement->update(['image' => $path]);
            }

            return $this->backWithSuccess($advertisement->title.' has been updated successfully.....');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Advertisement $advertisement
     * @return \Illuminate\Http\Response
     */
    public function destroy(Advertisement $advertisement)
    {
        try {
            $advertisement->delete();
            return $this->backWithSuccess($advertisement->title.' has been deleted successfully...');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function forceDestroy(Advertisement $advertisement)
    {
        try {
            if ($advertisement->image){
                if (file_exists(public_path($advertisement->image))){
                    unlink(public_path($advertisement->image));
                }
            }
            $advertisement->forceDelete();
            return $this->backWithSuccess($advertisement->title.' has been deleted successfully...');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
