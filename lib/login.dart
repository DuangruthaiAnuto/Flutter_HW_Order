import 'package:flutter/material.dart';
import 'loginForm.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[700],
        title: Text("Shipping information"),
      ),
      body: Container(
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 50),
                Text(
                  "Welcome to \nArrange delivery",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  "Please fill in the form of product delivery.",
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                LoginForm(),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
