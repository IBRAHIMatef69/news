import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news/services/changeNotifier.dart';
import 'package:news/services/fun.dart';
import 'package:provider/provider.dart';

class SizeConfig {
  static double? width;
  static double? highest;
  static double? defaultSize;
  static Orientation? orientation;

  void init(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    highest = MediaQuery.of(context).size.height;
    orientation = MediaQuery.of(context).orientation;
    defaultSize =
        orientation == Orientation.landscape ? highest! * .024 : width! * .024;
    print("this is the default size $defaultSize");
  }
}

const kMainColor = Color(0xffbc4e3d);

const double small = 12;
const double medium = 15;
const double AMedium = 18;

const double large = 22;

Widget buildArticleItem(context, imageUrl, title, String url, publishedAt) =>
    Padding(
      padding: EdgeInsets.all(15),
      child: Row(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * .4,
            height: MediaQuery.of(context).size.height * .17,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Provider.of<Changer>(context).isDark
                        ? Color(0xff8E806A).withOpacity(.8)
                        : Colors.black.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3.5), // changes position of shadow
                  ),
                ],
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                    image: NetworkImage(imageUrl), fit: BoxFit.cover)),
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Container(
              height: MediaQuery.of(context).size.height * .17,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 5,
                    child: Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(
                          title,
                          textAlign: TextAlign.right,
                          style: Provider.of<Changer>(context).isDark
                              ? TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.grey[800])
                              : TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white70),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        )),
                  ),
                  Expanded(
                    flex: 1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          flex: 4,
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2),
                            child: Text(
                              publishedAt,
                              style: TextStyle(
                                  color: Provider.of<Changer>(context).isDark
                                      ? Colors.black45
                                      : Colors.white70,
                                  fontSize: 10),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: IconButton(
                            padding: EdgeInsets.zero,
                            onPressed: () {
                              Fun.shareLink(url);
                            },
                            icon: Icon(
                              Icons.share,
                              size: 18,
                              color: Provider.of<Changer>(context).isDark
                                  ? Color(0xff333739)
                                  : Colors.white70,
                            ),
                          ),
                        ),
                        // Expanded(flex: 1,
                        //   child: IconButton(
                        //     onPressed: () {},
                        //     icon: Icon(
                        //       Icons.copy,
                        //       size: 16,
                        //       color: Provider.of<Changer>(context).isDark
                        //           ? Color(0xff333739)
                        //           : Colors.white70,
                        //     ),
                        //   ),
                        // ),
                        // InkWell(
                        //     onTap: () {},
                        //     child: Padding(
                        //       padding: const EdgeInsets.all(5.0),
                        //       child: Icon(
                        //         Icons.copy,
                        //         color: Provider.of<Changer>(context).isDark
                        //             ? Color(0xff333739)
                        //             : Colors.white70,
                        //       size: 20,),
                        //     ))
                      ],
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );

Widget myDivider() => Divider(
      color: Colors.black26,
      thickness: 1,
      height: 0,
      indent: 15,
      endIndent: 15,
    );
