import 'package:flutter/material.dart';
import 'package:food/screens/home.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(theme: ThemeData(primarySwatch: Colors.green),
      title: 'Nalin Food',
      home: Home(),
    );
  }
}