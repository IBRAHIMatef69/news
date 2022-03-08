import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/services.dart';
import 'package:news/main.dart';
import 'package:flutter/material.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

class SplachScreen extends StatefulWidget {
  const SplachScreen({Key? key}) : super(key: key);

  @override
  _SplachScreenState createState() => _SplachScreenState();
}

class _SplachScreenState extends State<SplachScreen> {
  void initState() {
    super.initState();

    Future.delayed(Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => HomeScreen()));
      print('doneeeeeeeeeeeeee');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //     // primaryColor:Color(0xFFE0E0E0) ,
      //     backgroundColor: Colors.white,
      //     textTheme: TextTheme(
      //         bodyText1: TextStyle(
      //             color: Colors.black,
      //             fontSize: 20,
      //             fontWeight: FontWeight.bold),
      //         headline6: TextStyle(
      //             fontWeight: FontWeight.w700,
      //             fontSize: 20,
      //             color: Colors.grey)),
      //     primarySwatch: Colors.grey,
      //     appBarTheme: AppBarTheme(
      //         titleTextStyle: TextStyle(
      //             color: Colors.black,
      //             fontSize: 25,
      //             fontWeight: FontWeight.bold),
      //         backwardsCompatibility: false,
      //         systemOverlayStyle: SystemUiOverlayStyle(
      //             statusBarColor: Color(0xFFE0E0E0),
      //             statusBarIconBrightness: Brightness.dark),
      //         backgroundColor: Color(0xffE8E8E8),
      //         elevation: 1,
      //         iconTheme: IconThemeData(color: Colors.black)),
      //     scaffoldBackgroundColor: Color(0xFFE0E0E0),
      //     bottomNavigationBarTheme: BottomNavigationBarThemeData(
      //       elevation: 1,
      //       type: BottomNavigationBarType.fixed,
      //       backgroundColor: Color(0xffE8E8E8),
      //       selectedItemColor: Colors.black,
      //     )),
      // darkTheme: ThemeData(
      //     // primaryColor:Colors.white70 ,
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
      home: Scaffold(
        backgroundColor: Color(0xffffffff),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * .36,
                child: DefaultTextStyle(
                  style: const TextStyle(
                      fontSize: 30.0,
                      fontFamily: 'Bobbers',
                      fontWeight: FontWeight.bold,
                      color: Colors.black45),
                  child: AnimatedTextKit(
                    animatedTexts: [
                      TyperAnimatedText('Your News',
                          speed: Duration(milliseconds: 195)),
                    ],
                    onTap: () {
                      print("Tap Event");
                    },
                  ),
                ),
              ),
              SafeArea(
                  child: Container(
                      child: Container(
                          height: MediaQuery.of(context).size.width * .25,
                          width: MediaQuery.of(context).size.width * .14,
                          child: Image.asset("assets/images/news (1).png")))),
              SizedBox(
                height: MediaQuery.of(context).size.width * .25,
              )
            ],
          ),
        ),
      ),
    );
  }
}
