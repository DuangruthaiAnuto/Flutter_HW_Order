import 'package:flutter/material.dart';
import 'package:flutter_lab_05_login_start/login.dart';
import 'login.dart';

class Home extends StatelessWidget {
  //Add Logout Button, Function and variable
  final String fname;
  final String lname;
  final String address;
  final String post;
  final String phone;
  final String redate;

  Home(
      this.fname, this.lname, this.address, this.post, this.phone, this.redate);

  void logout(context) async {
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
        backgroundColor: Colors.teal[700],
        title: Text("Shipping information"),
      ),
      body: Container(
        color: Colors.teal[50],
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.done_outline,
              color: Colors.teal[700],
              size: 80.0,
            ),
            Text(
              "\nYour name: $fname  $lname \n\nAddress : $address\n\nPoatal : $post\n\nPhone : $phone\n\nRecieveDate : $redate\n", //Place Code Here
              textAlign: TextAlign.left,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            RaisedButton(
              color: Colors.teal,
              onPressed: () {
                logout(context);
              },
              child: Text(
                "Finish",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 23,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
