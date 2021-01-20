import 'package:flutter/material.dart';
import 'package:newlogin/login.dart';
import 'package:newlogin/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
        child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      initialRoute: 'login',
      routes: {
        'login': (BuildContext context) => LoginPage(),
      },
      theme: ThemeData(primaryColor: Colors.black),
    ));
  }
}
