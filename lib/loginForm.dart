import 'package:flutter/material.dart';
import 'package:flutter_lab_05_login_start/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String errmsg = "";
  final _formKey = GlobalKey<FormState>();

  TextEditingController _fnameController = TextEditingController();
  TextEditingController _lnameController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _postalController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void login() {
    //Code for Login
    FocusScope.of(context).unfocus(); //หุบแป้น
    bool passValidate = _formKey.currentState.validate();
    errmsg = "";
    if (passValidate) {
      if (_passwordController.text == 'x') {
        // confirmOr();
        //_fnameController.dispose();
        //_passwordController.dispose();
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Home(_fnameController.text,
                _lnameController.text, _addressController.text),
          ),
        );
      }
    } else {
      errmsg = "Please fill out all information!!";
    }
  }

  // void confirmOr() async {
  //   final SharedPreferences prefs = await SharedPreferences.getInstance();
  //   prefs.setString("First Name", _fnameController.text);
  //   prefs.setString("password", _passwordController.text);
  // }

  TextFormField getFname() {
    return TextFormField(
      controller: _fnameController,
      validator: (String inputFname) {
        if (inputFname.isEmpty) {
          return "Please input First Name";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "First Name *",
        hintText: "Enter your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.account_circle,
          color: Colors.grey[700],
          size: 20.0,
        ),
      ),
    );
  }

  TextFormField getLname() {
    return TextFormField(
      controller: _lnameController,
      validator: (String inputLname) {
        if (inputLname.isEmpty) {
          return "Please input Last Name";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.name,
      decoration: InputDecoration(
        labelText: "Last Name *",
        hintText: "Enter your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.account_circle,
          color: Colors.grey[700],
          size: 20.0,
        ),
      ),
    );
  }

  TextFormField getAdr() {
    return TextFormField(
      controller: _addressController,
      validator: (String inputAdr) {
        if (inputAdr.isEmpty) {
          return "Please input Address";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.streetAddress,
      decoration: InputDecoration(
        labelText: "Address *",
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_on,
          color: Colors.grey[700],
          size: 20.0,
        ),
      ),
    );
  }

  TextFormField getPost() {
    return TextFormField(
      controller: _postalController,
      validator: (String inputPost) {
        if (inputPost.isEmpty) {
          return "Please input postal";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Postal *",
        hintText: "Enter your postal",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_on,
          color: Colors.grey[700],
          size: 20.0,
        ),
      ),
    );
  }

  TextFormField getPass() {
    return TextFormField(
      controller: _passwordController,
      validator: (String inputPassword) {
        if (inputPassword.isEmpty) {
          return "Please input Password";
        } else {
          return null;
        }
      },
      obscureText: true,
      decoration: InputDecoration(
        labelText: "Password",
        hintText: "Enter your password",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.lock,
          color: Colors.grey[700],
          size: 20.0,
        ),
      ),
    );
  }

  SizedBox getLoginBt() {
    return SizedBox(
      width: 200,
      height: 50,
      child: RaisedButton(
        color: Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0),
          side: BorderSide(color: Colors.white),
        ),
        child: Text(
          "Confirm",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        onPressed: login,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Container(
        padding: EdgeInsets.all(10),
        width: double.infinity,
        child: Column(
          children: [
            //---Email---
            getFname(),
            SizedBox(height: 10),

            getLname(),
            SizedBox(height: 10),

            getAdr(),
            SizedBox(height: 10),

            getPost(),
            SizedBox(height: 10),

            //---Password---
            getPass(),
            SizedBox(height: 20),
            //Raised Button
            getLoginBt(),
            SizedBox(height: 15),
            Container(
              child: Text(
                errmsg, //Code for Show error message
                textAlign: TextAlign.start,
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  //Function to store user detail

  //Function Return email textfield

  //Function Return password textfield

}
