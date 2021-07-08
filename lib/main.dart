import 'package:flutter/material.dart';
import 'package:lookgood_application/views/loginPage.dart';
import './utils/globals.dart' as globals;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return MainApp();
  }

  // // This widget is the root of your application.
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //     debugShowCheckedModeBanner: false,
  //     title: 'Look Good App',
  //     theme: ThemeData(
  //       // This is the theme of your application.
  //       //
  //       // Try running your application with "flutter run". You'll see the
  //       // application has a blue toolbar. Then, without quitting the app, try
  //       // changing the primarySwatch below to Colors.green and then invoke
  //       // "hot reload" (press "r" in the console where you ran "flutter run",
  //       // or simply save your changes to "hot reload" in a Flutter IDE).
  //       // Notice that the counter didn't reset back to zero; the application
  //       // is not restarted.
  //       primarySwatch: Colors.pink
  //     ),
  //     // home: MyHomePage(title: 'Flutter Demo Home Page'),
  //   );
  // }
}

class MainApp extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'LookGood',
      theme: ThemeData(
        primarySwatch: (globals.darkTheme) ? Colors.grey : Colors.pink,
      ),
      home: loginPage()
    );
  }
}
