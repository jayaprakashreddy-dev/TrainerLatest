import 'dart:convert';
import 'dart:io';
import 'package:trainer/Arrangements/ShowImage.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:shared_preferences/shared_preferences.dart';
import '../Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../Arrangements/my_flutter_app_icons.dart';
import 'package:flutter/rendering.dart';
import '../Info/variables.dart' as global;

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var jsonResponse;
  bool Loading=false;
  SharedPreferences prefs;

  final GlobalKey<ScaffoldState> _scaffoldKey=GlobalKey<ScaffoldState>();

  void callSnackBar(String msg,[int er]) {
    // msg="There is no record with this user, please register first by clicking Register or check the user mail id or Password";
    final SnackBar=new prefix0.SnackBar(
      content: new Text(msg),
      duration: new Duration(seconds: 5),
      action: new SnackBarAction(label: "Exit",
        onPressed: (){
          // Navigator.pushNamed(context, "Register");
          exit(0);
        },),
    );
    _scaffoldKey.currentState.showSnackBar(SnackBar);

  }


  @override
  void initState() {
    getData();
    super.initState();
  }

  getData() async{
    prefs = await SharedPreferences.getInstance();
    setState(() {
      global.selectedId = prefs.getString('selectedCenterId');
      global.selectedIdName = prefs.getString('selectedCenterName');
    });
    getSilverPackage();
    getDodoPackage(1);
    getDodoPackage(2);
    getGoldPackage();
    fetchInactivePackages();
  }

  getSilverPackage() async{
    Map data={
      "workplaceid":prefs.getString('selectedCenterId'),
      "category":"silver",
      "ptype":"standard"
    };
    var response =await http.post("http://34.93.104.9:3000/api/account/getpackages",body: data,headers:{
      // "Content-type": "application/x-www-form-urlencoded",
      "token":global.token});
    if(response.statusCode==200)
    {
      jsonResponse = json.decode(response.body);
      if(jsonResponse['success']==true) {
        setState(() {
          global.silverPackages=jsonResponse['packages'];
        });
      }

    }
  }
  getGoldPackage() async{
    Map data={
      "workplaceid":prefs.getString('selectedCenterId'),
      "category":"gold",
      "ptype":"standard"
    };
    var response =await http.post("http://34.93.104.9:3000/api/account/getpackages",body: data,headers:{
      // "Content-type": "application/x-www-form-urlencoded",
      "token":global.token});
    if(response.statusCode==200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == true) {
        setState(() {
          global.goldPackages = jsonResponse['packages'];
        });
      }
    }

  }
  getDodoPackage(int mode) async{
    Map data={
      "workplaceid":prefs.getString('selectedCenterId'),
      "category": mode == 1 ? "silver" : "gold",
      "ptype":"docoins"
    };
    var response =await http.post("http://34.93.104.9:3000/api/account/getpackages",body: data,headers:{
      // "Content-type": "application/x-www-form-urlencoded",
      "token":global.token});
    if(response.statusCode==200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse['success']==true) {
        setState(() {
          mode == 1 ? global.dodoSPackages = jsonResponse['packages'] : global.dodoGPackages = jsonResponse['packages'];
        });
      }
    }
  }

  fetchInactivePackages() async{
    Map data = {
      "workplaceid": global.selectedId.toString()
    };
    var response = await http.post(
        "http://34.93.104.9:3000/api/account/getinactivepackages", body: data,
        headers: {
          // "Content-type": "application/x-www-form-urlencoded",
          "token": global.token
        }
    );
    if (response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if (jsonResponse['success'] == true) {
        setState(() {
          global.inactivePackages = jsonResponse['userpacks'];
        });
      }
    }else{
      print('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    textStyle() {
      return new TextStyle(
          color: Colors.black,
          fontSize: MediaQuery.of(context).size.height / 31.0);
    }
    return WillPopScope(
        onWillPop: (){
          callSnackBar("Click Exit to leave app");
        },
        child:MaterialApp(
          theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.red),
          debugShowCheckedModeBanner: false,
          home:new DefaultTabController(
            length: 2,
            child: new Scaffold(
              backgroundColor: Colors.white,
              key: _scaffoldKey,
              appBar: AppBar(
                elevation: 0.0,
                title: SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: ShowImage("2ndscreenlogo"),
                ),
                centerTitle: false,
                actions: <Widget>[
                  Row(
                    children: <Widget>[
                      GestureDetector(
                        child:global.selectedCity==null ? Text(""):Text(""+global.selectedCity,
                            style: TextStyle(
                              fontSize: MediaQuery.of(context).size.height / 45,
                              fontWeight: FontWeight.w400,
                            )),
                        onTap: (){
                          // City();
                          Navigator.pushNamed(context, "CitiesPage");
                        },
                      ),
                      Icon(
                        MyFlutterApp.circle,
                        color: Colors.cyanAccent,
                        size: SizeConfig.blockSizeHorizontal * 2.5,
                      ),
                      SizedBox(
                        height: SizeConfig.blockSizeHorizontal * 20.5,
                        width: MediaQuery.of(context).size.width / 7.0,
                        // height:MediaQuery.of(context).size.height*20.0,
                        child: InkWell(
                          child:ShowImage("userimg"),
                          onTap: (){
                            //  Navigator.pushNamed(context,"LogoScreen");
                            Navigator.pushNamed(context,"AccountPage");
                            // Navigator.pushNamed(context,"Centers");

                          },
                        ),
                      ),
                    ],
                  ),
                ],
                backgroundColor: Colors.white,
                bottom: TabBar(
                  tabs: <Widget>[
                    // new Container(
                    //   width: SizeConfig.blockSizeHorizontal * 30.5,
                    Tab(
                      child: Text("Workout", style: textStyle()),
                    ),
                    Tab(
                      child: Text("Packages", style: textStyle()),
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: <Widget>[
                  // Workout(),
                  // Packages(),
                ],
              ),
            ),
          ),
        )
    );
  }
}