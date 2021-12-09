<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AdminMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle(Request $request, Closure $next)
    {
//        return $next($request);
        if (Auth::check() && !Auth::user()->hasRole('customer')){
            return $next($request);
        }else {
//            abort(403);
            $notification = [
                'message' => 'Sorry no route found.',
                'alert-type' => 'error'
            ];
            return back()->with($notification);
        }
    }
}
