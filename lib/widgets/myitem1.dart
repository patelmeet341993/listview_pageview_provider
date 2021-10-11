
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/model/article.dart';
import 'package:flutter_app/mydata.dart';
import 'package:provider/provider.dart';

class MyItem1 extends StatelessWidget {
  final Article article;

  MyItem1({required this.article});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        print("Click title : ${article.title}");
        Provider.of<Mydata>(context,listen: false).removeArticle(article);
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: article.imageUrl!,
            ),
            SizedBox(
              height: 10,
            ),
            Text("Time : ${article.postDateStr}"),
            SizedBox(
              height: 10,
            ),
            Text("Title : ${article.title}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: Colors.blue
            ),),
            SizedBox(
              height: 10,
            ),
            Container(width: MediaQuery.of(context).size.width,
              height: 1,
              color: Colors.grey,),


          ],
        ),
      ),
    );
  }
}