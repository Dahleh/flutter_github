import 'package:flutter/material.dart';
import 'package:github/Screens/AddIssue.dart';
import 'package:github/Screens/DetailPage.dart';
import 'package:github/Screens/MainPage.dart';
import 'package:provider/provider.dart';

import 'Screens/login.dart';
import 'dataProviders/appData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppData(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: LoginPage.id,
        routes: {
          LoginPage.id: (context) => LoginPage(),
          MainPage.id: (context) => MainPage(),
          DetailPage.id: (context) => DetailPage(),
          AddIssue.id: (context) => AddIssue(),
        },
      ),
    );
  }
}
