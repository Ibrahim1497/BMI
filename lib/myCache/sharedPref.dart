import 'package:shared_preferences/shared_preferences.dart';

class MyCache{
   static late SharedPreferences sharedPreferences;
 static init()async{
    sharedPreferences=await SharedPreferences.getInstance();
  }
 static getBool({required String sharedKey}){
   return  sharedPreferences.getBool(sharedKey) ?? false;
  }

  static putBool({required String sharedKey,required bool value})
  async{
   await sharedPreferences.setBool(sharedKey, value);
  }
}