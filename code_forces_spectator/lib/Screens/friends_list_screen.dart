import 'package:code_forces_spectator/Screens/friend_info_screen.dart';
import 'package:code_forces_spectator/utilities/api_functions.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:code_forces_spectator/utilities/friend_tab.dart';
import 'package:provider/provider.dart';
import 'package:code_forces_spectator/utilities/tempdata.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_forces_spectator/Screens/addTaskScreen.dart';
import 'package:code_forces_spectator/utilities/passed_object.dart';

class FriendsListScreen extends StatefulWidget {
  FriendsListScreen({super.key});
  static const String id = "friendslist_screen";
  @override
  State<FriendsListScreen> createState() => _FriendsListScreenState();
}

class _FriendsListScreenState extends State<FriendsListScreen> {
  int _selectedItemIndex = 0;
  List<dynamic> handles = [];
  int friendsNumber = 0;
  void updateNumber() {
    friendsNumber = handles.length;
  }

  FixedExtentScrollController scrollController = FixedExtentScrollController();

  @override
  void initState() {
    scrollController = FixedExtentScrollController();
    super.initState();
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    User currentuser = ModalRoute.of(context)?.settings.arguments as User;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Your Friends'),
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
        child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
          stream: _firestore.collection('friends').doc(currentuser?.uid).snapshots(),
          builder: (context, snapshot) {
            List<FriendTab> friendsList = [];
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(
                  color: Colors.black,
                ),
              );
            }
            print(snapshot.data!.data()?['handle']);
            if (snapshot.data!.data()?['handle']==null) {
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
              handles =  snapshot.data!.data()?['handle'];
              updateNumber();
              friendsList=handlesProvider.listMaker(handles);
              return ListWheelScrollView(
                controller: scrollController,
                magnification: 1.5,
                useMagnifier: true,
                physics: const FixedExtentScrollPhysics(),
                diameterRatio: 1.6,
                squeeze: 0.6,
                itemExtent: 75,
                children: friendsList
                    .map(
                      (friend) => Container(
                        child: GestureDetector(
                          onTap: () async {
                            var info =
                                await ApiFunctions.getInfo(friend.handle);
                            var history =
                                await ApiFunctions.getHistory(friend.handle);
                            Navigator.pushNamed(context, FriendInfoScreen.id,
                                arguments:
                                    passedObject(info: info, history: history));
                          },
                          child: Center(
                            child: friend,
                          ),
                        ),
                      ),
                    )
                    .toList(),
              );
            }
            ;
          },
        ),
      ),
    );
  }
}
