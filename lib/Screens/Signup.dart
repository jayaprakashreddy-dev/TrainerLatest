
import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Info/variables.dart'as global;
import 'package:trainer/Arrangements/SizeModification.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget{
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: new IconButton(
          
          icon: new Icon(Icons.arrow_back,
          color:Colors.red),
          
          onPressed: (){
            Navigator.pushNamed(context,"LogoScreen");
          },
        ),
        
      ),
      body:ListView(
        children: <Widget>[
      Container(
        child: Column(
      children: <Widget>[
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.1,
          width: MediaQuery.of(context).size.width *0.95,
          child: Padding(
            padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Let us know you better!',
                  textAlign: TextAlign.left,
                  style: TextStyle(
                      fontSize: 20.0,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ),
        SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onChanged: (Str){
                  global.emailId=Str;
                },
                validator: (str){
                  !str.contains('@')? "Not a valid email id":null;
                },
                controller: global.userNameController,
                decoration:new InputDecoration(
                  hintText: "Enter Your Name",
                  labelText: "Name",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,
                

              ),
            )),

             SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                controller: global.emailIdController,
                onChanged: (Str){
                  global.emailId=Str;
                },
                validator: (str){
                  !str.contains('a')? "Not a valid Name":null;
                },
                decoration:new InputDecoration(
                  hintText: "Enter Your Email id",
                  labelText: "Email id",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,

              ),
            )),

            SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onSaved: (Str){
                  global.referralCode=Str;
                },
                // validator: (str){
                //   !str.contains('@')? "Not a valid email id":null;
                // },
                controller: global.referralCodeController,
                decoration:new InputDecoration(
                  hintText: "Enter Center Code",
                  labelText: "Center Code",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,

              ),
            )),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onChanged: (Str){
                  global.oname=Str;
                },
                validator: (str){
                  !str.contains('@')? "Not a valid email id":null;
                },
                controller: global.ownerNAmeController,
                decoration:new InputDecoration(
                  hintText: "Enter Owner Name",
                  labelText: "Owner Name",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,
                

              ),
            )),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onChanged: (Str){
                  global.cityname=Str;
                },
                validator: (str){
                  !str.contains('@')? "Not a valid email id":null;
                },
                controller: global.cityNameController,
                decoration:new InputDecoration(
                  hintText: "Enter City",
                  labelText: "City",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,
                

              ),
            )),
            SizedBox(
            height: MediaQuery.of(context).size.height * 0.15,
            width:MediaQuery.of(context).size.width* 0.98 ,
            child: Padding(
              padding: EdgeInsets.only(left: 35.0, right: 35.0),
              child: TextFormField(
                onChanged: (Str){
                  global.gymAddress=Str;
                },
                validator: (str){
                  !str.contains('@')? "Not a valid email id":null;
                },
                controller: global.gymAddressController,
                decoration:new InputDecoration(
                  hintText: "Enter Address",
                  labelText: "Address",
                  labelStyle: TextStyle(fontSize: 20.0,
                      fontFamily: 'Regular',
                      fontWeight: FontWeight.w500),
                ) ,
                

              ),
            )),

        
        ],
      )
      ),
      ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.arrow_forward,
          color:Colors.white
        ),
        backgroundColor: Colors.red,
        onPressed: ()async{
          global.userName=global.userNameController.text;
          global.emailId=global.emailIdController.text;
          global.referralCode=global.referralCodeController.text;
          global.oname=global.ownerNAmeController;
          global.cityname=global.cityNameController;
          global.gymAddress=global.addressController;

          
          Map data={
            "name":global.userName,
            "email":global.emailId,
            "referalid":global.referralCode,
            "oname":global.oname,
            "city":global.cityname,
            "address":global.gymAddress,
              
            };
            var jsonResponse;
            var response =await http.post("http://34.93.104.9:3000/api/workplace/firstlogin",body: data,headers:{"Content-type": "application/x-www-form-urlencoded","token":global.token} );
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
                print(global.userName);
                print(global.emailId);
                print(global.emailIdController.text);

                
                // Navigator.pushNamed(context, "CitiesPage");
               
              }
              else{
                // OtpError();
                // callSnackBar("Please Enter correct OTP");
              }
            }
          

        },
      ),


          );
  }
}