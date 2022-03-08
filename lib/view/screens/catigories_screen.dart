import 'package:flutter/material.dart';
import 'package:news/services/api.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/services/fun.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../constants.dart';

class CategoryScreen extends StatefulWidget {
  String textCategory;

  CategoryScreen(this.textCategory);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: FutureBuilder(
          future: Apis.fetchCategoryArticles("${widget.textCategory}"),
          builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
            // switch(snapshot.connectionState){
            //   case  ConnectionState.waiting:
            //
            // }
            if (snapshot.connectionState == ConnectionState.waiting) {
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
            } else if (snapshot.hasData) {
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
