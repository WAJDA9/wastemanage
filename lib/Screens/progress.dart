import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class Progress extends StatefulWidget {
  final String name;
  final String startdate;
  const Progress({super.key, required this.name, required this.startdate});

  @override
  State<Progress> createState() => _ProgressState();
}

class _ProgressState extends State<Progress> with SingleTickerProviderStateMixin {
  var _overlaycontroller=OverlayPortalController();
  late AnimationController _animationController;
  List<LatLng> routePoints = [
    LatLng(35.6324, 10.8960),
    LatLng(35.6328, 10.8975),
    LatLng(35.6317, 10.8953),
    LatLng(35.6332, 10.8995),
    LatLng(35.6341, 10.8968),
    LatLng(35.6335, 10.8952),
  
  ];
  int currentPointIndex = 0;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 17), // Adjust the duration as needed
    )..addListener(() {
        setState(() {});
      });

    _animationController.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    LatLng currentLocation = interpolateLocation();

    return Scaffold(
      body: FlutterMap(
        options: MapOptions(
          center: currentLocation,
          zoom: 17,
        ),
        children: [
          TileLayer(
            urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
            subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
          ),
          MarkerLayer(
            markers: [
              Marker(
                width: 40.0,
                height: 40.0,
                point: currentLocation,
               
                  child: Image.asset('assets/truck.png'),
                
              ),
            ],
          ),
          PolylineLayer(
            polylines: [
              Polyline(
                points: routePoints,
                color: ThemeData().primaryColor,
                strokeWidth: 3.0,
              ),
            ],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        _overlaycontroller.toggle();
      },
      child:  OverlayPortal(
        overlayChildBuilder:(BuildContext context) {
          return Positioned(
            bottom:100,
            left:100,

            child: Container(
              
             decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white
              ),
              padding: EdgeInsets.all(10),
              child: Row(
                children: [
                  Image.asset('assets/man.png',
                  width: 100,
                  height: 100,
                  ),
                  Column(
                    children: [
                      Text('Name:  ${widget.name}'),
                      Text('Start Time:  ${widget.startdate}'),
                      Text('End Time: 13:30 AM')
                    ],
                  )
                ],
              )
            ),
          );
        },
        controller: _overlaycontroller,
         child: Icon(Icons.account_box_outlined)),
      )
      
    );
  }

  LatLng interpolateLocation() {
    double progress = _animationController.value;
    int nextPointIndex = (currentPointIndex + 1) % routePoints.length;
    LatLng currentPoint = routePoints[currentPointIndex];
    LatLng nextPoint = routePoints[nextPointIndex];

    double lat = lerpDouble(currentPoint.latitude, nextPoint.latitude, progress) ?? 0.0;
    double lng = lerpDouble(currentPoint.longitude, nextPoint.longitude, progress) ?? 0.0;

    if (progress == 1.0) {
      currentPointIndex = nextPointIndex;
      _animationController.reset();
      _animationController.forward();
    }

    return LatLng(lat, lng);
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
