<?php

namespace App\Http\Controllers\GuestView;

use App\Http\Controllers\Controller;
use App\Models\Advertisement;
use App\Models\Product;
use Illuminate\Http\Request;

class GuestController extends Controller
{

    public function __construct()
    {
        parent::__construct();
    }

    public function index()
    {
        try {
            $advertiseGroup1 = Advertisement::all()
                ->where('status', true)
                ->random(2);
            $except = [];
            foreach ($advertiseGroup1 as $item){
                $except [] = $item->id;
            }
            $advertiseGroup2 = Advertisement::all()
                    ->where('status', true)
                    ->count();
            if ( $advertiseGroup2  >= 2){
                $advertiseGroup2 = Advertisement::all()
                    ->where('status', true)
                    ->whereNotIn('id', $except)
                    ->random(2);
            }


            return view('welcome', compact('advertiseGroup1', 'advertiseGroup2'));
        }catch (\Throwable $th){
            return $this->backWithError($th->getMessage());
        }
    }

    public function productQuickView(Product $product)
    {
//        try {
            return view('forntend.layouts.ajax.product-quick-view', compact('product'));
//        }catch (\Throwable $th){
//            return $this->backWithError($th->getMessage());
//        }
    }
}
