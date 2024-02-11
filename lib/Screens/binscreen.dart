import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wastemanage/Screens/driverscreen.dart';

class BinScreen extends StatefulWidget {
  final TrashBin bin;
  const BinScreen({Key? key, required this.bin}) : super(key: key);

  @override
  State<BinScreen> createState() => _BinScreenState();
}

class _BinScreenState extends State<BinScreen> {
  late double _fillPercentage;

  @override
  void initState() {
    super.initState();
    _fillPercentage = Random().nextDouble();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bin Details'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Bin ID: ${widget.bin.id}',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Location: ${widget.bin.latitude}/${widget.bin.longitude}', // Replace with actual location
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 20),
            Text(
              'Fill Level:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Container(
              width: double.infinity,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: FractionallySizedBox(
                widthFactor: _fillPercentage,
                alignment: Alignment.centerLeft,
                child: Container(
                  decoration: BoxDecoration(
                    color: _getFillLevelColor(_fillPercentage),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
            ),
            Text( '${(_fillPercentage * 100).toStringAsFixed(0)}%', style: TextStyle(fontSize: 16)),
          ],
        ),
      ),
    );
  }

  Color _getFillLevelColor(double fillPercentage) {
    if (fillPercentage < 0.3) {
      return Colors.green;
    } else if (fillPercentage < 0.7) {
      return Colors.yellow;
    } else {
      return Colors.red;
    }
  }
}
