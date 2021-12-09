<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Models\CountryList;
use App\Models\DistrictList;
use App\Models\ThanaList;
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
        $districts = DistrictList::whereIn('country_list_id', $request->countries)->get();
        return response()->json($districts);
    }

    public function getPoliceStation(Request $request)
    {
        $thanas = ThanaList::whereIn('district_list_id', $request->districts)->get();
        return response()->json($thanas);
    }

    public function saveOrderArea(Request $request)
    {
        $this->validate($request, [
            'country' => ['required'],
            'state' => ['required'],
            'thana' => ['required']
        ]);
        try {
            //country active
            CountryList::whereIn('id', explode(",", $request->country))->get()->each->update(['status' => true]);
            //country deactivate
            CountryList::whereNotIn('id', explode(",", $request->country))->get()->each->update(['status' => false]);
            //state active
            DistrictList::whereIn('id', explode(",", $request->state))->get()->each->update(['status' => true]);
            //state deactivate
            DistrictList::whereNotIn('id', explode(",", $request->state))->get()->each->update(['status' => false]);
            //police station active
            ThanaList::whereIn('id', explode(",", $request->thana))->get()->each->update(['status' => true]);
            //police station deactivate
            ThanaList::whereNotIn('id', explode(",", $request->thana))->get()->each->update(['status' => false]);
            return $this->backWithSuccess('Order areas have been updated successfully.');
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function trackOrderArea(CountryList $country, DistrictList $state, ThanaList $police_station)
    {
       return response()->json(['country'=>$country, 'state'=>$state, 'police_station'=>$police_station]);
    }
}
