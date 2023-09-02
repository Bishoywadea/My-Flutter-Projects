import 'package:code_forces_spectator/Screens/friend_info_screen.dart';
import 'package:flutter/material.dart';
import 'package:code_forces_spectator/utilities/background.dart';
import 'package:code_forces_spectator/Screens/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

import 'friends_list_screen.dart';


class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});
  static const String id = "login_Screen";

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  late String handle;
  late String password;
  late bool spinner=false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall: spinner,
        child: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.symmetric(horizontal: 40),
                child: Text(
                  "LOGIN",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2661FA),
                      fontSize: 36),
                  textAlign: TextAlign.left,
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      handle=value;
                    });
                    print(handle); //testing
                  },
                  decoration: InputDecoration(labelText: "Enter your Email"),
                ),
              ),

              SizedBox(height: size.height * 0.03),

              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: TextField(
                  onChanged: (value){
                    setState(() {
                      password=value;
                    });
                    print(password); //testing
                  },
                  decoration: InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
              ),

              SizedBox(height: size.height * 0.05),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: ElevatedButton(
                  onPressed: () async{
                    setState(() {
                      spinner=true;
                    });
                    print(handle); //testing
                    print(password); //testing
                    try{
                      final user = await _auth.signInWithEmailAndPassword(email: handle, password: password);
                      setState(() {
                        spinner=false;
                      });
                      if(user!=null){
                        User? currentUser = await FirebaseAuth.instance.currentUser;
                        //print(currentUser);
                        Navigator.pushNamed(context, FriendsListScreen.id,arguments: currentUser);
                      }
                    }
                    catch(e){
                      print(e);
                    }
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(const EdgeInsets.all(0)),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(80),
                      ),
                    ),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    height: 50.0,
                    width: size.width * 0.5,
                    decoration: new BoxDecoration(
                        borderRadius: BorderRadius.circular(80.0),
                        gradient: new LinearGradient(colors: [
                          Color.fromARGB(255, 255, 136, 34),
                          Color.fromARGB(255, 255, 177, 41)
                        ])),
                    padding: const EdgeInsets.all(0),
                    child: Text(
                      "LOGIN",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                child: GestureDetector(
                  onTap: () => {
                    Navigator.pushNamed(context, RegisterScreen.id)
                  },
                  child: Text(
                    "Don't Have an Account? Sign up",
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF2661FA)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
