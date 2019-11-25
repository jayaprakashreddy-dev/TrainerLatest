// import 'package:dooit/Arrangements/SizeModification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

  void initState() {
    super.initState();

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
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //     //title: Text("Data Table"),
      //     ),
      body: ListView(
        children: <Widget>[
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.96,
            height: MediaQuery.of(context).size.height * 0.89,
            child: Column(
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
                        //for the data of session 1 in gold
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
                            Text("\$320",
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
                                prefixText: "\$",
                                prefixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                hintText: "\$320",
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                              ),
                              onSubmitted: (text) {
                                // print(text);
                              },
                              controller: gtext1,
                              keyboardType: TextInputType.number,
                            ),
                            showEditIcon: false,
                            placeholder: true,
                            onTap: () {},
                          ),
                        ],
                      ),
                      DataRow(
                        //for the data of session 5 in gold
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
                            Text("\$620",
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
                                prefixText: "\$",
                                prefixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                hintText: "\$620",
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                              ),
                              onSubmitted: (text) {
                                print(text);
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
                        //for the data of session 10 in gold
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
                            Text("\$1020",
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
                                prefixText: "\$",
                                prefixStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                                hintText: "\$1020",
                                hintStyle: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025,
                                    color: Colors.red),
                              ),
                              onSubmitted: (text) {
                                print(text);
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
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      "Confirm New Rates",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                    onPressed: () => confirmG(context),
                  ),
                ),
                SizedBox(
                  child: Column(
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
                                  Text("\$320",
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
                                      hintText: "\$320",
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
                                  Text("\$620",
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
                                      hintText: "\$620",
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
                                    controller: stext5,
                                    keyboardType: TextInputType.number,
                                  ),
                                  showEditIcon: false,
                                  placeholder: true,
                                  onTap: () {},
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
                                  Text("\$1020",
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
                                      hintText: "\$1020",
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
                Padding(
                  padding: EdgeInsets.only(top: 15.0),
                  child: RaisedButton(
                    color: Colors.white,
                    child: Text(
                      "Confirm New Rates",
                      style: TextStyle(
                          color: Colors.red,
                          fontSize: MediaQuery.of(context).size.height * 0.025),
                    ),
                    onPressed: () => confirmS(context),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  confirmS(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.28,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: EdgeInsets.only(
                    // bottom: MediaQuery.of(context).size.height * 0.0,
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Silver Trainer Sessions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Text(
                      //           'Wed 30 Oct 6:00 A.M-6:50 A.M ',
                      //           style: TextStyle(
                      //             color: Colors.black.withOpacity(0.7),
                      //             fontSize:
                      //                 MediaQuery.of(context).size.height * 0.025,
                      //           ),
                      //         ),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Text(
                      //           'Cult galleria ',
                      //           style: TextStyle(
                      //             color: Colors.black.withOpacity(0.7),
                      //             fontSize:
                      //                 MediaQuery.of(context).size.height * 0.025,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // new Container(
                      //   padding: EdgeInsets.only(
                      //     top: MediaQuery.of(context).size.height * 0.04,
                      //     left: MediaQuery.of(context).size.width * 0.05,
                      //   ),
                      //   color: Colors.grey.withOpacity(0.2),
                      //   height: MediaQuery.of(context).size.height * 0.24,
                      //   width: MediaQuery.of(context).size.width * 1.0,
                      //   child: Column(
                      //     children: <Widget>[
                      //       Text(
                      //         'Address:                                                           ',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: MediaQuery.of(context).size.height * 0.03,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       Text(
                      //         '2nd Floor, Galleria Market, DLF Phase 4, Sector 28, Gurugram - 122002 ',
                      //         style: TextStyle(
                      //           color: Colors.black.withOpacity(0.7),
                      //           fontSize: MediaQuery.of(context).size.height * 0.02,
                      //         ),
                      //       ),
                      new Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        color: Colors.grey.withOpacity(0.2),
                        // height: MediaQuery.of(context).size.height * 0.34,
                        width: MediaQuery.of(context).size.width * 1.0,
                        child: RaisedButton(
                          color: Colors.red,
                          // padding: EdgeInsets.only(
                          //   // top:MediaQuery.of(context).size.height*0.3,
                          //   left: MediaQuery.of(context).size.width * 0.03,
                          //   right: MediaQuery.of(context).size.width * 0.09,
                          // ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          child: Text(
                            'CONFIRM NEW RATES',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  confirmG(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return new Container(
            height: MediaQuery.of(context).size.height * 0.28,
            padding: EdgeInsets.only(
              top: MediaQuery.of(context).size.height * 0.02,
            ),
            child: Column(
              children: <Widget>[
                new Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  padding: EdgeInsets.only(
                    // bottom: MediaQuery.of(context).size.height * 0.0,
                    left: MediaQuery.of(context).size.width * 0.03,
                  ),
                  child: Column(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topCenter,
                        child: Text(
                          'Gold Trainer Sessions',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: MediaQuery.of(context).size.height * 0.03,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Text(
                      //           'Wed 30 Oct 6:00 A.M-6:50 A.M ',
                      //           style: TextStyle(
                      //             color: Colors.black.withOpacity(0.7),
                      //             fontSize:
                      //                 MediaQuery.of(context).size.height * 0.025,
                      //           ),
                      //         ),
                      //       ),
                      //       Align(
                      //         alignment: Alignment.topLeft,
                      //         child: Text(
                      //           'Cult galleria ',
                      //           style: TextStyle(
                      //             color: Colors.black.withOpacity(0.7),
                      //             fontSize:
                      //                 MediaQuery.of(context).size.height * 0.025,
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // new Container(
                      //   padding: EdgeInsets.only(
                      //     top: MediaQuery.of(context).size.height * 0.04,
                      //     left: MediaQuery.of(context).size.width * 0.05,
                      //   ),
                      //   color: Colors.grey.withOpacity(0.2),
                      //   height: MediaQuery.of(context).size.height * 0.24,
                      //   width: MediaQuery.of(context).size.width * 1.0,
                      //   child: Column(
                      //     children: <Widget>[
                      //       Text(
                      //         'Address:                                                           ',
                      //         style: TextStyle(
                      //           color: Colors.black,
                      //           fontSize: MediaQuery.of(context).size.height * 0.03,
                      //           fontWeight: FontWeight.bold,
                      //         ),
                      //       ),
                      //       Text(
                      //         '2nd Floor, Galleria Market, DLF Phase 4, Sector 28, Gurugram - 122002 ',
                      //         style: TextStyle(
                      //           color: Colors.black.withOpacity(0.7),
                      //           fontSize: MediaQuery.of(context).size.height * 0.02,
                      //         ),
                      //       ),
                      new Container(
                        padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height * 0.04,
                          left: MediaQuery.of(context).size.width * 0.05,
                        ),
                        color: Colors.grey.withOpacity(0.2),
                        // height: MediaQuery.of(context).size.height * 0.34,
                        width: MediaQuery.of(context).size.width * 1.0,
                        child: RaisedButton(
                          color: Colors.red,
                          padding: EdgeInsets.only(
                            // top:MediaQuery.of(context).size.height*0.3,
                            left: MediaQuery.of(context).size.width * 0.1,
                            right: MediaQuery.of(context).size.width * 0.1,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(27.0),
                          ),
                          child: Text(
                            'CONFIRM NEW RATES',
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                          onPressed: () {},
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}
