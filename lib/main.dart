import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food/provider/userProvider.dart';
import 'package:food/screens/Splash.dart';
import 'package:food/screens/login.dart';
import 'package:provider/provider.dart';
import 'provider/userProvider.dart';
import 'package:food/screens/signup.dart';
import './screens/home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        primaryColor: Colors.deepOrange,
      ),
      home: Sign(),
    );
  }
}
 /*runApp(ChangeNotifierProvider(create: (_) => UserProvider.initialize(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme:ThemeData(
          primaryColor: Colors.deepOrange,
        ),
        home: ScreensController(),
      )));
}


class ScreensController extends StatelessWidget{
  @override
  Widget build (BuildContext context){
    final user = Provider.of<UserProvider>(context);
    switch (user.status){
      case Status.Uninitialized:
        return Splash();
      case Status.Unauthenticated:
      case Status.Authenticating:
        return Login();
      case Status.Authenticated:
        return MyHomePage();
      default:
        return Login();
    }
  }
}*/


