import 'package:flutter/material.dart';
import 'package:road_2_marathon/action_firestore_query.dart';

class SimulateResultByTime extends StatefulWidget {
  final int? time;

  SimulateResultByTime({Key? key, this.time}) : super(key: key);

  @override
  State<SimulateResultByTime> createState() => _SimulateResultByTimeState();
}

class _SimulateResultByTimeState extends State<SimulateResultByTime> {
  bool isLoad = false;
  List data = [];
  initialAction() async {
    setState(() {
      isLoad = true;
    });

    final res =
        await ActionFirestoreQuery.getRunningInstructionByTime(widget.time!);

    setState(() {
      data = res;
      isLoad = false;
    });
  }

  @override
  void initState() {
    initialAction();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellowAccent[100],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black,
        title: Text("Your Program"),
      ),
      body: isLoad
          ? Column(
              children: [
                Spacer(),
                Row(
                  children: [
                    Spacer(),
                    Container(
                      child: CircularProgressIndicator(),
                    ),
                    Spacer(),
                  ],
                ),
                Spacer(),
              ],
            )
          : Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  data.length == 0
                      ? Flexible(
                          child: Column(
                            children: [
                              Spacer(),
                              Row(
                                children: [
                                  Spacer(),
                                  Container(
                                    child: Text('No Data'),
                                  ),
                                  Spacer(),
                                ],
                              ),
                              Spacer(),
                            ],
                          ),
                        )
                      : Flexible(
                          child: ListView.builder(
                            itemCount: data.length,
                            itemBuilder: (context, index) => Container(
                                child: ListView.builder(
                              physics: NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: data[index]['instr'].length,
                              itemBuilder: (context, index2) => Container(
                                child: Column(
                                  children: [
                                    data[index]['instr'][index2]['topic'] ==
                                            null
                                        ? Container()
                                        : Row(
                                            children: [
                                              Expanded(
                                                child: Container(
                                                  color: Colors.black,
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  margin: const EdgeInsets
                                                          .symmetric(
                                                      vertical: 10.0),
                                                  child: Text(
                                                    data[index]['instr'][index2]
                                                            ['topic']
                                                        .toString(),
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        color: Colors.white),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                    ListView.builder(
                                      physics: NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemCount: data[index]['instr'][index2]
                                              ['content']
                                          .length,
                                      itemBuilder: (context, index3) => Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 10.0),
                                            child: data[index]['instr'][index2]
                                                        ['content'][index3] ==
                                                    null
                                                ? Container()
                                                : Text(data[index]['instr']
                                                            [index2]['content']
                                                        [index3]
                                                    .toString()),
                                          ),
                                        ],
                                      ),
                                    ),
                                    data[index]['instr'][index2]['image_url'] ==
                                            null
                                        ? Container()
                                        : Image.network(data[index]['instr']
                                                [index2]['image_url']
                                            .toString())
                                  ],

                                  // Image

                                  // list image> contain
                                ),
                              ),
                            )),
                          ),
                        )
                ],
              ),
            ),
    );
  }
}
