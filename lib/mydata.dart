

import 'package:flutter/material.dart';

import 'model/article.dart';

class Mydata extends ChangeNotifier
{


  List<Article> _articles = [];

  List<Article> get articles => _articles;

  set articles(List<Article> value) {
    _articles = value;
    notifyListeners();
  }

  void addArticle(Article article)
  {
    _articles.add(article);
    //notifyListeners();
  }

  void removeArticle(Article article)
  {
    _articles.remove(article);
    notifyListeners();
  }

}