import 'package:flutter/material.dart';
import 'package:skripsi_rania/logins_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Asset Management',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: PageLogin());
  }
}
