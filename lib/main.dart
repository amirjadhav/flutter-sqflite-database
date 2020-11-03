import 'package:flutter/material.dart';
import 'package:sqflite_flutter/ui/view/homepage/homepage_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(brightness: Brightness.dark),
      title: "Flutter Database",
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
