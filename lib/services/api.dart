import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:news/models/articles.dart';

class Apis {
  static String ApiKey = "7fec71efdd4b422191a916812481f4ea";

  static fetchArticles() async {
    List<Articles> listArticles = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&apiKey=$ApiKey");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    print(responseBody);
    for (var i in responseBody) {
      Articles x = Articles(
          description: i["description"],
          title: i["title"],
          url: i["url"],
          urlToImage: i["urlToImage"]);
      listArticles.add(x);
    }
    return listArticles;
  }

  static fetchCategoryArticles(String category) async {
    List<Articles> listArticles = [];
    var url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=eg&category=$category&apiKey=$ApiKey");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    print(responseBody);
    for (var i in responseBody) {
      Articles x = Articles(
          description: i["description"],
          title: i["title"],
          url: i["url"],
           urlToImage: i["urlToImage"],
          publishedAt:i["publishedAt"]
      );
      listArticles.add(x);
    }
    return listArticles;
  }


  static fetchSearchArticles(String value) async {
    List<Articles> listArticles = [];
    print("dddddddddddddddddddddddddddddddddddddddd$value");
    var url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$value&apiKey=$ApiKey");
    var response = await http.get(url);
    var responseBody = jsonDecode(response.body)["articles"];
    print(responseBody);
    for (var i in responseBody) {
      Articles x = Articles(
          description: i["description"],
          title: i["title"],
          url: i["url"],
           urlToImage: i["urlToImage"],
          publishedAt:i["publishedAt"]
      );
      listArticles.add(x);
    }
    return listArticles;
  }
}
