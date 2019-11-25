import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:trainer/Arrangements/ShowImage.dart';
import 'package:trainer/Screens/Trainer.dart';
import 'package:url_launcher/url_launcher.dart';
import '../Info/variables.dart' as global;
import 'package:http/http.dart' as http;
import 'package:trainer/Screens/Rates.dart';
// import 'package:app/showimg.dart';

class Clients extends StatefulWidget {
  Clients({Key key}) : super(key: key);

  @override
  _ClientsState createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  // var jsonResponse;
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   getPending();
  // }

  // getPending() async {
  //   var response = await http
  //       .get("http://34.93.104.9:3000/api/workplace/unpaidpackages", headers: {
  //     // "Content-type": "application/x-www-form-urlencoded",
  //     "token": global.token,
  //     // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
  //   });
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if (jsonResponse['success'] == true) {
  //       setState(() {
  //         // global.completedSlots = jsonResponse['completedsession'];
  //         print("unpaid");
  //         global.unpaidPackages = jsonResponse['userpacks'];
  //         print(global.unpaidPackages);
  //         print(global.unpaidPackages.length);
  //         print(global.unpaidPackages[0]['account']['name']);
  //         print(global.unpaidPackages[0]['package']['total_cost']);
  //         // getAccountDetails();
          
  //       });
  //       getConfirm();
  //     }
  //   } else {
  //     print('error');
  //   }
  // }

  // getConfirm() async {
  //   var response =
  //       await http.get("http://34.93.104.9:3000/api/workplace/", headers: {
  //     // "Content-type": "application/x-www-form-urlencoded",
  //     "token": global.token,
  //     // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
  //   });
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if (jsonResponse['success'] == true) {
  //       setState(() {
  //         print("confirm");
  //         // global.completedSlots = jsonResponse['completedsession'];
  //         global.unpaidPackages = jsonResponse['userpacks'];
  //         print(global.unpaidPackages);
  //         print(global.unpaidPackages.length);
  //         print(global.unpaidPackages[0]['account']['name']);
  //         print(global.unpaidPackages[0]['package_type']);
  //         // getAccountDetails();
  //         // getPast();
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
        length: 3,
        child: new Scaffold(
          appBar: PreferredSize(
            preferredSize:
                Size.fromHeight(MediaQuery.of(context).size.height / 12.0),
            // preferredSize:Size.fromHeight(MediaQuery.of(context).size.height /
            // 12.0),
            // here the desired height
            child: AppBar(
              elevation: 0.0,
              backgroundColor: Colors.white,
              bottom: TabBar(
                tabs: <Widget>[
                  Tab(
                    child: Text("Pending",
                        style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 40.0)),
                  ),
                  Tab(
                    child: Text(
                      "Confirmed",
                      style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 42.0),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "Rates",
                      style: TextStyle(
                          color: Colors.black,
                          backgroundColor: Colors.white,
                          fontSize: MediaQuery.of(context).size.height / 40.0),
                    ),
                  ),
                ],
              ),
            ),
          ),
          body: TabBarView(
            children: <Widget>[
              Pending(),
              Confirmed(),
              Rates(),
            ],
          ),
        ),
      ),
    );
  }
}

class Pending extends StatefulWidget {
  Pending({Key key}) : super(key: key);

  @override
  _PendingState createState() => _PendingState();
}

class _PendingState extends State<Pending> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: <Widget>[
      Column(children: <Widget>[
        SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: global.unpaidPackages.length == 0
                ? Center(child: Text("no data"))
                : ListView.builder(
                    itemCount: global.unpaidPackages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: ShowImage('gym_pic2'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        // 'Gold Trainer 5 Sessions',
                                        global.unpaidPackages[index]
                                                ['package_type'] +
                                            " Trainer " +
                                            global.unpaidPackages[index]
                                                        ['package']
                                                    ['total_sessions']
                                                .toString() +
                                            " Sessions",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                      Text(
                                        'Fusion Gym',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Client: Utkarsh',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0),
                                          ),
                                          IconButton(
                                            iconSize: 20.0,
                                            icon: Icon(Icons.phone_in_talk),
                                            onPressed: () {
                                              launch(
                                                  "tel:+91${global.trainers[index]['account']['phone']}");
                                            },
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        child: Text(
                                          'Confirm Payment  ₹' +
                                              global.unpaidPackages[index]
                                                      ['package']['total_cost']
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                              fontSize: 18.0),
                                        ),
                                        onTap: () {
                                          global.unpaidPackagesId =
                                              global.unpaidPackages[index]
                                                  ['package']['_id'];
                                          print(global.unpaidPackagesId);
                                          gym(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    }))
      ])
    ]);
  }

  gym(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.1,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: <Widget>[
                RaisedButton(
                  color: Colors.red,
                  padding: EdgeInsets.only(
                    left: MediaQuery.of(context).size.width * 0.1,
                    right: MediaQuery.of(context).size.width * 0.1,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(27.0),
                  ),
                  child: Text(
                    'PAY AT GYM',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () async {
                    print("Clciked");
                    var jsonResponse;

                    Map data = {
                      "upackid": global.unpaidPackagesId,
                    };
                    var response = await http.post(
                        "http://34.93.104.9:3000/api/workplace/paymentdone",
                        body: data,
                        headers: {
                          // "Content-type": "application/x-www-form-urlencoded",
                          "token": global.token,
                          // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
                        });
                    if (response.statusCode == 200) {
                      jsonResponse = json.decode(response.body);
                      if (jsonResponse['success'] == true) {
                        setState(() {
                          // global.completedSlots = jsonResponse['completedsession'];
                          print("confirming");
                          Navigator.pushReplacementNamed(context, "Trainers");
                          // getAccountDetails();
                          // getConfirm();
                        });
                      }
                    } else {
                      print('error');
                    }
                  },
                )
              ],
            ),
          );
        });
  }
}

