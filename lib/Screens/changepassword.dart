

import 'package:wastemanage/Screens/homescreen.dart';
import 'package:wastemanage/widgets/button_widgeet.dart';

import '../widgets/input_field_widget.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChangePass extends StatefulWidget {
   ChangePass({Key? key}) : super(key: key);

  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final TextEditingController decoy = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      floatingActionButton: Container(
        margin: EdgeInsets.fromLTRB(size.width * 0.05, 40, 0, 0),
        child: IconButton(
          icon:  Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startTop,
      backgroundColor:  Color.fromARGB(255, 244, 242, 242),
      body: SingleChildScrollView(
          child: Container(
        padding: EdgeInsets.only(top: size.height * 0.17),
        margin: EdgeInsets.symmetric(horizontal: size.width * 0.2),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Change Password',
                style: GoogleFonts.arima(
                    color: Colors.black,
                    fontSize: 19,
                    fontWeight: FontWeight.bold)),
           
            TextFieldWidget(
              controller: decoy,
                hintText: 'Password', obscureText: true, onchanged: (value) {}),
            TextFieldWidget(
              controller: decoy,
                hintText: 'Confirm Password',
                obscureText: true,
                onchanged: (value) {}),
            
            SizedBox(
              height: size.height * 0.02,
            ),
              Button('Confirm', onClick: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>  Home()),
                  );
              },)
          ],
        ),
      )),
      
    );
  }
}
