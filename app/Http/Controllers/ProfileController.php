<?php

namespace App\Http\Controllers;

use App\Http\Requests\ProfileUpdateRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Redirect;
use Illuminate\View\View;
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Storage;



class ProfileController extends Controller
{
    /**
     * Display the user's profile form.
     */
    public function edit()
    {
        $user = Auth::user();
        return view('backend.profile.profile', compact('user'));
    }

    public function update(Request $request)
    {    
        $user = User::findOrFail($request->id);
        
        // Update the fields
        $user->name = $request->input('name');
        $user->email = $request->input('email');
        $user->address = $request->input('address');
        $user->phone = $request->input('phone');
        $user->country = $request->input('country');
        $user->account_type = $user->getOriginal('account_type');

        // Handle file uploads
        if ($request->hasFile('profile_photo_path')) {
            $profilephoto = $request->file('profile_photo_path');
            $profilephotoName = $user->id . time() . '_profile.' . $profilephoto->getClientOriginalExtension();
            $profilephoto->move(public_path('storage/backend/profile_photo/'), $profilephotoName);
            $user->profile_photo_path = $profilephotoName;
        } else {
            $user->profile_photo_path = $user->getOriginal('profile_photo_path');
        }

        // Save the updated data
        $user->save();

    return redirect()->route('backend.profile.profile')->with('success', 'Profile updated successfully')->with('tab', 'profile-edit');

    } 

    
    public function changepassword(Request $request)
    {
        // Validate the request data
        $request->validate([
            'password' => 'required',
            'newpassword' => 'required|min:8',
            'renewpassword' => 'required|same:newpassword',
        ]);

        $user = Auth::user();

        // Check if the current password matches
        if (!Hash::check($request->password, $user->password)) {

            return redirect()->route('backend.profile.profile')->with('error', 'Current password is incorrect')->with('tab', 'profile-change-password');
        
        } else {

            // Update the password
            $user->password = Hash::make($request->newpassword);
            $user->save();
            return redirect()->route('backend.profile.profile')->with('success', 'Password changed successfully')->with('tab', 'profile-change-password');
        
        }

    }


    /**
     * Delete the user's account.
     */
    public function destroy(Request $request): RedirectResponse
    {
        $request->validateWithBag('userDeletion', [
            'password' => ['required', 'current_password'],
        ]);

        $user = $request->user();

        Auth::logout();

        $user->delete();

        $request->session()->invalidate();
        $request->session()->regenerateToken();

        return Redirect::to('/');
    }
}