class Confirmed extends StatefulWidget {
  Confirmed({Key key}) : super(key: key);

  @override
  _ConfirmedState createState() => _ConfirmedState();
}

class _ConfirmedState extends State<Confirmed> {

  // var jsonResponse;
  // @override
  // void initState() {
  //   // TODO: implement initState 
  //   super.initState();
  //   getPaid();
  // }

  // getPaid() async {
  //   var response = await http
  //       .get("http://34.93.104.9:3000/api/workplace/paidpackages", headers: {
  //     // "Content-type": "application/x-www-form-urlencoded",
  //     "token": global.token,
  //     // "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwaG9uZSI6Ijc3Mzg2OTU5MjgiLCJpYXQiOjE1NzQ2MDcwNTAsImV4cCI6MTE2NTQ2MDcwNTB9.-eHmrhKWK4dBMESMLOD79QRQGx7J75MneKnkcnmQ6bA",
  //   });
  //   if (response.statusCode == 200) {
  //     jsonResponse = json.decode(response.body);
  //     if (jsonResponse['success'] == true) {
  //       setState(() {
  //         // global.completedSlots = jsonResponse['completedsession'];
  //         print("paid");
  //         global.paidPackages = jsonResponse['userpacks'];
  //         print(global.paidPackages.length0);
         
  //       });
  //     }
  //   } else {
  //     print('error');
  //   }
  // }
  @override
  Widget build(BuildContext context) {
    return ListView(
        children: <Widget>[
          SizedBox(
            height: MediaQuery.of(context).size.height * 1,
            width: MediaQuery.of(context).size.width * 1,
            child: global.paidPackages.length == 0
                ? Center(child: Text("no data"))
                : ListView.builder(
                    itemCount: global.paidPackages.length,
                    itemBuilder: (context, index) {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.20,
                            width: MediaQuery.of(context).size.width * 1,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.35,
                                  child: ShowImage('gym_pic2'),
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.60,
                                  child: Column(
                                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      Text(
                                        // 'Gold Trainer 5 Sessions',
                                        global.paidPackages[index]
                                                ['package_type'] +
                                            " Trainer " +
                                            global.paidPackages[index]
                                                        ['package']
                                                    ['total_sessions']
                                                .toString() +
                                            " Sessions",
                                        style: TextStyle(
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18.0),
                                      ),
                                      Text(
                                        'Fusion Gym',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Text(
                                            'Client: Utkarsh',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18.0),
                                          ),
                                          IconButton(
                                            iconSize: 20.0,
                                            icon: Icon(Icons.phone_in_talk),
                                            onPressed: () {

                                               launch(
                                  "tel:+91${global.paidPackages[index]['account']['phone']}");
                                            },
                                          ),
                                        ],
                                      ),
                                      InkWell(
                                        child: Text(
                                          'Payment  ₹' +
                                              global.paidPackages[index]
                                                      ['package']['total_cost']
                                                  .toString(),
                                          style: TextStyle(
                                              fontWeight: FontWeight.w600,
                                              color: Colors.red,
                                              fontSize: 18.0),
                                        ),
                                        onTap: () {
                                          // global.unpaidPackagesId =
                                          //     global.unpaidPackages[index]
                                          //         ['package']['_id'];
                                          print(global.unpaidPackagesId);
                                          // gym(context);
                                        },
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Divider(),
                        ],
                      );
                    }
                    )
                    )


      // SizedBox(
      //     height: MediaQuery.of(context).size.height * 0.18,
      //     width: MediaQuery.of(context).size.width * 0.95,
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //       children: <Widget>[
      //         SizedBox(
      //           width: MediaQuery.of(context).size.width * 0.35,
      //           child: ShowImage('gym_pic2'),
      //         ),
      //         SizedBox(
      //           width: MediaQuery.of(context).size.width * 0.50,
      //           child: Column(
      //             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: <Widget>[
      //               Text(
      //                 'Gold Trainer 5 Sessions',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.w600, fontSize: 18.0),
      //               ),
      //               Text(
      //                 'Fusion Gym',
      //                 style: TextStyle(
      //                     fontSize: 18.0, fontWeight: FontWeight.w400),
      //               ),
      //               Row(
      //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //                 children: <Widget>[
      //                   Text(
      //                     'Client: Utkarsh',
      //                     style: TextStyle(
      //                         fontWeight: FontWeight.w600, fontSize: 18.0),
      //                   ),
      //                   IconButton(
      //                     icon: Icon(Icons.phone_in_talk),
      //                     onPressed: () {},
      //                   ),
      //                 ],
      //               ),
      //               Text(
      //                 'Payment ',
      //                 style: TextStyle(
      //                     fontWeight: FontWeight.w600,
      //                     color: Colors.red,
      //                     fontSize: 20.0),
      //               )
      //             ],
      //           ),
      //         ),
      //         // SizedBox(
              //   width: MediaQuery.of(context).size.width * 0.20,
              //   child:
              //   IconButton(
              //     icon: Icon(Icons.phone_in_talk),
              //     onPressed: () {},
              //   ),
              // )
        ]
        
    );
  }
}

