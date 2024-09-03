<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;

class UserController extends Controller
{
    
    public function index()
    {
        $users = User::all();
        return view('backend.users.index', compact('users'));
    } 
    
    public function add()
    {
        return view('backend.users.add');
    }
    
    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required',
            'email' => 'required',
            'phone' => 'required',
            'address' => 'required',
            'country' => 'required',
            'account_type' => 'required',
        ]);
        $user = new User();
        $user->name = $request->name;
        $user->email = $request->email;
        $user->phone = $request->phone;
        $user->password= $request->password;
        $user->address = $request->address;
        $user->country = $request->country;
        $user->account_type = $request->account_type;
        if ($user->save()) {
            session()->flash('success-msg', 'User Added Successfully !');
        } else {
            session()->flash('error-msg', 'Error !');
        }
        return redirect()->route('backend.users.index');
    }

    public function view(Request $request)
    {    
        $user = User::findOrFail($request->id);
        return view('backend.users.view', compact('user'));
    } 

    public function edit(Request $request)
    {    
        $user = User::findOrFail($request->id);
        return view('backend.users.edit', compact('user'));
    } 

    public function update(Request $request, $id)
    {    
        $user = User::findOrFail($id);
        $user->update($request->all());
        return redirect()->route('backend.users.index')->with('success', 'User Details updated successfully');
    } 
    
    public function delete($id)
    {
        $user = User::findOrFail($id);
        $user->delete();
        return redirect()->route('backend.users.index')->with('success', 'User deleted successfully');
    }

}
