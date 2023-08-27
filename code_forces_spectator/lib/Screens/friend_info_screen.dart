import 'package:flutter/material.dart';

class FriendInfoScreen extends StatelessWidget {
  const FriendInfoScreen({super.key});
  static const String id = "friendinfo_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('friendsinfo_screen'),
      ),
      body: Center(
        child: GestureDetector(
          child: Container(
            width: 50.0,
            height: 50.0,
            color: Colors.red,
            child: Text('friend info'),
          ),
        ),
      ),
    );
  }
}

