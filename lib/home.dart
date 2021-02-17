import 'package:flutter/material.dart';
import 'package:flutter_lab_05_login_start/login.dart';
import 'login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Home extends StatelessWidget {
  //Add Logout Button, Function and variable
  final String fname;
  final String lname;
  final String address;

  Home(this.fname, this.lname, this.address);

  void logout(context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("user", null);
    prefs.setString("lname", null);

    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => Login(),
      ),
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[700],
        title: Text("ComSci Project"),
      ),
      body: Container(
        color: Colors.blueGrey[200],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hello!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
            ),
            Text(
              "Your name: $fname  $lname \n$address", //Place Code Here
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              onPressed: () {
                logout(context);
              },
              child: Text("Logout"),
            ),
          ],
        ),
      ),
    );
  }
}
