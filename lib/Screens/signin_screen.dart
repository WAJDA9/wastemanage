

import 'package:email_validator/email_validator.dart';
import 'package:wastemanage/Screens/home.dart';
import 'package:wastemanage/Screens/resetpassword.dart';
import 'package:wastemanage/Screens/selectscreen.dart';

import 'package:wastemanage/widgets/button_widgeet.dart';

import '../widgets/input_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Signin extends StatefulWidget {
   Signin({Key? key}) : super(key: key);

  @override
  State<Signin> createState() => _SigninState();
}

class _SigninState extends State<Signin> {
 


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor:  Color.fromARGB(255, 244, 242, 242),
      body: SingleChildScrollView(
          child: Container(
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset("assets/Logo.png",
            height: 230,
            width: 230,
            ),
            Text('Log in to your account',
                style: GoogleFonts.arima(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
            TextFieldWidget(
                hintText: 'Email', obscureText: false, onchanged: (value) {}),
            TextFieldWidget(
             
                hintText: 'Password', obscureText: true, onchanged: (value) {}),
            SizedBox(
              height: size.height * 0.02,
            ),
            Button(
              'Sign in',
              onClick: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Home()));
                
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center, 
            children: [
               Text('Forgot Your Password?'),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ResetCoddeScreen()));
                },
                child:  Text(
                  'Reset It',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
              )
            ])
          ],
        ),
      )),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent,
        elevation: 0,
        child: Container(
            margin:  EdgeInsets.only(bottom: 10),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                   Text('Don\'t have an account?'),
                  GestureDetector(
                    onTap: () {
                      
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>Select()));
                    },
                    child:  Text(
                      'Sign Up',
                      style: TextStyle(decoration: TextDecoration.underline),
                    ),
                  )
                ])),
      ),
    );
  }
}
