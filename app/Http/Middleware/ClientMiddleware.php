<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class ClientMiddleware
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
        if (Auth::check() && Auth::user()->hasRole('customer')){
            return $next($request);
        }else {
            $notification = [
                'message' => 'Sorry no route found.',
                'alert-type' => 'error'
            ];
            return back()->with($notification);
        }
        abort(403);
    }
}
