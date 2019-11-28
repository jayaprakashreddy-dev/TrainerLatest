import 'dart:convert';
import 'package:trainer/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:http/http.dart' as http;
import '../Info/variables.dart' as global;
import '../Arrangements/ShowImage.dart';


class NumberEntry extends StatefulWidget{
  @override
  _NumberEntryState createState() => _NumberEntryState();
}

class _NumberEntryState extends State<NumberEntry> {
  final GlobalKey<ScaffoldState> _scaffoldkey = new GlobalKey<ScaffoldState>();
  void callSnackBar(String me)
  {
    print(me);
    // print("called me for snack bar");
    final SnackBar =new prefix0.SnackBar(
      content: new Text(me),
      duration: new Duration(seconds: 1),
    );
    _scaffoldkey.currentState.showSnackBar(SnackBar);
  }
  final JsonDecoder _decoder = new JsonDecoder();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      key: _scaffoldkey,
      backgroundColor: Colors.white,
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: new IconButton(
          icon: new Icon(Icons.arrow_back, color: Colors.red),
          onPressed: (){
            Navigator.pushNamed(context, "LogoScreen");
          },
        ),
      ),
      body: ListView(
        children: <Widget>[
          Container(
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20.0),
                  child:Text(
                    "Please enter your mobile number",
                    style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height*0.6,
              margin: EdgeInsets.only(left: 25,right: 10,top: 5),
              child: new Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      SizedBox(
                        height: 90.0,
                        child:Container(
                          child: Row(
                            children: <Widget>[
                              SizedBox(
                                height: 40.0,
                                width: 50.0,
                                child: ShowImage("india"),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                                child: Text("+91",
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    )
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 12),
                        width: MediaQuery.of(context).size.width*0.6,
                        child: TextFormField(
                          controller: global.mobileNumber,
                          maxLength: 10,
                          decoration: new InputDecoration(
                              hintStyle: null,
                              hintText: "Enter your number",
                              contentPadding: EdgeInsets.all(5)
                          ),
                          keyboardType: TextInputType.number,
                        ),
                      ),
                    ],
                  ),

                ],
              )
          ),
          Container(
            margin: EdgeInsets.all(10),
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.7,
                    child:Text(
                      "By continuing you may receive an SMS for verification. Message and data rates may apply.",
                      style: TextStyle(fontSize: 16.0, color: Colors.black38),
                    ),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FloatingActionButton(
                    onPressed: () async{
                      callSnackBar("OTP is sending to your Number....");
                      await http.post(
                        // "http://test.letsdooit.in:3000/api/signup",
                        "http://test.letsdooit.in:3000/wapi/signup",
                        body: json.encode({
                          "phone": global.mobileNumber.text
                        }),
                        headers: {"Accept": "application/json","Content-type": "application/json",},
                      ).then((http.Response response) {
                        // callSnackBar("after response");
                        // final String res = response.body;
                        var jsonResponse;
                        int statusCode = response.statusCode;
                        jsonResponse = json.decode(response.body);
                        if (statusCode ==200){
                          if(jsonResponse['success']==true) {
                            callSnackBar("Otp is sent to your number");
                            Navigator.pushNamed(context, "OtpPage");
                          }
                          else if(jsonResponse['success']==false){
                            callSnackBar("Failed to send Otp,Please Try again");
                          }
                        }
                      });
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                    backgroundColor: Colors.red,
                  ),
                ),
              ],
            ),
          )
        ],
      ),

    );
  }
}