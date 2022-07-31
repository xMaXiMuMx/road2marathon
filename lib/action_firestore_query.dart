import 'package:cloud_firestore/cloud_firestore.dart';

class ActionFirestoreQuery {
  // static getTestCollection() async {
  //   final CollectionReference testCollection =
  //       FirebaseFirestore.instance.collection('distance_simulate');
  //   final res = await testCollection.where('dist', isEqualTo: 10).get();
  //   print(res.docs.map((e) => e.data()).toList());
  // }

  static getRunningInstructionByDistance(int distance) async {
    final CollectionReference distanceSimulate =
        FirebaseFirestore.instance.collection('distance_simulate');
    final QuerySnapshot snapshot =
        await distanceSimulate.where('dist', isEqualTo: distance).get();
    final List instruction = snapshot.docs.map((e) => e.data()).toList();
    return instruction;
  }

  static getRunningInstructionByTime(int time) async {
    final CollectionReference distanceSimulate =
        FirebaseFirestore.instance.collection('time_simulate');
    final QuerySnapshot snapshot =
        await distanceSimulate.where('time', isEqualTo: time).get();
    final List instruction = snapshot.docs.map((e) => e.data()).toList();
    return instruction;
  }
}
