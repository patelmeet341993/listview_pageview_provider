import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/mydata.dart';
import 'package:flutter_app/pageview_page.dart';
import 'package:flutter_app/widgets/myitem.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import 'model/article.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  late Future<bool> _future;

  late Mydata data;

  Future<bool> getData() async {
    print("Api call");
    try {
      var url = Uri.parse(
          'https://www.pinkvilla.com/feed/section.php?type=content_entertainment');
      var response = await http.get(url);
      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');
      String data = response.body;

      var parseData = jsonDecode(data);

      Mydata mydata=Provider.of<Mydata>(context,listen: false);

      for (Map m in parseData) {
        mydata.addArticle(Article(m));
      }
      return true;
    } catch (e) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    _future = getData();
  }

  @override
  Widget build(BuildContext context) {
    data=Provider.of<Mydata>(context,listen: true);
    return SafeArea(
        child: Scaffold(
      body: mainBody(),
    ));
  }

  Widget mainBody() {
    return FutureBuilder(
        future: _future,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return SpinKitThreeBounce(
              color: Colors.lightBlue,
              size: 70,
            );
          } else if (snapshot.connectionState == ConnectionState.done) {
            return getListView();
          } else
            return Container(
              child: Text("error"),
            );
        });
  }

  Widget getListView() {
    return ListView.builder(
        itemCount: data.articles.length,
        itemBuilder: (context, index) {
          print("Index : $index");
          return MyItem(
            article: data.articles[index],
            onTapFun: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          PageViewPage( index: index)));
            },
          );
        });
  }
}
