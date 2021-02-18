import 'package:flutter/material.dart';
import 'package:flutter_lab_05_login_start/home.dart';
import 'package:flutter/services.dart';

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
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _redateController = TextEditingController();

  void login() {
    //Code for Login
    FocusScope.of(context).unfocus(); //หุบแป้น
    bool passValidate = _formKey.currentState.validate();
    errmsg = "";
    if (passValidate) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Home(
              _fnameController.text,
              _lnameController.text,
              _addressController.text,
              _postalController.text,
              _phoneController.text,
              _redateController.text),
        ),
      );
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
        labelText: "First Name",
        hintText: "Enter your First Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.account_circle,
          color: Colors.teal[700],
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
        labelText: "Last Name",
        hintText: "Enter your Last Name",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.account_circle,
          color: Colors.teal[700],
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
        labelText: "Address",
        hintText: "Enter your Address",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_on,
          color: Colors.teal[700],
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
      maxLength: 5,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Postal",
        hintText: "Enter your postal",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.location_on,
          color: Colors.teal[700],
          size: 20.0,
        ),
      ),
    );
  }

  TextFormField getPhonenumber() {
    return TextFormField(
      controller: _phoneController,
      validator: (String inputPhone) {
        if (inputPhone.isEmpty) {
          return "Please input Phone Number";
        } else {
          return null;
        }
      },
      maxLength: 10,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: "Phone Number",
        hintText: "Enter your Phone Number",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.stay_current_portrait,
          color: Colors.teal[700],
          size: 20.0,
        ),
      ),
    );
  }

  TextFormField getRecieveDate() {
    return TextFormField(
      controller: _redateController,
      validator: (String inputRdate) {
        if (inputRdate.isEmpty) {
          return "Please input RecieveDate";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.datetime,
      decoration: InputDecoration(
        labelText: "RecieveDate",
        hintText: "DD/MM/YY",
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Icon(
          Icons.insert_invitation,
          color: Colors.teal[700],
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
        color: Colors.teal,
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
            color: Colors.white,
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

            getPhonenumber(),
            SizedBox(height: 10),

            getRecieveDate(),
            SizedBox(height: 10),

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
