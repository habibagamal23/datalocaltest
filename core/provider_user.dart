import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localdata_app/core/shared.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ProviderUser extends ChangeNotifier{

 bool _isLog = false;
 String? _username;
 String? _password;

 bool get isLog => _isLog;
 String? get username => _username;
 String? get password => _password;

 Future<void>tryLogin()async{
   SharedPreferences sha = await SharedPreferences.getInstance();
   _username = sha.getString('username');
   _password = sha.getString('password');
   _isLog =  _username != null;
   notifyListeners();
 }

 Future<void>saveName(String name,String password)async{
   SharedPreferences sha = await SharedPreferences.getInstance();
   await sha.setString('username', name);
   await sha.setString('password', password);
   _username = name;
   _password = password;
   _isLog = true;
   notifyListeners();
 }

 Future<void>LogOut()async{
   SharedPreferences sha = await SharedPreferences.getInstance();
   await sha.remove('username');
   await sha.remove('password');
   _username = null;
   _password = null;
   _isLog = true;
 }
}