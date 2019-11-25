import 'package:trainer/Screens/Account.dart';
import 'package:trainer/Screens/Bookings.dart';
import 'package:trainer/Screens/Clients.dart';
import 'package:trainer/Screens/ProfileEdit.dart';
import 'package:trainer/Screens/Signup.dart';
import 'package:trainer/Screens/Trainer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'Screens/Logo.dart';
import 'Screens/NumberEntry.dart';
import 'Screens/OtpEnter.dart';
import './Info/variables.dart' as global;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Index Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Logo(),
        debugShowCheckedModeBanner: false,
        theme: ThemeData(fontFamily: 'Montserrat'),
        routes: <String, WidgetBuilder>{
          'OtpPage': (BuildContext context) => new OtpEnter(),
          'NumberEntry': (BuildContext context) => new NumberEntry(),
          'LogoScreen': (BuildContext context) => new Logo(),
          'AccountPage': (BuildContext context) => new AccountDetails(),
          'SignUpPage': (BuildContext context) => new SignUp(),
          'ProfileEdit': (BuildContext context) => new ProfileEdit(),
          'All':(BuildContext context) => new All(),
          'Trainers':(BuildContext context) => new Trainer(),
          "Bookings":(BuildContext context) => new Bookings(),
          "Clients":(BuildContext context) => new Clients(),
          // 'vamshiScreen': (BuildContext context) => new MyApp(),
        });
  }
}
