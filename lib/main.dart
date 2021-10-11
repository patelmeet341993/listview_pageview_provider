import 'package:flutter/material.dart';
import 'package:flutter_app/mainpage.dart';
import 'package:flutter_app/mydata.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context)=>Mydata())
      ],
      child: MaterialApp(
        home: MainPage(),
      ),
    );
  }
}

