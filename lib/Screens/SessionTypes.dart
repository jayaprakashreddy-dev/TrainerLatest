import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Info/variables.dart'as global;

class SessionTypes extends StatefulWidget{
  @override
  _SessionTypesState createState() => _SessionTypesState();
}

class _SessionTypesState extends State<SessionTypes> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ListView(
      children: <Widget>[
        Padding(
        padding: EdgeInsets.only(left: 1.0, right: 5.0,top: 8.0),
      child:  SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                Text("Session Types",style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 35.0)),
                Text("Availabilty",style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 35.0)),


                ],),
        ),
        ),
         Padding(
        padding: EdgeInsets.only( right: 5.0,top: 12.0),
      child: 
       SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Text("Silver",style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 42.0)
                                ),

                Checkbox(
                            value:
                            // true,
                             global.selectedSilver,
                            onChanged: (bool value)  {
                              setState(()  {
                              global.selectedSilver = value;
                              });
                              // global.index=index;

                              
                            },
                          ),



        ],)
        ,)
         ),
           SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Text("Group",style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 42.0)
                                ),

                Checkbox(value:
                            // true,
                             global.selectedGold,
                            onChanged: (bool value) {
                              setState(()  {
                              global.selectedGold= value;
                              });
                              // global.index=index;

                              
                            },
                          ),



        ],)
        ,),
         SizedBox(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
               Text("Platinum",style: TextStyle(
                            color: Colors.black,
                            backgroundColor: Colors.white,
                            fontSize:
                                MediaQuery.of(context).size.height / 42.0)
                                ),

                Checkbox(value:
                            // true,
                             global.selectedGold,
                            onChanged: (bool value) {
                              setState(()  {
                              global.selectedGold= value;
                              });
                              // global.index=index;

                              
                            },
                          ),



        ],)
        ,)
      ],
    );
  }
}