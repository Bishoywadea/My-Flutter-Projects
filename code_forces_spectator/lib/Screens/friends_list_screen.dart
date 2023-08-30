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
  // List<Widget> items = [
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  //   const FriendTab(handle: 'noname',rank: 'LGM'),
  // ];
  final CollectionReference mainCollectionRef =
      FirebaseFirestore.instance.collection('mainCollection');
  final DocumentReference arrayDocumentRef = FirebaseFirestore.instance
      .collection('mainCollection')
      .doc('arrayDocument');
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              '${Provider.of<DataBase>(context, listen: true).items.length}Friends'),
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
        child: Consumer<DataBase>(
          builder: (context, database, child) {
            return ListWheelScrollView(
              magnification: 1.5,
              useMagnifier: true,
              physics: FixedExtentScrollPhysics(),
              diameterRatio: 1.6,
              squeeze: 0.6,
              itemExtent: 75,
              onSelectedItemChanged: (index) => {
                setState(() {
                  _selectedItemIndex = index;
                })
              },
              children:database.items.toList() ,
            );
          },
        ),
      ),
    );
  }
}

// ListWheelScrollView(
// magnification: 1.5,
// useMagnifier: true,
// physics: FixedExtentScrollPhysics(),
// diameterRatio: 1.6,
// squeeze: 0.6,
// itemExtent: 75,
// onSelectedItemChanged: (index) => {
// setState(() {
// _selectedItemIndex = index;
// })
// },
// children:database.items ,
// );
