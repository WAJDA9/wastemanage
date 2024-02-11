

import 'package:wastemanage/Screens/homescreen.dart';
import 'package:wastemanage/widgets/button_widgeet.dart';

import '../widgets/input_field_widget.dart';
import 'package:email_validator/email_validator.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatefulWidget {
  Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(size.width * 0.05, 40, 0, 0),
        child: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor: Color.fromARGB(255, 244, 242, 242),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: size.height * 0.17),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Create a new account',
                style: GoogleFonts.arima(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
            TextFieldWidget(
                hintText: 'Username',
                obscureText: false,
                onchanged: (value) {}),
            TextFieldWidget(
                hintText: 'Email', obscureText: false, onchanged: (value) {}),
            TextFieldWidget(
                hintText: 'Password', obscureText: true, onchanged: (value) {}),
            TextFieldWidget(
                hintText: 'Confirm Password',
                obscureText: true,
                onchanged: (value) {}),
            TextFieldWidget(
                hintText: 'Phone Number',
                obscureText: false,
                onchanged: (value) {}),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              'Sign up',
              onClick: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
              },
            )
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            margin: EdgeInsets.only(bottom: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text('Already having an account?'),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Sign In',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ])),
      ),
    );
  }
}
