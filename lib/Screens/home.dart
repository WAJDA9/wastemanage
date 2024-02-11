import 'package:flutter/material.dart';
import 'package:another_flutter_splash_screen/another_flutter_splash_screen.dart';
import 'package:wastemanage/Screens/map.dart';
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    
    return FlutterSplashScreen.fadeIn(
      duration: Duration(seconds: 3),
          backgroundColor: Colors.white,
          childWidget: SizedBox(
            height: 200,
            width: 200,
            child: Image.asset("assets/Logo.png"),
          ),
          onAnimationEnd: () => debugPrint("On Fade In End"),
          nextScreen: const MapScreen(),
        );
  }
}