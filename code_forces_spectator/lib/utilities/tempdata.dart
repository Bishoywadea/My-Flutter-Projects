import 'package:code_forces_spectator/utilities/friend_tab.dart';
import 'package:flutter/material.dart';

class handlesProvider extends ChangeNotifier {

  static List<FriendTab> listMaker(List<dynamic> friends){
    List<FriendTab> friendsList =[];
    for(String f in friends){
      friendsList.add(FriendTab(handle:f,rank: -1));
    }
    return friendsList;
  }
}