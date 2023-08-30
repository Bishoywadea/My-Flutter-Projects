import 'package:code_forces_spectator/utilities/friend_tab.dart';
import 'package:flutter/material.dart';

class DataBase extends ChangeNotifier{

  List<Widget> items = [
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
    const FriendTab(handle: 'noname',rank: 1),
  ];

  void Add(String handle,String rank){
    items.add(FriendTab(handle: handle, rank: 1));
    notifyListeners();
  }
}