import 'package:flutter/material.dart';
import 'package:food/screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
        fontFamily: 'Sarabun',
      ),
      title: 'Nalin Food',
      home: Home(),
    );
  }
}
