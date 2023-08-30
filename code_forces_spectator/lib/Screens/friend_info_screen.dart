import 'package:code_forces_spectator/utilities/friend.dart';
import 'package:flutter/material.dart';
import 'package:code_forces_spectator/utilities/friend.dart';
import 'dart:convert' as convert;
import 'package:cached_network_image/cached_network_image.dart';

class FriendInfoScreen extends StatefulWidget {
  static const String id = "friendinfo_screen";

  @override
  State<FriendInfoScreen> createState() => _FriendInfoScreenState();
}

//${info['result'][0]['handle']}
class _FriendInfoScreenState extends State<FriendInfoScreen> {
  Widget buildBody(var info) {
    final String imageUrl = '${info['result'][0]['titlePhoto']}';
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                  radius: 80.0,
                  backgroundImage: CachedNetworkImageProvider(imageUrl),
              ),
              Text(
                '${info['result'][0]['handle']}',
                style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
              SizedBox(
                height: 10.0,
              ),
              Text(
                '${info['result'][0]['rank']}',
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red.shade400,
                    letterSpacing: 2.5),
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var info = ModalRoute.of(context)?.settings.arguments;
    return buildBody(info);
  }
}