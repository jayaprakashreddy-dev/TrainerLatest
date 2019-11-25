import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';
import '../Info/variables.dart' as global;

bool golVal1 = false;
bool silVal1 = false;
bool gruVal1 = false;
textStyle() {
  TextStyle(fontSize: 28.0, fontWeight: FontWeight.w700);
}

class Trainer extends StatefulWidget {
  Trainer({Key key}) : super(key: key);

  @override
  _TrainerState createState() => _TrainerState();
}

class _TrainerState extends State<Trainer> {
  var jsonResponse;

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getTrainers();
  // }

  // getTrainers() async {
  //   var response = await http
  //       .get("http://34.93.104.9:3000/api/workplace/gettrainers", headers: {
  //     // "Content-type": "application/x-www-form-urlencoded",
  //     "token":global.token,
  //         // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
  //   });
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if (jsonResponse['success'] == true) {
  //       setState(() {
  //         // global.completedSlots = jsonResponse['completedsession'];
  //         global.trainers = jsonResponse['trainers'];
  //         print(global.trainers);
  //         print(global.trainers.length);
  //         // getAccountDetails();
  //       });
  //     }
  //   } else {
  //     print('error');
  //   }
  // }


  

 


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.white, accentColor: Colors.red),
      debugShowCheckedModeBanner: false,
      home: new DefaultTabController(
        length: 1,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(MediaQuery.of(context).size.height /
                12.0), // here the desired height
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text("Trainer Access",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 35.0)),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              TrainerAccess(),
            ],
          ),
        ),
      ),
    );
  }
}

class TrainerAccess extends StatefulWidget {
  TrainerAccess({Key key}) : super(key: key);

  @override
  _TrainerAccessState createState() => _TrainerAccessState();
}

class _TrainerAccessState extends State<TrainerAccess> {
  
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(left: 1.0, right: 5.0),
            // height: MediaQuery.of(context).size.height * 0.05,
            // width: MediaQuery.of(context).size.width * 1.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text('Trainer Name', style: textStyle()),
                Text('Gold', style: textStyle()),
                Text('Silver', style: textStyle()),
                Text('Group', style: textStyle())
              ],
            ),
          ), 
          Divider(
            thickness: 1.0,
            color: Colors.black,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.5,
            width: MediaQuery.of(context).size.width * 0.9,
            child: global.trainers.length == 0
                ? Center(child: Text("no data"))
                : ListView.builder(
                    itemCount: global.trainers.length,
                    itemBuilder: (context, index) {
                      return global.trainers[index]==null?Center(child: Text("no data")):
                       Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[

                            // SizedBox(
                            //   height: MediaQuery.of(context).size.height*0.001,
                            //   child: Fetchdetails(index) ,),
                          Fetchdetails(index) ,
                          Text(global.trainers[index]['name']==null?"":global.trainers[index]['name'],
                              style: textStyle()),
                          IconButton(
                            iconSize: 15.0,
                            icon: Icon(Icons.phone_in_talk),
                            onPressed: () {
                              // if(global.trainers[index]['phone']!=null)
                              launch(
                                  "tel:+91${global.trainers[index]['phone']}");
                            },
                          ),
                          Checkbox(
                            value: golVal1,
                            onChanged: (bool value) async {
                              // setState(() async {
                              golVal1 = value;
                              // global.index=index;

                              
                            },
                          ),
                          Checkbox(
                            value: silVal1,
                            onChanged: (bool value) {
                              setState(() {
                                silVal1 = value;
                                //  global.index=index;
                              });
                            },
                          ),
                          Checkbox(
                            value: gruVal1,
                            onChanged: (bool value) {
                              setState(() {
                                gruVal1 = value;
                                //  global.index=index;
                              });
                            },
                          ),
                          InkWell(
                            
                            child: Text(
                              'Save',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.w500),
                            ),
                            onTap: () {


                            },
                          ),
                          // Fetch(),
                        ],
                      );
                    }),
          ),
          // Divider(
          //   thickness: 1.0,
          //   color: Colors.black,
          // ),
        ],
      )
    ]);
  }

  // Fetchdetails() {}

  Fetchdetails(int index) {

    golVal1=global.trainers[index]['category'].contains("gold");
    silVal1=global.trainers[index]['category'].contains("silver");
    gruVal1=global.trainers[index]['category'].contains("group");

  }
}

// Fetch() {

// }

// class Fetchdetails extends Trainer
// {
//   Fetchdetails(int index);
  
  

// }