class Rates extends StatefulWidget {
  Rates({Key key}) : super(key: key);

  @override
  _RatesState createState() => _RatesState();
}

class _RatesState extends State<Rates> {
  @override
  Widget build(BuildContext context) {
    return SankethHome();
    // return Scaffold(
    //   body: ListView(
    //     children: <Widget>[
    //       SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.07,
    //           child: Center(
    //             child: Text(
    //               'Gold Trainer Sessions',
    //               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    //             ),
    //           )),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.07,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             Text(
    //               'Sessions',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
    //             ),
    //             Text(
    //               'Current Rates',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
    //             ),
    //             Text(
    //               'New Rates',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.07,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: <Widget>[
    //             Text('10',
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
    //             Text('₹' + global.currate,
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
    //             TextField(
    //               controller: global.userNameController,
    //               keyboardType: TextInputType.number,
    //               decoration: new InputDecoration(
    //                 suffixStyle: TextStyle(
    //                     fontSize: MediaQuery.of(context).size.height * 0.035,
    //                     color: Colors.red),
    //                 prefixText: "\$",
    //                 prefixStyle: TextStyle(
    //                     fontSize: MediaQuery.of(context).size.height * 0.035,
    //                     color: Colors.red),
    //                 hintText: global.currate,
    //                 hintStyle: TextStyle(
    //                     fontSize: MediaQuery.of(context).size.height * 0.035,
    //                     color: Colors.red),
    //               ),
    //             ),
    //             // Text('154',
    //             //     style:
    //             //         TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0))
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.025,
    //       ),
    //       SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.05,
    //           child: Center(
    //             child: RaisedButton(
    //               color: Colors.white,
    //               child: Text(
    //                 "Confirm New Rates",
    //                 style: TextStyle(
    //                     color: Colors.red,
    //                     fontSize: MediaQuery.of(context).size.height * 0.025),
    //               ),
    //               onPressed: () => null,
    //             ),
    //           )),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.03,
    //       ),
    //       Divider(
    //         // height:5.0,
    //         thickness: 1.0,
    //       ),
    //       SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.07,
    //           child: Center(
    //             child: Text(
    //               ' Silver Trainer Sessions',
    //               style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
    //             ),
    //           )),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.07,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //           children: <Widget>[
    //             Text(
    //               'Sessions',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    //             ),
    //             Text(
    //               'Current Rates',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    //             ),
    //             Text(
    //               'New Rates',
    //               style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
    //             ),
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.07,
    //         child: Row(
    //           mainAxisAlignment: MainAxisAlignment.spaceAround,
    //           children: <Widget>[
    //             Text('10',
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
    //             Text('100',
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0)),
    //             Text('154',
    //                 style:
    //                     TextStyle(fontWeight: FontWeight.w600, fontSize: 18.0))
    //           ],
    //         ),
    //       ),
    //       SizedBox(
    //           height: MediaQuery.of(context).size.height * 0.05,
    //           child: Center(
    //             child: RaisedButton(
    //               color: Colors.white,
    //               child: Text(
    //                 "Confirm New Rates",
    //                 style: TextStyle(
    //                     color: Colors.red,
    //                     fontSize: MediaQuery.of(context).size.height * 0.025),
    //               ),
    //               onPressed: () => null,
    //             ),
    //           )),
    //       SizedBox(
    //         height: MediaQuery.of(context).size.height * 0.03,
    //       ),
    //     ],
    //   ),
    // );
  }
}
