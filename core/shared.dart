
import 'package:shared_preferences/shared_preferences.dart';

// class Shared {
//
// static String keyName = "username";
// static String keyPassword = "password";
// static String keyPhone = "phone";
// static String keyEmail = "email";
//
//
//
//  Future setName(String username)async{
//     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//     await sharedPreferences.setString(Shared.keyName,username);
//  }
//
//  Future <String?>getName()async{
//    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//    return sharedPreferences.getString(Shared.keyName);
//
//  }
//
//  Future clearName()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.remove(keyName);
// }
//
//  Future setEmail(String email)async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   await sharedPreferences.setString(keyEmail,email);
// }
//
//  Future <String?>getEmail()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   return sharedPreferences.getString(Shared.keyEmail);
//
// }
//  Future clearEmail()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.remove(keyEmail);
// }
//
//  Future setPassword(String password)async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   await sharedPreferences.setString(keyPassword,password);
// }
//
//  Future <String?>getPassword()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   return sharedPreferences.getString(Shared.keyPassword);
//
// }
//  Future clearPassword()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.remove(keyPassword);
// }
//  Future setPhone(int phone)async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   await sharedPreferences.setInt(keyPhone,phone);
// }
//
//  Future <int?>getPhone()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   return sharedPreferences.getInt(Shared.keyPhone);
//
// }
//  Future clearPhone()async{
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.remove(keyPhone);
// }
//
//
// }



// class Shared{
//   static  SharedPreferences ? sharedPreferences;
//   static init()async {
//     sharedPreferences = await SharedPreferences.getInstance();
//   }
//   static setInt({required sharedKey key,required int value}){
//     sharedPreferences?.setInt(key.name, value);
//   }
//   static int  getInt(sharedKey key){
//     return sharedPreferences?.getInt(key.name) ?? 0;
//   }
//   static setString({required sharedKey key,required String value}){
//     sharedPreferences?.setString(key.name, value);
//   }
//   static String  getString(sharedKey key){
//     return sharedPreferences?.getString(key.name) ?? "";
//   }
//   static setDouble({required sharedKey key,required double value}){
//     sharedPreferences?.setDouble(key.name, value);
//   }
//   static double  getDouble(sharedKey key){
//     return sharedPreferences?.getDouble(key.name)?? 0.0;
//   }
//   static setBool({required sharedKey key,required bool value}){
//     sharedPreferences?.setBool(key.name, value);
//   }
//   static bool  getBool(sharedKey key){
//     return sharedPreferences?.getBool(key.name)?? false;
//   }
//   static setListString(sharedKey key,List<String> value){
//     sharedPreferences!.setStringList(key.name, value);
//   }
//   static getListString (sharedKey key){
//     return sharedPreferences!.getStringList(key.name);
//   }
//
//   remove(key){
//     sharedPreferences?.remove(key);   // one value by key
//   }
//   delete(){
//     sharedPreferences?.clear(); // delete over all data
//   }
// }

 class Shared {
static late SharedPreferences sharedPreferences;
static sharedInitialization() async{
   sharedPreferences = await SharedPreferences.getInstance();
  }
static Future <bool> setData({required String key,required dynamic value})async{

   if(value is int){
    await sharedPreferences.setInt(key, value);
    return true;
   }

   if(value is String){
    await sharedPreferences.setString(key, value);
    return true;
   }

   if(value is bool){
    await sharedPreferences.setBool(key, value);
    return true;
   }

   if(value is double){
    await sharedPreferences.setDouble(key, value);
    return true;
   }
   return false;
  }

static dynamic getData({required String key}){
   return sharedPreferences.get(key);
  }

static Future<void> deleteData()async{
  await sharedPreferences.remove;
  }

 }