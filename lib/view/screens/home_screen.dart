import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/view/screens/catigories_screen.dart';
import 'package:news/view/screens/search_screan.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'General',
      style: optionStyle,
    ),
    Text(
      'Science',
      style: optionStyle,
    ),
    Text(
      'Health',
      style: optionStyle,
    ),
    Text(
      'Business',
      style: optionStyle,
    ),
    Text(
      'Technology',
      style: optionStyle,
    ),
    Text(
      'Sports',
      style: optionStyle,
    ),
    Text(
      'entertainment',
      style: optionStyle,
    ),
  ];
  static List<Widget> _screens = <Widget>[
    CategoryScreen(""),
    CategoryScreen("science"),
    CategoryScreen("health"),
    CategoryScreen("business"),
    CategoryScreen("technology"),
    CategoryScreen("sports"),
    CategoryScreen("entertainment"),
  ];
@override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var sstyle = Theme.of(context).textTheme.bodyText1;

    return MaterialApp(
      title: "News",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
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
          )),
      //hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh

      darkTheme:ThemeData(
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
          )),
      //jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
      themeMode: Provider.of<Changer>(context).tm,

      //jjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjjj
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
          title: _widgetOptions.elementAt(_selectedIndex),
          elevation: .7,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SearchScreen()));
                },
                icon: Icon(Icons.search)),
            IconButton(
                onPressed: () {
                  Provider.of<Changer>(context, listen: false).changeMode();

                  // Provider.of<Changer>(context, listen: false).setBoolean();
                  // Provider.of<Changer>(context, listen: false).getBoolean();
                },
                icon: Icon(
                  Provider.of<Changer>(context, listen: false).isDark
                      ? Icons.dark_mode
                      : Icons.light_mode,
                )),
          ],
        ),
        body: _screens.elementAt(_selectedIndex),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
            boxShadow: [
              BoxShadow(
                blurRadius: .1,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 8),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: GNav(
                  tabBackgroundGradient: LinearGradient(colors: [
                    Color(0xff7C99AC),
                    Color(0xff92A9BD),
                    Color(0xffD3DEDC),
                    Color(0xffFFEFEF),
                  ]),
                  rippleColor: Colors.grey[300]!,
                  hoverColor: Colors.grey[100]!,
                  gap: 0,
                  activeColor: Theme.of(context)
                      .bottomNavigationBarTheme
                      .selectedItemColor,
                  iconSize: 20,
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  duration: Duration(milliseconds: 250),
                  tabBackgroundColor: Colors.grey[100]!,
                  color: Provider.of<Changer>(context).isDark
                      ? Colors.black87
                      : Colors.white70,
                  // (Provider.of<Changer>(context, listen: false).isDark)
                  //     ?( Provider.of<Changer>(context).lightData.primaryColor)
                  //     :( Provider.of<Changer>(context).darkData.primaryColor),
                  tabs: [
                    GButton(
                      icon: Icons.home,
                      text: 'Home',
                    ),
                    GButton(
                      icon: Icons.science_outlined,
                      text: 'Science',
                    ),
                    GButton(
                      icon: Icons.favorite,
                      text: 'Health',
                    ),
                    GButton(
                      icon: Icons.add_business_sharp,
                      text: 'Business',
                    ),
                    GButton(
                      icon: Icons.android,
                      text: 'Tech',
                    ),
                    GButton(
                      icon: Icons.sports,
                      text: 'Sports',
                    ),
                    GButton(
                      icon: Icons.theater_comedy,
                      text: 'Entertainment',
                    ),
                  ],
                  selectedIndex: _selectedIndex,
                  onTabChange: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
