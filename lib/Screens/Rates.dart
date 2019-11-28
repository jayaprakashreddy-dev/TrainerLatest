// import 'package:dooit/Arrangements/SizeModification.dart';
import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:trainer/Arrangements/SizeModification.dart';
import '../Info/variables.dart' as global;
import 'package:http/http.dart' as http;

class SankethHome extends StatefulWidget {
  @override
  _SankethHomeState createState() => _SankethHomeState();
}

class _SankethHomeState extends State<SankethHome> {
  final gtext1 = TextEditingController();
  final gtext5 = TextEditingController();
  final gtext10 = TextEditingController();
  final stext1 = TextEditingController();
  final stext5 = TextEditingController();
  final stext10 = TextEditingController();

  final grtext1 = TextEditingController();
  final grtext5 = TextEditingController();
  final grtext10 = TextEditingController();
  



  

  void initState() {
    super.initState();
    global.s1=global.spackages[0]['total_cost']==null?global.s1:global.spackages[0]['total_cost'];
    global.s1id=global.spackages[0]['_id']==null?global.s1id:global.spackages[0]['_id'];

    global.s5=global.spackages[1]['total_cost']==null?global.s5:global.spackages[1]['total_cost'];
    global.s5id=global.spackages[1]['_id']==null?global.s5id:global.spackages[1]['_id'];

    global.s10=global.spackages[2]['total_cost']==null?global.s5:global.spackages[2]['total_cost'];
    global.s10id=global.spackages[2]['_id']==null?global.s10id:global.spackages[2]['_id'];



    global.g1=global.gpackages[0]['total_cost']==null?global.g1:global.gpackages[0]['total_cost'];
    global.g1id=global.gpackages[0]['_id']==null?global.g1id:global.gpackages[0]['_id'];
    
    global.g5=global.gpackages[1]['total_cost']==null?global.g5:global.gpackages[1]['total_cost'];
    global.g5id=global.gpackages[1]['_id']==null?global.g5id:global.gpackages[1]['_id'];

    global.g10=global.gpackages[2]['total_cost']==null?global.g5:global.gpackages[2]['total_cost'];
    global.g10id=global.gpackages[2]['_id']==null?global.g10id:global.gpackages[2]['_id'];


    
    global.gr1=global.gpackages[0]['total_cost']==null?global.g1:global.spackages[0]['total_cost'];
    global.gr1id=global.spackages[0]['_id']==null?global.g1id:global.spackages[0]['_id'];
    
    global.gr5=global.spackages[1]['total_cost']==null?global.g5:global.spackages[1]['total_cost'];
    global.gr5id=global.spackages[1]['_id']==null?global.g5id:global.spackages[1]['_id'];

    global.gr10=global.spackages[2]['total_cost']==null?global.g5:global.spackages[2]['total_cost'];
    global.gr10id=global.spackages[2]['_id']==null?global.g10id:global.spackages[2]['_id'];

    // myController.addListener();
  }

