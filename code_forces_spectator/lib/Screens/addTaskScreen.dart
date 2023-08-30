import 'package:flutter/material.dart';
import 'package:code_forces_spectator/utilities/api_functions.dart';
import 'package:code_forces_spectator/utilities/tempdata.dart';
import 'package:provider/provider.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:code_forces_spectator/utilities/fire_base_functions.dart';
class AddTaskScreen extends StatefulWidget {
  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  late String handle='';
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xff757575),
      child: Container(
        padding: EdgeInsets.all(30.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [

            Text(
              "Add By Handle",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.lightBlueAccent,
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold),
            ),

            TextField(
              autofocus: true,
              textAlign: TextAlign.center,
              onChanged: (text) {
                handle = text;
              },
            ),

            SizedBox(
              height: 20.0,
            ),

            GestureDetector(
              onTap: () async {
                final result = await ApiFunctions.checkHandle(handle);
                if (result == 1) {
                  FireBaseFunctions.saveHandle(handle, -1);
                  Navigator.pop(context);
                } else {
                  Alert(
                    context: context,
                    type: AlertType.error,
                    title: "Wrong handle",
                    desc: "Wrong Answer in Test 999 ; )",
                    buttons: [
                      DialogButton(
                        child: Text(
                          "Try Again",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                          Navigator.pop(context);
                        },
                        width: 120,
                      )
                    ],
                  ).show();
                }
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(40.0),
                ),
                padding: EdgeInsets.symmetric(
                  vertical: 20.0,
                  horizontal: 35.0,
                ),
                child: Center(
                  child: Text(
                    "Run",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
