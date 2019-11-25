import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class SankethHome extends StatefulWidget {
  @override
  _SankethHomeState createState() => _SankethHomeState();
}

class _SankethHomeState extends State<SankethHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Data Table"),
      ),
      body: SizedBox(
        width: MediaQuery.of(context).size.width * 0.96,
        height: MediaQuery.of(context).size.height * 0.90,
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
                headingRowHeight: MediaQuery.of(context).size.height * 0.012,
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
                rows: names
                    .map(
                      (name) => DataRow(
                        cells: [
                          DataCell(
                            Text(name.Sessions,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            Text(name.C_Rates,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                          ),
                          DataCell(
                            Text(name.N_Rates,
                                style: TextStyle(
                                    color: Colors.red,
                                    fontSize:
                                        MediaQuery.of(context).size.height *
                                            0.025)),
                            showEditIcon: false,
                            placeholder: false,
                            onTap: () {},
                          ),
                        ],
                      ),
                    )
                    .toList(),
              ),
            ),
            RaisedButton(
              color: Colors.white,
              child: Text(
                "Confirm New Rates",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
              onPressed: () => confirmG(context),
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
                      horizontalMargin:
                          MediaQuery.of(context).size.width * 0.03,
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
                      rows: names
                          .map(
                            (name) => DataRow(
                              cells: [
                                DataCell(
                                  Text(name.Sessions,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text(name.C_Rates,
                                      style: TextStyle(
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                ),
                                DataCell(
                                  Text(name.N_Rates,
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontSize: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.025)),
                                  showEditIcon: false,
                                  placeholder: false,
                                  onTap: () {},
                                ),
                              ],
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
            RaisedButton(
              color: Colors.white,
              child: Text(
                "Confirm New Rates",
                style: TextStyle(
                    color: Colors.red,
                    fontSize: MediaQuery.of(context).size.height * 0.025),
              ),
              onPressed: () => confirmS(context),
            ),
          ],
        ),
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
                      ),),
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
                      ),),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }
}

class Name {
  String Sessions;
  String C_Rates;
  String N_Rates;

  Name({this.Sessions, this.C_Rates, this.N_Rates});
}

var names = <Name>[
  Name(Sessions: "1", C_Rates: "\$320", N_Rates: "\$320"),
  Name(Sessions: "5", C_Rates: "\$920", N_Rates: "\$920"),
  Name(Sessions: "10", C_Rates: "\$1020", N_Rates: "\$1020"),
];
