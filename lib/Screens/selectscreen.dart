import 'package:flutter/material.dart';
import 'package:wastemanage/Screens/adminaccount.dart';
import 'package:wastemanage/Screens/driverscreen.dart';


class Select extends StatelessWidget {
  const Select({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 100),
              child: Text('Select Account Type',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),),
            ),
            
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
              child: ElevatedButton(
                
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AdminScreen()),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Admin Account'),
                    Icon(Icons.admin_panel_settings)
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(80, 20, 80, 20),
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MapScreen(sector:1)),
                  );
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    
                  Text('Driver Account'),
                  Icon(Icons.drive_eta)
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}