import 'package:flutter/material.dart';
import 'package:code_forces_spectator/Screens/login_screen.dart';
import 'package:code_forces_spectator/Screens/friends_list_screen.dart';
import 'package:code_forces_spectator/Screens/friend_info_screen.dart';
import 'package:device_preview/device_preview.dart';
void main() {
  runApp( DevicePreview(builder:(context)=>CodeForcesSpectator()));
}
// DevicePreview(builder:(context)=>
class CodeForcesSpectator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: DevicePreview.appBuilder,
      initialRoute: LogInScreen.id,
      routes: {
        LogInScreen.id: (context) => const LogInScreen(),
        FriendsListScreen.id: (context) => FriendsListScreen(),
        FriendInfoScreen.id: (context) => const FriendInfoScreen(),
      },
    );
  }
}