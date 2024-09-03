<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\View\View;
use App\Models\WebsiteData;
use App\Services\ProductApiDataService;

class AuthenticatedSessionController extends Controller
{
    
    protected $productApiDataService;

    public function __construct(ProductApiDataService $productApiDataService)
    {
        $this->productApiDataService = $productApiDataService;
    }

    /**
     * Display the login view.
     */
    public function create(): View
    {
        $this->productApiDataService->fetchDataAndStore();
        $websitedata = WebsiteData::first();
        return view('auth.login', compact('websitedata'));
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse
    {
        $request->authenticate();

        $request->session()->regenerate();

        return redirect()->intended(route('backend.dashboard', absolute: false));
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse
    {
        Auth::guard('web')->logout();

        $request->session()->invalidate();

        $request->session()->regenerateToken();

        return redirect()->route('login');
    }
}
