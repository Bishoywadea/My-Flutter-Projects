import 'package:code_forces_spectator/Screens/friend_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code_forces_spectator/utilities/friend_tab.dart';
import 'package:provider/provider.dart';
import 'package:code_forces_spectator/utilities/tempdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_forces_spectator/Screens/addTaskScreen.dart';

class FriendsListScreen extends StatefulWidget {
  FriendsListScreen({super.key});
  static const String id = "friendslist_screen";

  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  int _selectedItemIndex = 0;
  List<QueryDocumentSnapshot<Map<String, dynamic>>> friends = [];
  int friendsNumber = 0;
  void updateNumber() {
    friendsNumber = friends.length;
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              '${friendsNumber} ${friendsNumber == 1 ? 'Friend' : 'Friends'}'),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => AddTaskScreen(),
          ).then((value) {
            setState(() {});
          });
        },
        child: Icon(Icons.add),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: Container(
        width: size.width,
        height: size.height,
        child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
          stream: _firestore.collection('friends').snapshots(),
          builder: (context, snapshot) {
            List<Widget> friendsList = [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }

            if (!snapshot.hasData) {
              return Text('No data available');
            }
            friends = snapshot.data!.docs;
            updateNumber();

            if (friendsNumber == 0) {
              return Center(
                child: Column(
                  children: [
                    Container(
                      child: Image.asset("assets/images/sad-cry.gif",
                          width: size.width),
                    ),
                    Text(
                      'Lonley?!',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'its alright iam too!',
                      style: TextStyle(
                          fontSize: 30.0, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              );
            } else {
              List<Widget> itemList = friends.map((doc) {
                return FriendTab(
                  handle: doc['handle'],
                  rank: -1,
                  // Other widget properties
                );
              }).toList();

              return ListWheelScrollView(
                magnification: 1.5,
                useMagnifier: true,
                physics: FixedExtentScrollPhysics(),
                diameterRatio: 1.6,
                squeeze: 0.6,
                itemExtent: 75,
                onSelectedItemChanged: (index) => {
                  // setState(() {
                  //   _selectedItemIndex = index;
                  // })
                },
                children: itemList,
              );
            }
            ;
          },
        ),
      ),
    );
  }
}
