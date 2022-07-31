import 'package:flutter/material.dart';
import 'package:road_2_marathon/screen/Running/R_one.dart';
import 'package:road_2_marathon/screen/Running/R_three.dart';
import 'package:road_2_marathon/screen/Running/R_two.dart';

class Running extends StatefulWidget {
  const Running({Key? key}) : super(key: key);

  @override
  State<Running> createState() => _RunningState();
}

class _RunningState extends State<Running> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.limeAccent,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Running Mode"),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: RadialGradient(
            colors: [Colors.white, Colors.yellowAccent.shade100],
            radius: 1.0,
          )),
          child: Column(
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => R_one()));
                },
                child: Container(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      color: Colors.brown[100],
                      shape: CircleBorder(),
                      elevation: 8,
                      child: Container(
                        child: ListTile(
                          title:
                              Text("มือใหม่", style: TextStyle(fontSize: 20)),
                          subtitle: Image.asset(
                            "assets/images/newbie.png",
                            // fit: BoxFit.contain,
                            // width: 300,
                            // height: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => R_two()));
                },
                child: Container(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      color: Colors.deepOrange[200],
                      shape: CircleBorder(),
                      elevation: 8,
                      child: Container(
                        child: ListTile(
                          title: Text("บุคคลทั่วไป",
                              style: TextStyle(fontSize: 20)),
                          subtitle: Image.asset(
                            "assets/images/normal.png",
                            // fit: BoxFit.contain,
                            // width: 300,
                            // height: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => R_three()));
                },
                child: Container(
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Card(
                      color: Colors.red[400],
                      shape: CircleBorder(),
                      elevation: 8,
                      child: Container(
                        child: ListTile(
                          title:
                              Text("มืออาชีพ", style: TextStyle(fontSize: 20)),
                          subtitle: Image.asset(
                            "assets/images/pro.png",
                            // fit: BoxFit.contain,
                            // width: 300,
                            // height: 300,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
