import 'package:code_forces_spectator/utilities/tempdata.dart';
import 'package:flutter/material.dart';
import 'package:code_forces_spectator/Screens/login_screen.dart';
import 'package:code_forces_spectator/Screens/friends_list_screen.dart';
import 'package:code_forces_spectator/Screens/friend_info_screen.dart';
import 'package:code_forces_spectator/Screens/register.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:code_forces_spectator/utilities/tempdata.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp( DevicePreview(builder:(context)=>CodeForcesSpectator()));
}
// DevicePreview(builder:(context)=>
class CodeForcesSpectator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context)=>handlesProvider(),
      child: MaterialApp(
        builder: DevicePreview.appBuilder,
        initialRoute: LogInScreen.id,
        routes: {
          LogInScreen.id: (context) => const LogInScreen(),
          FriendsListScreen.id: (context) => FriendsListScreen(),
          FriendInfoScreen.id: (context) => FriendInfoScreen(),
          RegisterScreen.id: (context) =>  RegisterScreen(),
        },
      ),
    );
  }
}