<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CountryList;
use App\Models\DistrictList;
use Illuminate\Http\Request;

class DistrictController extends Controller
{
    public function getDistrictInfo(Request $request)
    {
        $district = DistrictList::where('name',ucwords($request->data))->first();
        $thanas = $district->thana;
        $thanaView = [];
        foreach ($thanas as $thana){
            $thanaView [] = '<option value="'.$thana->name.'">'.$thana->district->name.'</option>';
        }

        $postOffices = $district->postOffice;
        $postOfficeView = [];
        foreach ($postOffices as $postOffice){
            $postOfficeView [] = '<option value="'.$postOffice->post_code.'">'.$postOffice->name.'</option>';
        }

        return response()->json(['thana' => $thanaView, 'postOffice' => $postOfficeView]);
    }

    public function getCountry()
    {
        $countries = CountryList::all();
        return response()->json($countries);
    }

    public function getDistrict(Request $request)
    {
//        $countries = CountryList::all();
        $districts = DistrictList::whereIn('country_list_id', $request->countries)->get();
        return response()->json($districts);
    }
}
