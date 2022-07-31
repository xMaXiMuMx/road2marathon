import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:road_2_marathon/action_firestore_query.dart';
import 'package:road_2_marathon/screen/display.dart';
import 'package:road_2_marathon/screen/home.dart';
import 'package:road_2_marathon/screen/index.dart';
import 'package:road_2_marathon/screen/simulate_result.dart';
import 'package:road_2_marathon/simulate_result_by_time.dart';

class Record extends StatefulWidget {
  const Record({Key? key}) : super(key: key);

  @override
  State<Record> createState() => _RecordState();
}

class _RecordState extends State<Record> {
  List programType = [
    {
      "key": 1,
      "name": "Times",
    },
    {
      "key": 2,
      "name": "Distances",
    },
  ];

  List distances = [10, 21, 42];

  List practiceDurations = [4, 8, 12, 16];

  List ageRanges = [
    {
      "key": 0,
      "min": 15,
      "max": 20,
    },
    {
      "key": 1,
      "min": 21,
      "max": 25,
    },
    {
      "key": 2,
      "min": 26,
      "max": 30,
    },
    {
      "key": 3,
      "min": 31,
      "max": 35,
    },
    {
      "key": 4,
      "min": 36,
      "max": 40,
    },
    {
      "key": 5,
      "min": 41,
      "max": -1,
    },
  ];

  int selectedProgram = 2;
  int selectedDistance = 10;
  int selectedPracticeDurations = 4;
  final auth = FirebaseAuth.instance;

  Widget buildDetailSection(int key) {
    if (key == 0) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.yellowAccent[100],
        child: DropdownButton(
          isExpanded: true,
          borderRadius: BorderRadius.circular(20),
          isDense: true,
          value: selectedProgram.toString(),
          items: ageRanges
              .map((item) => DropdownMenuItem<String>(
                    child: Text(
                        '${item['min']}${item['max'] == -1 ? '+' : -item['max']}'),
                    value: "${item['key']}",
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {});
          },
        ),
      );
    } else if (key == 1) {
      return Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.yellowAccent[100],
        child: DropdownButton(
          isExpanded: true,
          borderRadius: BorderRadius.circular(20),
          isDense: true,
          value: selectedPracticeDurations.toString(),
          items: practiceDurations
              .map((e) => DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e.toString(),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedPracticeDurations = int.parse(value.toString());
            });
          },
        ),
      );
    } else {
      return Container(
        padding: const EdgeInsets.all(20.0),
        color: Colors.yellowAccent[100],
        child: DropdownButton(
          isExpanded: true,
          borderRadius: BorderRadius.circular(20),
          isDense: true,
          value: selectedDistance.toString(),
          items: distances
              .map((e) => DropdownMenuItem(
                    child: Text(e.toString()),
                    value: e.toString(),
                  ))
              .toList(),
          onChanged: (value) {
            setState(() {
              selectedDistance = int.parse(value.toString());
            });
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellowAccent[100],
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.black,
          title: Text("Create Your Program"),
        ),
        body: Column(
          children: [
            Flexible(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ListView(
                  children: [
                    SizedBox(
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.all(20.0),
                      color: Colors.yellowAccent[100],
                      child: DropdownButton(
                        isExpanded: true,
                        borderRadius: BorderRadius.circular(20),
                        isDense: true,
                        value: selectedProgram.toString(),
                        items: programType
                            .map((item) => DropdownMenuItem<String>(
                                  child: Text('${item['name']}'),
                                  value: "${item['key']}",
                                ))
                            .toList(),
                        onChanged: (value) {
                          setState(() {
                            selectedProgram = int.parse(value.toString());
                          });
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    buildDetailSection(selectedProgram)
                  ],
                ),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
                    color: Colors.yellowAccent[100],
                    child: SizedBox(
                      height: 45,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Colors.black, elevation: 0),
                        onPressed: () {
                          if (selectedProgram == 1) {}
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SimulateResultByTime(
                                    time: selectedPracticeDurations),
                              ));
                          if (selectedProgram == 2) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => SimulateResult(
                                      distance: selectedDistance),
                                ));
                          }
                        },
                        child: Text('Simulate'),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ));

    // return Scaffold(
    //   backgroundColor: Colors.yellowAccent[100],
    //   appBar: AppBar(
    //     backgroundColor: Colors.black,
    //     title: Text("Create Your Program"),
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         SizedBox(
    //           height: 50,
    //         ),
    //         DropdownButton<String>(
    //           value: selectedValue,
    //           items: ['Ages', 'Times', 'Distance']
    //               .map(
    //                 (String item) => DropdownMenuItem<String>(
    //                   child: Text(item),
    //                   value: item,
    //                 ),
    //               )
    //               .toList(),
    //           onChanged: (String? value) {
    //             setState(() {
    //               selectedValue = value;
    //             });
    //           },
    //         ),
    //         SizedBox(
    //           height: 100,
    //         ),
    //         DropdownButtonFormField<String>(
    //           value: selectedValue,
    //           items: ['Ages', 'Times', 'Distance']
    //               .map(
    //                 (String item) => DropdownMenuItem<String>(
    //                   child: Text(item),
    //                   value: item,
    //                 ),
    //               )
    //               .toList(),
    //           onChanged: (String? value) {
    //             setState(() {
    //               selectedValue = value;
    //             });
    //           },
    //         ),

    //         SizedBox(
    //           width: double.infinity,
    //           height: 50.0,
    //           child: ElevatedButton.icon(
    //             icon: Icon(Icons.run_circle),
    //             label: Text("Simulate", style: TextStyle(fontSize: 20)),
    //             onPressed: () {
    //               Navigator.push(context, MaterialPageRoute(builder: (context) {
    //                 return DisplayScreen();
    //               }));
    //             },
    //             style: ElevatedButton.styleFrom(
    //               primary: Colors.black,
    //             ),
    //           ),
    //         ),
    //       ],
    //     ),
    //   ),
    // );
  }
}
