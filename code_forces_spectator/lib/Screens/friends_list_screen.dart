import 'package:code_forces_spectator/Screens/friend_info_screen.dart';
import 'package:flutter/material.dart';

class FriendsListScreen extends StatelessWidget {
  FriendsListScreen({super.key});
  static const String id = "friendslist_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Text('friendslist_screen'),
      ),
      body: GestureDetector(
        child: Container(
          width: size.width,
          height: size.height,
          color: Colors.red,
          child: Text('friend'),
        ),
        onTap: (){
          Navigator.pushNamed(context, FriendInfoScreen.id);
        },
      ),
    );
  }
}