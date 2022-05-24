import 'package:shared_preferences/shared_preferences.dart';

 class CacheHelper {

   static SharedPreferences pref;
   static init()async{
   pref=  await SharedPreferences.getInstance();
   print("Shared Done");
   }
   static setString(key, value) async {
    pref.setString(key, value);
  }

   static setBoolean(key, value) async {
    return  pref.setBool(key, value);
    print("Set Done");
  }

   static setInt(key, value) async {
    pref.setInt(key, value);
    print("Set Done");
  }

   static Future getData(key) async {
    return pref.get(key);
  }

}
