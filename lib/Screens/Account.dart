import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share/share.dart';
import '../Info/variables.dart' as global;
import 'package:url_launcher/url_launcher.dart';

class AccountDetails extends StatefulWidget {
  AccountDetails({Key key}) : super(key: key);

  @override
  _AccountDetailsState createState() => _AccountDetailsState();
}

class _AccountDetailsState extends State<AccountDetails> {
  var jsonResponse;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    callForDetails();
  }
  callForDetails() async{
    var response =await http.get("http://34.93.104.9:3000/api/account/getaccountdetails",headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
    if(response.statusCode==200) {
      setState(() {
        jsonResponse = json.decode(response.body);
        global.userName=jsonResponse['account']['name'];
        global.emailId=jsonResponse['account']['email'];
        global.mobileNumber.text=jsonResponse['account']['phone'];
        // global.referralCode = jsonResponse['account']['referalcode'].toString();
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: new AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: new IconButton(
            icon: new Icon(Icons.arrow_back,
                color:Colors.red),
            onPressed: (){
              Navigator.pushNamed(context,"HomeScreen");
            },
          ),
        ),
        body:Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  width: MediaQuery.of(context).size.width * 0.95,
                  child: Padding(
                    padding: EdgeInsets.only(top: 10.0, left: 20.0, right: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Account Details',
                          textAlign: TextAlign.left,
                          style: TextStyle(
                              fontSize: 28.0,
                              fontFamily: 'Montserrat',
                              fontWeight: FontWeight.w500
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.edit,
                                size: 26.0,
                              ),
                              tooltip: 'Edit Profile',
                              onPressed: () {
                                Navigator.pushNamed(context,"ProfileEdit");
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.2,
                  width: MediaQuery.of(context).size.width * 1.0,
                  child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: MediaQuery.of(context).size.width*0.4,
                        height: MediaQuery.of(context).size.height*0.4,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(110.0),
                            child: Image.asset("images/userimg.png")
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.2,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.only(top: 5.0,right: 6),
                              child: Text(
                                global.userName,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 23.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w500),
                              ),
                            ),
                            Divider(
                              height: 6.0,
                              thickness: 2,
                              color: Colors.redAccent,
                            ),
                            Padding(
                              padding: EdgeInsets.only(right: 6),
                              child: Text(
                                global.emailId,
                                textAlign: TextAlign.end,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  height: 3.0,
                ),
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 1,
                    child: Padding(
                      padding: EdgeInsets.only(left: 25.0, right: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Mobile Number',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500),
                                ),
                                Text(
                                  'Center Code',
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w500),
                                ),
                                
                              ]),
                          Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: <Widget>[
                                Text(
                                  global.mobileNumber.text,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  global.referralCode,
                                  textDirection: TextDirection.ltr,
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontFamily: 'Montserrat',
                                      fontWeight: FontWeight.w400),
                                ),
                               
                              ])
                        ],
                      ),
                    )),
                Divider(
                  height: 3.0,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 1,
                  child: Padding(
                    padding: EdgeInsets.only(left: 25.0, right: 25.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            Text(
                              'Contact Us',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(fontSize: 20.0),
                            ),
                            Text(
                              'Sign out',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(fontSize: 20.0),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            IconButton(
                              icon: Icon(
                                Icons.phone_in_talk,
                                size: 26.0,
                              ),
                              tooltip: 'Contact us',
                              onPressed: ()async {
                                print("clicked for call");
                                if (await canLaunch("tel:919010590693")) {
                                  await launch("tel:919010590693");
                                }
                              },
                            ),
                            IconButton(
                              icon: Icon(
                                Icons.power_settings_new,
                                size: 25.0,
                              ),
                              tooltip: 'Sign Out',
                              onPressed: () async {
                                global.token=null;
                                Navigator.pushNamed(context,"LogoScreen");
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
        )
    );
  }
}
