import 'package:trainer/Arrangements/ShowImage.dart';
import 'package:trainer/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:trainer/Screens/Bookings.dart';
import '../Info/variables.dart' as global;
import 'package:shared_preferences/shared_preferences.dart';
class Logo extends StatefulWidget{
  @override
  _LogoState createState() => _LogoState();
}

class _LogoState extends State<Logo> {

  SharedPreferences sharedPreferences;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkingUser();
    // print("token is"+global.token);
  }

  checkingUser()async{
    sharedPreferences=await SharedPreferences.getInstance();
    setState(() {
      global.token=sharedPreferences.getString("token");
      // global.City=sharedPreferences.getStringList("city");
      // global.Packages=sharedPreferences.getStringList('packages');
      // global.centers=sharedPreferences.getStringList('centers');

      // print(global.Packages
      // print(global.Packages);
      // print(global.Packages);
    });

    print(global.token);
    if(global.token!=null) {
      global.login=true;
    }
    // else
    // {
    //   global.token=false;
    //   print("new user");
    // }
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    SizeConfig().init(context);
    // TODO: implement build
    return 
    global.login? All():
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home:Scaffold(
          backgroundColor: Colors.white,
            body:Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: Container(
                    margin: EdgeInsets.only(top:20.0,left: 10,right: 10),
                    height: MediaQuery.of(context).size.height*0.5,
                    width: MediaQuery.of(context).size.width*1,
                    child:ShowImage("logo"),
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.height*0.4,
                  width: MediaQuery.of(context).size.height*1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                          "Start DOOing with DOO.it",
                          style: TextStyle(
                            fontSize: 28.0,
                            color: Colors.black,
                            fontWeight:FontWeight.bold,
                          )
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 15.0,bottom: 10.0),
                            child: SizedBox(
                                height: 60.0,
                                width: MediaQuery.of(context).size.width*1,
                                child :Row(
                                  children: <Widget>[
                                    Padding(
                                      padding: EdgeInsets.only(left: 25.0,right: 10),
                                      child:SizedBox(
                                        height: 30.0,
                                        width: 50.0,
                                        child: ShowImage("india"),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 8.0),
                                      child: Text("+91",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                          )),
                                    ),
                                    InkWell(
                                      child:Text("Enter your mobile number",
                                          style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.black38,)
                                      ),
                                      onTap: (){
                                        Navigator.pushNamed(context, "NumberEntry");
                                      },
                                    ),
                                  ],
                                )
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ],
            )
        )
    );
  }
}