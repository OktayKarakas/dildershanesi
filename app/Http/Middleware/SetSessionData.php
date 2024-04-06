<?php

namespace App\Http\Middleware;

use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class SetSessionData
{
    /**
     * Handle an incoming request.
     *
     * @param \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response) $next
     */
    public function handle(Request $request, Closure $next)
    {
        // Set session data
        $user = auth()->user();
        $slug = $request->route('slug');
        if($user) {
            return $next($request);
        }
        if($request->session()->has('is_course_get') && $request->session()->get('course_slug')){
            $request->session()->forget(['is_course_get','course_slug']);
        }
        $request->session()->put('is_course_get', true);
        $request->session()->put('course_slug', $slug);
        return redirect('/register');
    }
}
