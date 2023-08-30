import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'tempdata.dart';
import 'package:provider/provider.dart';
import 'package:code_forces_spectator/Screens/friends_list_screen.dart';
class FireBaseFunctions {
  static   final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  static Future<dynamic> saveHandle(String handle,int rank) async {
    _firestore.collection('friends').add({'handle': handle});
  }
}