import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wastemanage/Models/car.dart';
import 'package:wastemanage/Models/driver.dart';
import 'package:wastemanage/Screens/driverscreen.dart';
import 'package:wastemanage/Screens/progress.dart';

class AdminScreen extends StatefulWidget {
  @override
  State<AdminScreen> createState() => _AdminScreenState();
}

class _AdminScreenState extends State<AdminScreen> {
   TextEditingController _dropdownController=TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    List<Car> cars = [
      Car(id: 1, driverName: 'Ahmed Ben Halima', startTime: '08:00 AM', true),
      Car(id: 2, driverName: 'Helmi Souiai', startTime: '09:30 AM', true),
      Car(id: 3, driverName: 'fahd ben salem', startTime: '11:00 AM', false),
    ];

    List<Driver> drivers = [
      Driver(id: 1, name: 'Ahmed Ben Halima', contact: '99258472'),
      Driver(id: 2, name: 'Helmi Souiai', contact: '98547123'),
      Driver(id: 3, name: 'fahd ben salem', contact: '98547124'),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Dashboard'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Cars Overview',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => Progress(
                              name: cars[index].driverName,
                              startdate: cars[index].startTime)),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: cars[index].isfinished ? Colors.green : Colors.red,
                    ),
                    child: ListTile(
                      title: Text('Car ID: ${cars[index].id}'),
                      subtitle: Text(
                          'Driver: ${cars[index].driverName}\nStart Time: ${cars[index].startTime}'),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Drivers Information',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: drivers.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    showDialog(
                        context: context,
                        builder: (_) => AlertDialog(
                          
                              actions: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                TextButton(onPressed: (){
                                  
                                  Navigator.pop(context);
                                }, child: Text('Cancel')),
                                SizedBox(width: 30,),
                                TextButton(onPressed: (
                                  
                                ){
                                  Navigator.push(context, 
                                  MaterialPageRoute(builder: (context) => 
                                  
                                  MapScreen(
                                    sector: _dropdownController.text == '1-13' ? 1 : _dropdownController.text == '14-26' ? 2 : 3
                                    
                                    )
                                  
                                  )
                                  
                                  );
                                }, child: Text('Assign')),
                              ], 
                              )],
                              content: Container(
                                height: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text('Assign a route to ${drivers[index].name}',
                                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(height: 20,),
                                    Container(
                                    child: DropdownMenu(
                                      controller: _dropdownController,
                                    width: 200,
                                        label: Text("Select a route"),
                                        dropdownMenuEntries: <DropdownMenuEntry<
                                            dynamic>>[
                                          DropdownMenuEntry(
                                              label: "1-13", value: 1),
                                          DropdownMenuEntry(
                                              label: "14-26", value: 2),
                                          DropdownMenuEntry(
                                              label: "27-39", value: 3),
                                        ]
                                        )
                                        ),
                                  ],
                                ),
                              ),
                            )
                            );
                  },
                  child: Container(
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 5,
                          blurRadius: 1,
                        ),
                      ],
                    ),
                    child: ListTile(
                      title: Text('Driver ID: ${drivers[index].id}'),
                      subtitle: Text(
                          'Name: ${drivers[index].name}\nContact: ${drivers[index].contact}'),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
