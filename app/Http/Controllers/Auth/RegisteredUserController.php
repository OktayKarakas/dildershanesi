<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Controllers\TopicController;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Auth\Events\Registered;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Illuminate\View\View;
class RegisteredUserController extends Controller
{
    /**
     * Display the registration view.
     */
    public function create(Request $request): View
    {
        if ($previousUrl = redirect()->getUrlGenerator()->previous()) {
            $request->session()->put('previous_url', $previousUrl);
        }

        $request->session()->put('on_register_page', true);
        return view('auth.register');
    }

    /**
     * Handle an incoming registration request.
     *
     * @throws \Illuminate\Validation\ValidationException
     */
    public function store(Request $request): RedirectResponse
    {

        if ($request->session()->has('previous_url') && $request->session()->has('on_register_page')) {
            $request->session()->forget(['previous_url', 'on_register_page']);
        }
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
        ]);

        // Store the previous URL to the session if available
        $previousUrl = $request->input('previous_url');

        $user = User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'is_pro_member' => false,
            'pro_member_end_date' => null
        ]);

        event(new Registered($user));

        Auth::login($user);

        // If user came from previous URL, redirect back. Otherwise, redirect to '/'

        if($request->session()->has('is_course_get') && $request->session()->get('course_slug')){
            $topic = new TopicController();
            $topic->course_register($request,$request->session()->get('course_slug'));
        }

        return $previousUrl ? redirect($previousUrl): redirect('/');
    }
}
