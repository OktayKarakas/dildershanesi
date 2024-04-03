<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();

        // Check if user came from registration and has a previous URL
        if ($request->session()->has('previous_url') && $request->session()->has('on_register_page')) {
            $previousUrl = $request->session()->get('previous_url');
            $request->session()->forget(['previous_url', 'on_register_page']);
            return redirect()->to($previousUrl);
        }

        return redirect()->intended(RouteServiceProvider::HOME);
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        if ($request->session()->has('previous_url') && $request->session()->has('on_register_page')) {
            $request->session()->forget(['previous_url', 'on_register_page']);
        }

        return redirect('/');

    }
}
