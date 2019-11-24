import 'dart:convert';

import 'package:trainer/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Info/variables.dart' as global;
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;

class OtpEnter extends StatefulWidget {
  @override
  _OtpEnterState createState() => _OtpEnterState();
}

class _OtpEnterState extends State<OtpEnter> {
  var jsonResponse;

  final GlobalKey<ScaffoldState> _scaffoldkey2 = new GlobalKey<ScaffoldState>();

  void callSnackBar(String me)
  {
    print("called me for scnack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 3),
    );
    _scaffoldkey2.currentState.showSnackBar(SnackBar);
  }

  getCities() async {
    var response =await http.get("http://34.93.104.9:3000/wapi/account/getcities",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
    if(response.statusCode==200) {
      jsonResponse = json.decode(response.body);
      print(jsonResponse);
      global.City=jsonResponse;
      print(global.City);
      print(global.City['cities']);
      print(global.City['cities'].length);
    }
  }


  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return
      Scaffold(
        key: _scaffoldkey2,
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back, color: Colors.red),
            onPressed: (){
              Navigator.pushNamed(context,"NumberEntry");
            },
          ),
        ),
        body: ListView(children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Center(
                child: Container(
                  margin: EdgeInsets.all(12),
                  child: Text(
                    "Please enter 4-digit Otp sent to  your mobile number",
                    style: TextStyle(fontSize: SizeConfig.blockSizeVertical*2.6, fontWeight: FontWeight.bold),
                  )
                ),
              ),
              new Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                  child: new Column(
                    children: <Widget>[
                      new TextFormField(
                        maxLength: 4,
                        controller: global.otpEntered,
                        decoration: new InputDecoration(
                          labelText: "Enter your OTP",
                          hintStyle: null,
                        ),
                        keyboardType: TextInputType.number,
                      ),
                    ],
                  )
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(8),
                margin: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.5),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Resend Code in 00:05",
                                style: TextStyle(fontSize:SizeConfig.blockSizeVertical* 2.3, fontWeight: FontWeight.w300),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              InkWell(
                                  child: Text(
                                    "Edit my mobile number",
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: SizeConfig.blockSizeVertical* 2.5,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  onTap:(){ Navigator.pushNamed(context, "NumberEntry");
                                  }
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    FloatingActionButton(
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                      backgroundColor: Colors.red,
                      onPressed: ()async {
                        print("befoe");
                        Map data={
                          "phone":global.mobileNumber.text,
                          "otp":global.otpEntered.text
                        };
                        var jsonResponse;
                        var response =await http.post("http://34.93.104.9:3000/wapi/login",body: data);
                        if(response.statusCode==200) {
                          jsonResponse = json.decode(response.body);
                          if(jsonResponse['success']==true) {
                            print("true");
                            global.token=jsonResponse['token'];
                            print(global.token);
                            print("object");
                            SharedPreferences prefs = await SharedPreferences.getInstance();
                            prefs.setString('token',global.token);
                            // global.isLogged=true;
                            getCities();
                            if(jsonResponse['active']==true) {
                              print("active user");
                              // getCities();
                              // Navigator.pushNamed(context, "HomeScreen");
                              // Navigator.pushNamed(context,"AccountPage");
                              // Navigator.pushNamed(context,"CitiesPage");
                              
                              Navigator.pushNamed(context, "SignUpPage");
                            }
                            else if(jsonResponse['active']==false) {
                              // getCities();
                              print("new user");
                              Navigator.pushNamed(context, "SignUpPage");
                              // Navigator.pushNamed(context, );
                            }
                          }
                          else{
                            // OtpError();
                            callSnackBar("Please Enter correct OTP");
                          }
                        }
                      },
                    )
                  ],
                ),
              ),
            ],
          ),
        ],),
      );
  }
}
