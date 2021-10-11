import 'package:flutter/material.dart';
import 'package:flutter_app/mydata.dart';
import 'package:flutter_app/widgets/myitem1.dart';
import 'package:provider/provider.dart';

import 'model/article.dart';
class PageViewPage extends StatefulWidget {


  final int index;
  PageViewPage({required this.index});


  @override
  _PageViewPageState createState() => _PageViewPageState();
}

class _PageViewPageState extends State<PageViewPage> {

  late PageController controller;

  late Mydata data;

  @override
  void initState() {
    super.initState();

    controller=PageController(initialPage: widget.index);


  }

  @override
  Widget build(BuildContext context) {

    data=Provider.of<Mydata>(context,listen: true);

    return SafeArea(child: Scaffold(
      body: PageView.builder(
        controller: controller,
          itemCount: data.articles.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (ctx,index){
        return MyItem1(article: data.articles[index]);
      }),
    ));
  }
}
