import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/view/screens/home_screen.dart';
import 'package:news/view/screens/splach_screen.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    /// Providers are above [MyApp] instead of inside it, so that tests
    /// can use [MyApp] while mocking the providers
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Changer()),
      ],
      child:  MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      // theme: ThemeData(
      // // primaryColor:Color(0xFFE0E0E0) ,
      //   backgroundColor: Colors.white,
      //   textTheme: TextTheme(
      //       bodyText1: TextStyle(
      //           color: Colors.black,
      //           fontSize: 20,
      //           fontWeight: FontWeight.bold),
      //       headline6: TextStyle(
      //           fontWeight: FontWeight.w700,
      //           fontSize: 20,
      //           color: Colors.grey)),
      //   primarySwatch: Colors.grey,
      //   appBarTheme: AppBarTheme(
      //       titleTextStyle: TextStyle(
      //           color: Colors.black,
      //           fontSize: 25,
      //           fontWeight: FontWeight.bold),
      //       backwardsCompatibility: false,
      //       systemOverlayStyle: SystemUiOverlayStyle(
      //           statusBarColor: Color(0xFFE0E0E0),
      //           statusBarIconBrightness: Brightness.dark),
      //       backgroundColor: Color(0xffE8E8E8),
      //       elevation: 1,
      //       iconTheme: IconThemeData(color: Colors.black)),
      //   scaffoldBackgroundColor: Color(0xFFE0E0E0),
      //   bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //     elevation: 1,
      //     type: BottomNavigationBarType.fixed,
      //     backgroundColor: Color(0xffE8E8E8),
      //     selectedItemColor: Colors.black,
      //   )),
      // darkTheme: ThemeData(
      //   // primaryColor:Colors.white70 ,
      //     backgroundColor: Color(0xff333739),
      //     primarySwatch: Colors.grey,
      //     appBarTheme: AppBarTheme(
      //         titleTextStyle: TextStyle(
      //             color: Colors.white70,
      //             fontSize: 25,
      //             fontWeight: FontWeight.bold),
      //         backwardsCompatibility: false,
      //         systemOverlayStyle: SystemUiOverlayStyle(
      //             statusBarColor: Color(0xff333739),
      //             statusBarIconBrightness: Brightness.light),
      //         backgroundColor: Color(0xff333739),
      //         elevation: 0,
      //         iconTheme: IconThemeData(color: Colors.white70)),
      //     textTheme: TextTheme(
      //       bodyText1: TextStyle(
      //           color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
      //     ),
      //     scaffoldBackgroundColor: Color(0xff333739),
      //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //       type: BottomNavigationBarType.fixed,
      //       backgroundColor: Colors.black87,
      //       selectedItemColor: Colors.white38,
      //     )),
      // themeMode: Provider.of<Changer>(context).tm,
      debugShowCheckedModeBanner: false,

      title: 'My News',
      home: ChangeNotifierProvider<Changer>(
        create: (_) => Changer(),
        child: SplachScreen(),
      ),
    );
  }
}
