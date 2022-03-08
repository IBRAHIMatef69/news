import 'package:flutter/material.dart';
import 'package:news/services/api.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/services/fun.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class SearchCategoryScreen extends StatefulWidget {
  String value;

  SearchCategoryScreen(this.value);

  @override
  _SearchCategoryScreenState createState() => _SearchCategoryScreenState();
}

class _SearchCategoryScreenState extends State<SearchCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Provider.of<Changer>(context).isDark ? Color(0xFFE0E0E0)
            : Color(0xff333739),
        body: FutureBuilder(
          future: Apis.fetchSearchArticles("${widget.value}"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // switch(snapshot.connectionState){
            //   case  ConnectionState.waiting:
            //
            // }

            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      Fun.openURL(snapshot.data[index].url);
                    },
                    child: Column(
                      children: [
                        buildArticleItem(
                          context,
                          (snapshot.data[index].urlToImage == null)
                              ? "https://st4.depositphotos.com/14953852/24787/v/600/depositphotos_247872612-stock-illustration-no-image-available-icon-vector.jpg"
                              : "${snapshot.data[index].urlToImage}",
                          "${snapshot.data[index].title}",
                          "${snapshot.data[index].url}",
                          "${snapshot.data[index].publishedAt}",
                        ),
                        myDivider()
                      ],
                    ),
                  );
                },
              );
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Provider.of<Changer>(context).isDark
                          ? Color(0xff333739)
                          : Colors.white70,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Loading...",
                      style: TextStyle(
                        fontSize: 17,
                        color: Provider.of<Changer>(context).isDark
                            ? Color(0xff333739)
                            : Colors.white70,
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(
                      color: Provider.of<Changer>(context).isDark
                          ? Color(0xff333739)
                          : Colors.white70,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Loading...",
                      style: TextStyle(
                        fontSize: 17,
                        color: Provider.of<Changer>(context).isDark
                            ? Color(0xff333739)
                            : Colors.white70,
                      ),
                    )
                  ],
                ),
              );
            }
          },
        ));
  }
}
