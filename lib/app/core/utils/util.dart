import 'dart:async';
import 'package:thanh_pho_bao_loc/app/domain/entities/user.dart' as user_entity;
import 'package:cloud_firestore/cloud_firestore.dart';

class Utils {
  static String getImagePath(String name, {String format = 'png'}) {
    return 'assets/images/$name.$format';
  }

//   static StreamTransformer transformer<T>(
//           T Function(Map<String, dynamic> json) fromJson) =>
//       StreamTransformer<QuerySnapshot, List<T>>.fromHandlers(
//           handleData: (QuerySnapshot data, EventSink<List<T>> sink) {
//         final snaps = data.docs.map((doc) => doc.data()).toList();
//         final users = snaps.map((json) => fromJson).toList();
//         sink.add(users);
//       });
// }
}
