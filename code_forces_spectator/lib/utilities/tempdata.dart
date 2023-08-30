import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_forces_spectator/utilities/friend_tab.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';

class handlesProvider extends ChangeNotifier {

  static List<FriendTab> listMaker(List<QueryDocumentSnapshot<Map<String, dynamic>>> friends){
    List<FriendTab> friendsList = friends.map((doc) {
      return FriendTab(
        handle: doc['handle'],
        rank: -1,
      );
    }).toList();
    return friendsList;
  }
}