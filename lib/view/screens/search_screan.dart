import 'package:flutter/material.dart';
import 'package:news/services/api.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/view/screens/catigories_screen.dart';
import 'package:news/view/screens/search_articles.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var searchController = TextEditingController();

  latest() {
    setState(() {
      vv = searchController.text;
    });
  }

  String vv = "";

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   searchController.addListener(() {latest();});
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Provider.of<Changer>(context).isDark
          ? Color(0xFFE0E0E0)
          : Color(0xff333739),
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: BoxDecoration(
            gradient: Provider.of<Changer>(context).isDark
                ? LinearGradient(colors: [
                    Color(0xff7C99AC),
                    Color(0xff92A9BD),
                    Color(0xffD3DEDC),
                    Color(0xffFFEFEF),
                  ])
                : LinearGradient(colors: [
                    Color(0xff0B0B0D),
                    Color(0xff333739),
                  ]),
          ),
        ),
        centerTitle: true,
        title: Text(
          "Search",
          style: TextStyle(
            color: Provider.of<Changer>(context).isDark
                ? Colors.black
                : Colors.white70,
          ),
        ),
        elevation: .5,
        backgroundColor: Colors.grey,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: Provider.of<Changer>(context).isDark
                  ? Colors.black
                  : Colors.white70,
            )),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * .05),
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * .06,
              decoration: BoxDecoration(
                  color: Provider.of<Changer>(context).isDark
                      ? Colors.black12
                      : Colors.white70,
                  borderRadius: BorderRadius.circular(7)),
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$vv");
                    vv = value;
                  });
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Search is Empty";
                  }
                },
                cursorColor: Color(0xFF000000),
                keyboardType: TextInputType.text,
                controller: searchController,
                decoration: InputDecoration(
                    prefixIcon: Icon(
                      Icons.search,
                      color: Color(0xFF000000).withOpacity(0.5),
                    ),
                    hintText: "Search",
                    border: InputBorder.none),
              ),
            ),
          ),
          Expanded(child: SearchCategoryScreen(vv))
        ],
      ),
    );
  }
}
