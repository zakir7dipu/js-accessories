<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Models\GeneralSettings;
use App\Models\Supplier;
use Illuminate\Http\Request;

class SupplierController extends Controller
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
            $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Suppliers';
            $suppliers = Supplier::all();
            return view('backend.pages.suppliers.index', compact('title', 'generalSettings', 'suppliers'));
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
        $generalSettings = GeneralSettings::first();
        $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Add New Supplier';
        $supplier = null;
        return view('backend.pages.suppliers.form', compact('title', 'generalSettings', 'supplier'));
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
            'company_name' => ['required', 'string', 'max:250'],
            'url' => ['required', 'string'],
            'email' => ['nullable', 'email'],
            'phone' => ['nullable', 'string'],
        ]);
        try {
            // for validation check
            $acceptable = ['jpeg', 'png', 'jpg', 'gif'];
            if ($request->hasFile('image')) {
                foreach ($request->logo as $img) {
                    if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                        return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                    }
                }
            }

            $supplier = new Supplier();
            if ($request->hasFile('logo')) {
                // insert new file
                $images = $request->logo;
                foreach ($images as $image){
                    //image name
                    $filename = time().$image->getClientOriginalName();
                    //upload image
                    $image->move(public_path('/upload/suppliers'), $filename);
                }

                $supplier->logo = '/upload/suppliers/'.$filename;
            }
            $value = $request->url;
            if (!str_contains($value, 'https://')) {
                $value = 'https://' . $value;
            }
            $supplier->company_name= $request->company_name;
            $supplier->email= $request->email;
            $supplier->phone= $request->phone;
            $supplier->url=  $value;
            $supplier->status = $request->status=='on'?true:false;
            $supplier->save();
            return $this->backWithSuccess('Supplier created successfully.');
        }catch (\Exception $th){
            return redirect()->back()->with('error', $th->getMessage());
        }
    }

    /**
     * Display the specified resource.
     *
     * @param  Supplier $supplier
     * @return \Illuminate\Http\Response
     */
    public function show(Supplier $supplier)
    {
        if ($supplier->status){
            $supplier->status = false;
            $notification = (object)[
                'status' => false,
                'message' => "Deactivated Successfully......"
            ];
        }else{
            $supplier->status = true;
            $notification = (object)[
                'status' => true,
                'message' => "Active Successfully......"
            ];
        }
        $supplier->save();

        return response()->json($notification);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  Supplier $supplier
     * @return \Illuminate\Http\Response
     */
    public function edit(Supplier $supplier)
    {
        $generalSettings = GeneralSettings::first();
        $title = ($generalSettings?$generalSettings->site_name:'').' | '.'Edit Supplier';
        return view('backend.pages.suppliers.form', compact('title', 'generalSettings', 'supplier'));
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  Supplier $supplier
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Supplier $supplier)
    {
        $this->validate($request, [
            'company_name' => ['required', 'string', 'max:250'],
            'url' => ['required', 'string'],
            'email' => ['nullable', 'email'],
            'phone' => ['nullable', 'string'],
        ]);
        try {
            // for validation check
            $acceptable = ['jpeg', 'png', 'jpg', 'gif'];
            if ($request->hasFile('image')) {
                foreach ($request->logo as $img) {
                    if (!in_array($img->getClientOriginalExtension(), $acceptable)) {
                        return $this->backWithWarning('Only jpeg, png, jpg and gif file is supported.');
                    }
                }
            }

            if ($request->hasFile('logo')) {
                //delete old image
                if ($supplier->logo){
                    if (file_exists(public_path($supplier->logo))){
                        unlink(public_path($supplier->logo));
                    }
                }
                // insert new file
                $images = $request->logo;
                foreach ($images as $image){
                    //image name
                    $filename = time().$image->getClientOriginalName();
                    //upload image
                    $image->move(public_path('/upload/suppliers'), $filename);
                }

                $supplier->logo = '/upload/suppliers/'.$filename;
            }
            $value = $request->url;
            if (!str_contains($value, 'https://')) {
                $value = 'https://' . $value;
            }
            $supplier->company_name= $request->company_name;
            $supplier->email= $request->email;
            $supplier->phone= $request->phone;
            $supplier->url=  $value;
            $supplier->status = $request->status=='on'?true:false;
            $supplier->save();
            return $this->backWithSuccess('Supplier updated successfully.');
        }catch (\Exception $th){
            return redirect()->back()->with('error', $th->getMessage());
        }
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  Supplier $supplier
     * @return \Illuminate\Http\Response
     */
    public function destroy(Supplier $supplier)
    {
        try {
            //delete image
            if ($supplier->logo){
                if (file_exists(public_path($supplier->logo))){
                    unlink(public_path($supplier->logo));
                }
            }
            $supplier->delete();
            return $this->backWithSuccess('Supplier Deleted successfully.');
        }catch (\Exception $th){
            return redirect()->back()->with('error', $th->getMessage());
        }
    }
}
