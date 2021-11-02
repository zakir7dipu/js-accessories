<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\GeneralSettings;
use App\Models\Slider;
use Illuminate\Http\Request;
use Intervention\Image\Facades\Image;

class SliderController extends Controller
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'All Sliders';
            $sliders = Slider::all();
            return view('backend.pages.widgets.sliders.index', compact('title', 'generalSettings', 'sliders'));
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Add New Slider';
            $slider = null;
            return view('backend.pages.widgets.sliders.form', compact('title', 'generalSettings', 'slider'));
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
            'name' => ['required', 'string', 'max:255'],
            'line1' => ['string', 'max:255'],
            'line2' => ['string', 'max:255'],
            'line3' => ['string', 'max:255'],
            'button_text' => ['string', 'max:255'],
            'button_url' => ['string', 'max:255'],
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
            $slider = new Slider();
            $slider->name = $request->name;
            $slider->line1 = $request->line1;
            $slider->line2 = $request->line2;
            $slider->line3 = $request->line3;
            $slider->btn_text = $request->button_text;
            $slider->btn_url = $request->button_url;

            if ($request->hasFile('image')) {
                $images = $request->image;
                foreach ($images as $img) {
                    $image = $img;
                    $x = 'abcdefghijklmnopqrstuvwxyz0123456789';
                    $x = str_shuffle($x);
                    $x = substr($x, 0, 6) . 'DAC.';
                    $filename = time() . $x . $image->getClientOriginalExtension();
                    Image::make($image->getRealPath())
                    ->resize(1583, 540)
                        ->save(public_path('/upload/widgets/sliders/' . $filename));
                    $path = 'upload/widgets/sliders/' . $filename;
                }
                $slider->image = $path;
            }
            $slider->save();

            return $this->backWithSuccess('Slider has been saved successfully');
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
    public function show(Slider $slider)
    {
        try {
            if ($slider->status){
                $slider->update(['status' => false]);
                $notification = (object)[
                    'alertType' => 'warning',
                    'message' => "Slider's status deactivated successfully"
                ];
            }else{
                $slider->update(['status' => true]);
                $notification = (object)[
                    'alertType' => 'success',
                    'message' => "Slider's status activated successfully"
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
    public function edit(Slider $slider)
    {
        try {
            $generalSettings = GeneralSettings::first();
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Add New Slider';
            return view('backend.pages.widgets.sliders.form', compact('title', 'generalSettings', 'slider'));
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
    public function update(Request $request, Slider $slider)
    {
        $this->validate($request, [
            'name' => ['required', 'string', 'max:255'],
            'line1' => ['string', 'max:255'],
            'line2' => ['string', 'max:255'],
            'line3' => ['string', 'max:255'],
            'button_text' => ['string', 'max:255'],
            'button_url' => ['string', 'max:255'],
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
            $slider->name = $request->name;
            $slider->line1 = $request->line1;
            $slider->line2 = $request->line2;
            $slider->line3 = $request->line3;
            $slider->btn_text = $request->button_text;
            $slider->btn_url = $request->button_url;

            if ($request->hasFile('image')) {
                if ($slider->image){
                    if (file_exists(public_path($slider->image))){
                        unlink(public_path($slider->image));
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
                        ->save(public_path('/upload/widgets/sliders/' . $filename));
                    $path = 'upload/widgets/sliders/' . $filename;
                }
                $slider->image = $path;
            }
            $slider->save();

            return $this->backWithSuccess('Slider has been updated successfully');
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
    public function destroy(Slider $slider)
    {
        try {
            if ($slider->image){
                if (file_exists(public_path($slider->image))){
                    unlink(public_path($slider->image));
                }
            }
            $slider->delete();
            return $this->backWithSuccess('Slider has been deleted successfully');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }
}
