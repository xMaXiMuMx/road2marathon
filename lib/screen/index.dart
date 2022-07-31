import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:road_2_marathon/screen/home.dart';
import 'package:road_2_marathon/screen/mode/running.dart';
import 'package:road_2_marathon/screen/mode/training.dart';
import 'package:road_2_marathon/screen/mode/treat.dart';
import 'package:road_2_marathon/screen/record.dart';

class Index extends StatefulWidget {
  @override
  _IndexState createState() => _IndexState();
}

class _IndexState extends State<Index> {
  final auth = FirebaseAuth.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Welcome"),
      ),
      backgroundColor: Colors.yellowAccent[100],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Center(
          child: ListView(
            children: [
              Image.asset(
                "assets/images/icon2.png",
                width: 300,
                height: 300,
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 50.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.alarm),
                  label: Text("Training Mode", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Training();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.healing),
                  label: Text("Treat Mode", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Treat();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: double.infinity,
                height: 50.0,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.book),
                  label:
                      Text("Simulate Program", style: TextStyle(fontSize: 20)),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Record();
                    }));
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 130,
              ),
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.logout),
                    label: Text("Sign out", style: TextStyle(fontSize: 20)),
                    onPressed: () {
                      auth.signOut().then((value) {
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return HomeScreen();
                        }));
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.red,
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
