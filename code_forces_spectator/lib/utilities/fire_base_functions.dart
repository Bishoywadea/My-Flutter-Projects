import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'tempdata.dart';
import 'package:provider/provider.dart';
import 'package:code_forces_spectator/Screens/friends_list_screen.dart';

class FireBaseFunctions {
  static final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  static Future<List<String>> getFriends() async {
    User? currentUser = await FirebaseAuth.instance.currentUser;
    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('friends').doc(currentUser?.uid);
    DocumentSnapshot userSnapshot = await userDocRef.get();
    if (userSnapshot == null) {
      return [];
    }
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;
    List<String> currentList = List<String>.from(data['handle']);
    return currentList;
  }

  static Future<void> saveHandle(String handle, int rank) async {
    User? currentUser = await FirebaseAuth.instance.currentUser;
    DocumentReference userDocRef =
        FirebaseFirestore.instance.collection('friends').doc(currentUser?.uid);
    DocumentSnapshot userSnapshot = await userDocRef.get();
    if(userSnapshot.data()==null){
      await userDocRef.set({
        'handle': [handle],
      });
      return;
    }
    Map<String, dynamic> data = userSnapshot.data() as Map<String, dynamic>;
    List<String> currentList = List<String>.from(data['handle']);
    currentList.add(handle);
    await userDocRef.update({'handle': currentList});
  }
}