  @override
  void dispose() {
    gtext1.dispose();
    gtext5.dispose();
    gtext10.dispose();
    stext1.dispose();
    stext5.dispose();
    stext10.dispose();
      grtext1.dispose();
    grtext5.dispose();
    grtext10.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: fal
      resizeToAvoidBottomInset: false    ,
      // appBar: AppBar(
      //     //title: Text("Data Table"),
      //     ),
      body: ListView(
        children: <Widget>[
       SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.89,
            child:  global.selectedGold!=true?SizedBox(height: 5.0,
         child:Center(child:Text("selected only silver"))):  Column(
              children: <Widget>[
                Center(
                    child: Padding(
                  padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.04,
                    top: MediaQuery.of(context).size.height * 0.04,
                  ),
                  child: Text(
                    "Gold Trainer Sessions",
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.height * 0.029,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
                SizedBox(
                    child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      "Sessions",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Current Rates",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "New Rates",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                )),
                Container(
                  padding: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.08),
                  width: MediaQuery.of(context).size.width * 0.94,
                  height: MediaQuery.of(context).size.height * 0.21,
                  child: DataTable(
                    headingRowHeight:
                        MediaQuery.of(context).size.height * 0.012,
                    horizontalMargin: MediaQuery.of(context).size.width * 0.03,
                    columnSpacing: MediaQuery.of(context).size.width * 0.04,
                    sortAscending: true,
                    columns: <DataColumn>[
                      DataColumn(
                        // label: Text("First Name"),
                        numeric: false,

                        tooltip: "To display first name of the Name",
                        label: Text(""),
                      ),
                      DataColumn(
                        label: Text(""),
                        numeric: false,
                        tooltip: "To display last name of the Name",
                      ),
                      DataColumn(
                        label: Text(""),
                        numeric: false,
                        tooltip: "To display last name of the Name",
                      ),
                    ],
                    rows: [
                      DataRow(
                        //for the data of session 1 in Group
                        cells: [
                          DataCell(
                            Text("1",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            Text("₹"+global.g1.toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            TextField(
                              decoration: new InputDecoration(
                                suffixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                prefixText: "₹",
                                prefixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                hintText: "₹"+ global.g1.toString(),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                              ),
                              onSubmitted: (text) {
                                print(text);

                              },
                              onTap: (){
                                
                                showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context){
                                              return new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                            
                            title: Text("Gold 1 Session New Rate"),
                            titlePadding: EdgeInsets.all(20.0),
                            content:TextFormField(
                              // maxLength: 6,
                              decoration: InputDecoration(
                                              //  labelStyle:textStyle,
                                              labelText: "Current Rate: ₹"+global.g1.toString(),
                                              hintText: "Enter New Rate in ₹",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                                              )
                                            ),
                              onChanged: (value){
                              // this.smsCode=value;  
                              global.g1=int.parse(value);
                              // value;
                              
                            },
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            actions: <Widget>[
                              new FlatButton(
                                child: Text("Done"),
                                onPressed: ()async{
                                // Null;
                                var jsonResponse;
                              Map data=
                                 {
                                "_id":global.g1id.toString(),
                                 "total_cost":global.g1.toString(),
                                 "total_sessions": "1"

                                };
                                var response = await http
                                    .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
                                  "Content-type": "application/x-www-form-urlencoded",
                                  "token":global.token,
                                      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                                });
                                print("after hit");
                                if (response.statusCode == 200) {
                                  print("hitted");
                                  jsonResponse = json.decode(response.body);
                                  if (jsonResponse['success'] == true) {
                                      print("Success");
                                  }
                                } 
                                else {
                                  print('error');
                                }
                                Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                      );
                              },
                              controller: gtext1,
                              // keyboardType: TextInputType.number,
                            ),
                            showEditIcon: false,
                            placeholder: true,
                            onTap: () {
                              

                            },
                          ),
                        ],
                      ),
                      DataRow(
                        //for the data of session 5 in Group
                        cells: [
                          DataCell(
                            Text("5",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            Text("₹"+global.g5.toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            TextField(
                              decoration: new InputDecoration(
                                suffixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                prefixText: "₹",
                                prefixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                hintText: "₹"+global.g5.toString() ,
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                              ),
                              onSubmitted: (text) {
                                print(text);
                              },
                              onTap: (){

                                
                                showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context){
                                              return new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                            
                            title: Text("Gold 5 Session New Rate"),
                            titlePadding: EdgeInsets.all(20.0),
                            content:TextFormField(
                              // maxLength: 6,
                              decoration: InputDecoration(
                                              //  labelStyle:textStyle,
                                              labelText: "Current Rate: ₹"+global.g5.toString(),
                                              hintText: "Enter New Rate in ₹",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                                              )
                                            ),
                              onChanged: (value){
                              // this.smsCode=value;
                              global.g5=int.parse(value);
                              // value;
                              
                            },
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            actions: <Widget>[
                              new FlatButton(
                                child: Text("Done"),
                                onPressed: ()async{
                                // Null;
                                var jsonResponse;
                              Map data=
                                 {
                                "_id":global.g5id.toString(),
                                 "total_cost":global.g5.toString(),
                                 "total_sessions": "5"

                                };
                                var response = await http
                                    .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
                                  "Content-type": "application/x-www-form-urlencoded",
                                  "token":global.token,
                                      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                                });
                                print("after hit");
                                if (response.statusCode == 200) {
                                  print("hitted");
                                  jsonResponse = json.decode(response.body);
                                  if (jsonResponse['success'] == true) {
                                      print("Success");
                                  }
                                } 
                                else {
                                  print('error');
                                }
                                Navigator.of(context).pop();
                                
                                },
                              )
                            ],
                          );
                        }
                      );
                              },
                              controller: gtext5,
                              keyboardType: TextInputType.number,
                            ),
                            showEditIcon: false,
                            placeholder: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                      DataRow(
                        //for the data of session 10 in Group
                        cells: [
                          DataCell(
                            Text("10",
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            Text("₹"+global.g10.toString(),
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            TextField(
                              decoration: new InputDecoration(
                                suffixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                prefixText: "₹",
                                prefixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                hintText: "₹"+global.g10.toString(),
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                              ),
                              onSubmitted: (text) {
                                print(text);
                              },
                              onTap: (){
                                
                                
                                showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context){
                                              return new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                            
                            title: Text("Gold 10 Session New Rate"),
                            titlePadding: EdgeInsets.all(20.0),
                            content:TextFormField(
                              // maxLength: 6,
                              decoration: InputDecoration(
                                              //  labelStyle:textStyle,
                                              labelText: "Current Rate: ₹"+global.g10.toString(),
                                              hintText: "Enter New Rate in ₹",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                                              )
                                            ),
                              onChanged: (value){
                              // this.smsCode=value;
                              global.g10=int.parse(value);
                              // value;
                              
                            },
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            actions: <Widget>[
                              new FlatButton(
                                child: Text("Done"),
                                onPressed: ()async{
                                // Null;
                                var jsonResponse;
                              Map data=
                                 {
                                "_id":global.g10id.toString(),
                                 "total_cost":global.g10.toString(),
                                 "total_sessions": "10"

                                };
                                var response = await http
                                    .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
                                  "Content-type": "application/x-www-form-urlencoded",
                                  "token":global.token,
                                      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                                });
                                print("after hit");
                                if (response.statusCode == 200) {
                                  print("hitted");
                                  jsonResponse = json.decode(response.body);
                                  if (jsonResponse['success'] == true) {
                                      print("Success");
                                  }
                                } 
                                else {
                                  print('error');
                                }
                                Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                      );
                              },
                              controller: gtext10,
                              keyboardType: TextInputType.number,
                            ),
                            showEditIcon: false,
                            placeholder: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                // Padding(
                //   padding: EdgeInsets.only(top: 15.0),
                //   child: RaisedButton(
                //     color: Colors.white,
                //     child: Text(
                //       "Confirm New Rates",
                //       style: TextStyle(
                //           color: Colors.red,
                //           fontSize: MediaQuery.of(context).size.height * 0.025),
                //     ),
                //     onPressed: () => confirmG(context),
                //   ),
                // ),




               SizedBox(
                  child:!global.selectedSilver?SizedBox(child: Text("aaaa"),
               height: 5.0,):  Column(
                    children: <Widget>[
                      Center(
                          child: Padding(
                        padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).size.height * 0.04,
                          top: MediaQuery.of(context).size.height * 0.02,
                        ),
                        child: Text(
                          "Silver Trainer Sessions",
                          style: TextStyle(
                            fontSize:
                                MediaQuery.of(context).size.height * 0.029,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      )),
                      SizedBox(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            "Sessions",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Current Rates",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "New Rates",
                            style: TextStyle(
                              fontSize:
                                  MediaQuery.of(context).size.height * 0.025,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      )),
                      Container(
                        padding: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.08),
                        width: MediaQuery.of(context).size.width * 0.94,
                        height: MediaQuery.of(context).size.height * 0.21,
                        child: DataTable(
                          headingRowHeight:
                              MediaQuery.of(context).size.height * 0.012,
                          horizontalMargin:
                              MediaQuery.of(context).size.width * 0.03,
                          columnSpacing:
                              MediaQuery.of(context).size.width * 0.04,
                          sortAscending: true,
                          columns: <DataColumn>[
                            DataColumn(
                              // label: Text("First Name"),
                              numeric: false,

                              tooltip: "To display first name of the Name",
                              label: Text(""),
                            ),
                            DataColumn(
                              label: Text(""),
                              numeric: false,
                              tooltip: "To display last name of the Name",
                            ),
                            DataColumn(
                              label: Text(""),
                              numeric: false,
                              tooltip: "To display last name of the Name",
                            ),
                          ],
                          rows: [
                            DataRow(
                              //for the data of session 1 in silver
                              cells: [
                                DataCell(
                                  Text("1",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text("₹"+global.s1.toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  TextField(
                                    decoration: new InputDecoration(
                                      suffixStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                      prefixText: "₹",
                                      prefixStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                      hintText: "₹"+global.s1.toString(),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                    ),
                                    onSubmitted: (text) {
                                      print(text);
                                    },
                                    onTap: (){
                                      
                                
                                showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context){
                                              return new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                            
                            title: Text("Silver 1 Session New Rate"),
                            titlePadding: EdgeInsets.all(20.0),
                            content:TextFormField(
                              // maxLength: 6,
                              decoration: InputDecoration(
                                              //  labelStyle:textStyle,
                                              labelText: "Current Rate: ₹"+global.s1.toString(),
                                              hintText: "Enter New Rate in ₹",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                                              )
                                            ),
                              onChanged: (value){
                              // this.smsCode=value;
                              global.s1=int.parse(value);
                              // value;
                              
                            },
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            actions: <Widget>[
                              new FlatButton(
                                child: Text("Done"),
                                onPressed: ()async{
                                // Null;
                                var jsonResponse;
                              Map data=
                                 {
                                "_id":global.s1id.toString(),
                                 "total_cost":global.s1.toString(),
                                 "total_sessions": "1"

                                };
                                var response = await http
                                    .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
                                  "Content-type": "application/x-www-form-urlencoded",
                                  "token":global.token,
                                      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                                });
                                print("after hit");
                                if (response.statusCode == 200) {
                                  print("hitted");
                                  jsonResponse = json.decode(response.body);
                                  if (jsonResponse['success'] == true) {
                                      print("Success");
                                  }
                                } 
                                else {
                                  print('error');
                                }
                                Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                      );
                                    },
                                    controller: stext1,
                                    keyboardType: TextInputType.number,
                                  ),
                                  showEditIcon: false,
                                  placeholder: true,
                                  onTap: () {},
                                ),
                              ],
                            ),
                            DataRow(
                              //for the data of session 5 in silver
                              cells: [
                                DataCell(
                                  Text("5",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text("₹"+global.s5.toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  TextField(
                                    decoration: new InputDecoration(
                                      suffixStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                      prefixText: "\$",
                                      prefixStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                      hintText: "₹"+global.s5.toString(),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                    ),
                                    onSubmitted: (text) {
                                      print(text);
                                    },
                                    onTap: (){
                                      
                                
                                showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context){
                                              return new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                            
                            title: Text("Silver 5 Session New Rate"),
                            titlePadding: EdgeInsets.all(20.0),
                            content:TextFormField(
                              // maxLength: 6,
                              decoration: InputDecoration(
                                              //  labelStyle:textStyle,
                                              labelText: "Current Rate: ₹"+global.s5.toString(),
                                              hintText: "Enter New Rate in ₹",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                                              )
                                            ),
                              onChanged: (value){
                              // this.smsCode=value;
                              global.s5=int.parse(value);
                              // value;
                              
                            },
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            actions: <Widget>[
                              new FlatButton(
                                child: Text("Done"),
                                 onPressed: ()async{
                                // Null;
                                var jsonResponse;
                              Map data=
                                 {
                                "_id":global.s5id.toString(),
                                 "total_cost":global.s5.toString(),
                                 "total_sessions": "5"

                                };
                                var response = await http
                                    .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
                                  "Content-type": "application/x-www-form-urlencoded",
                                  "token":global.token,
                                      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                                });
                                print("after hit");
                                if (response.statusCode == 200) {
                                  print("hitted");
                                  jsonResponse = json.decode(response.body);
                                  if (jsonResponse['success'] == true) {
                                      print("Success");
                                  }
                                } 
                                else {
                                  print('error');
                                }
                                Navigator.of(context).pop();
                                 }
                              )
                            ],
                          );
                        }
                      );
                                    },
                                    controller: stext5,
                                    keyboardType: TextInputType.number,
                                  ),
                                  showEditIcon: false,
                                  placeholder: true,
                                  onTap: () {

                                  },
                                ),
                              ],
                            ),
                            DataRow(
                              //for the data of session 10 in silver
                              cells: [
                                DataCell(
                                  Text("10",
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text("₹"+global.s10.toString(),
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  TextField(
                                    decoration: new InputDecoration(
                                      suffixStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                      prefixText: "₹",
                                      prefixStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                      hintText: "₹"+global.s10.toString(),
                                      hintStyle: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025,
                                          color: Colors.red),
                                    ),
                                    onSubmitted: (text) {
                                      print(text);
                                    },
                                    onTap: (){
                                         showDialog(
                                            context: context,
                                            barrierDismissible: false,
                                            builder: (BuildContext context){
                                              return new AlertDialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                                  ),
                            
                            title: Text("Silver 10 Session New Rate"),
                            titlePadding: EdgeInsets.all(20.0),
                            content:TextFormField(
                              // maxLength: 6,
                              decoration: InputDecoration(
                                              //  labelStyle:textStyle,
                                              labelText: "Current Rate: ₹"+global.s10.toString(),
                                              hintText: "Enter New Rate in ₹",
                                              border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(SizeConfig.blockSizeVertical*1.5)
                                              )
                                            ),
                              onChanged: (value){
                              // this.smsCode=value;
                              global.s10=int.parse(value);
                              // value;
                              
                            },
                            ),
                            contentPadding: EdgeInsets.all(10.0),
                            actions: <Widget>[
                              new FlatButton(
                                child: Text("Done"),
                                onPressed: ()async{
                                // Null;
                                var jsonResponse;
                              Map data=
                                 {
                                "_id":global.s10id.toString(),
                                 "total_cost":global.s10.toString(),
                                 "total_sessions": "10"

                                };
                                var response = await http
                                    .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
                                  "Content-type": "application/x-www-form-urlencoded",
                                  "token":global.token,
                                      // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                                });
                                print("after hit");
                                if (response.statusCode == 200) {
                                  print("hitted");
                                  jsonResponse = json.decode(response.body);
                                  if (jsonResponse['success'] == true) {
                                      print("Success");
                                  }
                                } 
                                else {
                                  print('error');
                                }
                                Navigator.of(context).pop();
                                },
                              )
                            ],
                          );
                        }
                      );
                                    },
                                    controller: stext10,
                                    keyboardType: TextInputType.number,
                                  ),
                                  showEditIcon: false,
                                  placeholder: true,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              //  !global.selectedSilver?SizedBox(child: Text("aaaa"),
              //  height: 5.0,):  Padding(
              //     padding: EdgeInsets.only(top: 15.0),
              //     child: RaisedButton(
              //       color: Colors.white,
              //       child: Text(
              //         "Confirm New Rates",
              //         style: TextStyle(
              //             color: Colors.red,
              //             fontSize: MediaQuery.of(context).size.height * 0.025),
              //       ),
              //       onPressed: () => confirmS(context),
              //     ),
              //   ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // confirmS(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return new Container(
  //           height: MediaQuery.of(context).size.height * 0.28,
  //           padding: EdgeInsets.only(
  //             top: MediaQuery.of(context).size.height * 0.02,
  //           ),
  //           child: Column(
  //             children: <Widget>[
  //               new Container(
  //                 height: MediaQuery.of(context).size.height * 0.25,
  //                 padding: EdgeInsets.only(
  //                   // bottom: MediaQuery.of(context).size.height * 0.0,
  //                   left: MediaQuery.of(context).size.width * 0.03,
  //                 ),
  //                 child: Column(
  //                   children: <Widget>[
  //                     Align(
  //                       alignment: Alignment.topCenter,
  //                       child: Text(
  //                         'Silver Trainer Sessions',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: MediaQuery.of(context).size.height * 0.03,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                     new Container(
  //                       padding: EdgeInsets.only(
  //                         top: MediaQuery.of(context).size.height * 0.04,
  //                         left: MediaQuery.of(context).size.width * 0.05,
  //                       ),
  //                       color: Colors.grey.withOpacity(0.2),
  //                       width: MediaQuery.of(context).size.width * 1.0,
  //                       child: RaisedButton(
  //                         color: Colors.red,
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(27.0),
  //                         ),
  //                         child: Text(
  //                           'CONFIRM NEW RATES',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                         onPressed: ()async {
  //                           print("Clicked for silver rate confi");
  //                           print(global.token);
  //                           Navigator.pop(context);
  //                           var jsonResponse;
  //                             Map data={
  //                                 "packages":[
  //                                 {
  //                                     "_id": global.s1id.toString(),
  //                                     "total_cost": global.s1,
  //                                     "total_sessions": 1
  //                                 },
  //                                 {
  //                                     "_id": global.s5id,
  //                                     "total_cost": global.s5id,
  //                                     "total_sessions": 5
  //                                 },
  //                                 {
  //                                     "_id": global.s10id,
  //                                     "total_cost": global.s10,
  //                                     "total_sessions": 1
  //                                 }
  //                                 // .toString()
  //                             ]
  //                             // .map

  //                               };
  //                               var response = await http
  //                                   .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body: data, headers: {
  //                                 // "Content-type": "application/x-www-form-urlencoded",
  //                                 "token":global.token,
  //                                     // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
  //                               });
  //                               if (response.statusCode == 200) {
  //                                 jsonResponse = json.decode(response.body);
  //                                 if (jsonResponse['success'] == true) {
  //                                   setState(() {
  //                                     // global.completedSlots = jsonResponse['completedsession'];
  //                                     // global.gpackages = jsonResponse['packages'];
  //                                     print("Success");
  //                                     // print(global.trainers);
  //                                     // print(global.trainers.length);
  //                                     // getAccountDetails();
  //                                   });
  //                                 }
  //                               } 
  //                               else {
  //                                 print('error');
  //                               }
    
  //                           Navigator.pop(context);
  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }

  // confirmG(BuildContext context) {
  //   showModalBottomSheet(
  //       context: context,
  //       builder: (context) {
  //         return new Container(
  //           height: MediaQuery.of(context).size.height * 0.28,
  //           padding: EdgeInsets.only(
  //             top: MediaQuery.of(context).size.height * 0.02,
  //           ),
  //           child: Column(
  //             children: <Widget>[
  //               new Container(
  //                 height: MediaQuery.of(context).size.height * 0.25,
  //                 padding: EdgeInsets.only(
  //                   // bottom: MediaQuery.of(context).size.height * 0.0,
  //                   left: MediaQuery.of(context).size.width * 0.03,
  //                 ),
  //                 child: Column(
  //                   children: <Widget>[
  //                     Align(
  //                       alignment: Alignment.topCenter,
  //                       child: Text(
  //                         'Group Trainer Sessions',
  //                         textAlign: TextAlign.center,
  //                         style: TextStyle(
  //                           color: Colors.black,
  //                           fontSize: MediaQuery.of(context).size.height * 0.03,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                     ),
  //                     new Container(
  //                       padding: EdgeInsets.only(
  //                         top: MediaQuery.of(context).size.height * 0.04,
  //                         left: MediaQuery.of(context).size.width * 0.05,
  //                       ),
  //                       color: Colors.grey.withOpacity(0.2),
  //                       // height: MediaQuery.of(context).size.height * 0.34,
  //                       width: MediaQuery.of(context).size.width * 1.0,
  //                       child: RaisedButton(
  //                         color: Colors.red,
  //                         padding: EdgeInsets.only(
  //                           // top:MediaQuery.of(context).size.height*0.3,
  //                           left: MediaQuery.of(context).size.width * 0.1,
  //                           right: MediaQuery.of(context).size.width * 0.1,
  //                         ),
  //                         shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(27.0),
  //                         ),
  //                         child: Text(
  //                           'CONFIRM NEW RATES',
  //                           style: TextStyle(
  //                             color: Colors.white,
  //                           ),
  //                         ),
  //                         onPressed: ()async {
  //                            print("Clicked for silver rate confi");
  //                           print(global.token);
  //                           // Navigator.pop(context);
  //                           var jsonResponse;
  //                             Map data=
  //                                {
  //                               "_id":"5dded9c75974fd0aca716a17",
  //                                "total_cost":"509",
  //                                "total_sessions": "1"
  //                                 // "packages":[
  //                                 // {
  //                                 //     "_id": global.g1id,
  //                                 //     "total_cost": global.g1.toString(),
  //                                 //     "total_sessions": "1"
  //                                 // }
  //                                 // ,
  //                                 // {
  //                                 //     "_id": global.g5id.toString(),
  //                                 //     "total_cost": global.g5id.toString(),
  //                                 //     "total_sessions": "5"
  //                                 // },
  //                                 // {
  //                                 //     "_id": global.g10id.toString(),
  //                                 //     "total_cost": global.g10.toString(),
  //                                 //     "total_sessions": "1"
  //                                 // }
  //                                 // .toString()
  //                             // ]
  //                             // .map

  //                               };
  //                               var response = await http
  //                                   .post("http://test.letsdooit.in:3000/api/workplace/updaterates",body:data, headers: {
  //                                 // "Content-type": "application/x-www-form-urlencoded",
  //                                 "token":global.token,
  //                                     // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
  //                               });
  //                               print("after hit");
  //                               if (response.statusCode == 200) {
  //                                 print("hitted");
  //                                 jsonResponse = json.decode(response.body);
  //                                 if (jsonResponse['success'] == true) {
  //                                   setState(() {
  //                                     // global.completedSlots = jsonResponse['completedsession'];
  //                                     // global.gpackages = jsonResponse['packages'];
  //                                     print("Success");
  //                                     // print(global.trainers);
  //                                     // print(global.trainers.length);
  //                                     // getAccountDetails();
  //                                   });
  //                                 }
  //                               } 
  //                               else {
  //                                 print('error');
  //                               }
 
  //                           Navigator.pop(context);

  //                         },
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         );
  //       });
  // }
}
