import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
    // primaryColor:Color(0xFFE0E0E0) ,
    backgroundColor: Colors.white,
    textTheme: TextTheme(
        bodyText1: TextStyle(
            color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
        headline6: TextStyle(
            fontWeight: FontWeight.w700, fontSize: 20, color: Colors.grey)),
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xFFE0E0E0),
            statusBarIconBrightness: Brightness.dark),
        backgroundColor: Color(0xffE8E8E8),
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black)),
    scaffoldBackgroundColor: Color(0xFFE0E0E0),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      elevation: 1,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Color(0xffE8E8E8),
      selectedItemColor: Colors.black,
    ));
ThemeData dark = ThemeData(
    // primaryColor:Colors.white70 ,
    backgroundColor: Color(0xff333739),
    primarySwatch: Colors.grey,
    appBarTheme: AppBarTheme(
        titleTextStyle: TextStyle(
            color: Colors.white70, fontSize: 25, fontWeight: FontWeight.bold),
        backwardsCompatibility: false,
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Color(0xff333739),
            statusBarIconBrightness: Brightness.light),
        backgroundColor: Color(0xff333739),
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.white70)),
    textTheme: TextTheme(
      bodyText1: TextStyle(
          color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
    ),
    scaffoldBackgroundColor: Color(0xff333739),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.black87,
      selectedItemColor: Colors.white38,
    ));

class Changer with ChangeNotifier {
  // bool isDark = false;
  //
  // void changeMode() {
  //   isDark = !isDark;
  //
  //   notifyListeners();
  // }
  // //
  // // late ThemeData darkData = ThemeData(
  // //     // primaryColor:Colors.white70 ,
  // //     backgroundColor: Color(0xff333739),
  // //     primarySwatch: Colors.grey,
  // //     appBarTheme: AppBarTheme(
  // //         titleTextStyle: TextStyle(
  // //             color: Colors.white70, fontSize: 25, fontWeight: FontWeight.bold),
  // //         backwardsCompatibility: false,
  // //         systemOverlayStyle: SystemUiOverlayStyle(
  // //             statusBarColor: Color(0xff333739),
  // //             statusBarIconBrightness: Brightness.light),
  // //         backgroundColor: Color(0xff333739),
  // //         elevation: 0,
  // //         iconTheme: IconThemeData(color: Colors.white70)),
  // //     textTheme: TextTheme(
  // //         bodyText1: TextStyle(
  // //             fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white)),
  // //     scaffoldBackgroundColor: Color(0xff333739),
  // //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  // //       type: BottomNavigationBarType.fixed,
  // //       backgroundColor: Colors.black87,
  // //       selectedItemColor: Colors.white38,
  // //     ));
  // //
  // // late ThemeData lightData = ThemeData(
  // //     // primaryColor:Color(0xFFE0E0E0) ,
  // //     backgroundColor: Colors.white,
  // //     textTheme: TextTheme(
  // //         bodyText1: TextStyle(
  // //             fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black)),
  // //     primarySwatch: Colors.grey,
  // //     appBarTheme: AppBarTheme(
  // //         titleTextStyle: TextStyle(
  // //             color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold),
  // //         backwardsCompatibility: false,
  // //         systemOverlayStyle: SystemUiOverlayStyle(
  // //             statusBarColor: Color(0xFFE0E0E0),
  // //             statusBarIconBrightness: Brightness.dark),
  // //         backgroundColor: Color(0xffE8E8E8),
  // //         elevation: 1,
  // //         iconTheme: IconThemeData(color: Colors.black)),
  // //     scaffoldBackgroundColor: Color(0xFFE0E0E0),
  // //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
  // //       elevation: 1,
  // //       type: BottomNavigationBarType.fixed,
  // //       backgroundColor: Color(0xffE8E8E8),
  // //       selectedItemColor: Colors.black,
  // //     ));
  // //
  // // late ThemeMode currentTheme = (isDark ? lightData : darkData) as ThemeMode;
  // //
  // // late   TextStyle style =isDark? TextStyle(
  // //     fontWeight: FontWeight.w600, fontSize: 18, color: Colors.white): TextStyle(
  // //     fontWeight: FontWeight.w600, fontSize: 18, color: Colors.black) ;

  bool isDark = true;
  ThemeMode tm = ThemeMode.light;

  final String key = "theme";




  void changeMode() async{

    isDark = !isDark;
    if (isDark == false) {
      tm = ThemeMode.dark;
    } else {
      tm = ThemeMode.light;
    }

    notifyListeners();
  }

}
