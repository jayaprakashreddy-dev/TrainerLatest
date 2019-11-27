import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Info/variables.dart' as global;
import 'package:http/http.dart' as http;

class ProfileEdit extends StatefulWidget {
  @override
  _ProfileEditState createState() => _ProfileEditState();
}

class _ProfileEditState extends State<ProfileEdit> {

  @override
  void initState() {
    global.userNameController.text = global.userName;
    global.emailIdController.text = global.emailId;
    super.initState();
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
            Navigator.pushNamed(context,"AccountPage");
          },
        ),

      ),
      body:ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height *1.0,
            width: MediaQuery.of(context).size.width * 1.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.20,
                  width: MediaQuery.of(context).size.width * 0.28,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(110.0),
                      child:  Image.asset("images/userimg.png"),
                      // Image(

                      //   image: NetworkImage(
                      //       'https://pixel.nymag.com/imgs/daily/vulture/2017/06/14/14-tom-cruise.w700.h700.jpg'),
                      // ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: <Widget>[
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.92,
                          child: TextFormField(
                            controller: global.userNameController,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w400),
                            decoration: InputDecoration(
                              labelText: 'Name',
                            ),
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/30 ,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.92,
                          child: TextFormField(
                            // keyboardType: TextInputType.number,
                            controller: global.addressController,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                              labelText: 'Address',
                              hintText: global.address,
                            ),
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/30 ,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.09,
                          width: MediaQuery.of(context).size.width * 0.92,
                          child: TextFormField(
                            controller: global.emailIdController,
                            style: TextStyle(
                                fontSize: 18.0,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                labelText: 'Primary Email',
                                hintText: global.emailId
                            ),
                          ),
                        ),
                        SizedBox(
                          height:MediaQuery.of(context).size.height/ 10,
                        ),
                        Center(
                          child: SizedBox(
                              height: MediaQuery.of(context).size.height * 0.08,
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: RaisedButton(
                                color: Colors.red,
                                child: Text(
                                  'Update',
                                  style: TextStyle(
                                    color: Colors.white,
                                      fontSize: 20.0,
                                      fontFamily: 'Mantserrat',
                                      fontWeight: FontWeight.w500
                                  ),
                                ),
                                shape: RoundedRectangleBorder(
                                    borderRadius: new BorderRadius.circular(18.0),
                                    side: BorderSide(color: Colors.red)
                                ),
                                elevation: 2.0,
                                onPressed: ()async{
                                  print("jp");
                                  global.userName=global.userNameController.text;
                                  // global.UserName=global.MobileNumber.text;
                                  global.emailId=global.emailIdController.text;
                                  global.referralCode=global.referralCodeController.text;
                                  global.address=global.addressController.text;



                                  Map data={
                                    "name":global.userName.toString(),
                                    "email":global.emailId.toString(),
                                    "address":global.address.toString(),

                                  };
                                  var jsonResponse;
                                  var response =await http.post("http://34.93.104.9:3000/api/workplace/updateaccount",body: data,headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
                                  print("hitted");
                                  if(response.statusCode==200)
                                  {
                                    jsonResponse = json.decode(response.body);
                                    // jsonData=json
                                    print("got response");
                                    print(jsonResponse);
                                    if(jsonResponse['success']==true)
                                    {
                                      
                                        print("true");
                                        // print(jsonResponse['token']);
                                        // print("object");
                                        // global.isLogged=true;
                                        // print(global.userName);
                                        // print(global.emailId);
                                        // print(global.emailIdController.text);

                                        // Navigator.pushNamed(context, "SignUpPage");
                                        Navigator.pushNamed(context,"All");
                                     
                                    }
                                    else{
                                      // OtpError();
                                      // callSnackBar("Please Enter correct OTP");
                                      Navigator.pushNamed(context,"All");
                                    }
                                  }
                                  Navigator.pushNamed(context,"All");


                                },
                              )
                          ),
                        )
                      ]
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
