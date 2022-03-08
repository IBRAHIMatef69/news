import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

class Fun{

 static  void openURL(url) async {
    if (!await launch(url))
      throw " Error $url";
  }
  static void shareLink(url)async{
   Share.share("$url",subject: "Look!");

  }
}