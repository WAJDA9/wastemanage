import 'package:flutter/material.dart';


class RouteTableScreen extends StatelessWidget {
  final List initialRoute;
  final List optimizedRoute;
  double first_Distance = 0.0;
  double second_Distance = 0.0;

  RouteTableScreen({required this.initialRoute, required this.optimizedRoute,required this.first_Distance,required this.second_Distance});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Route Table'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              DataTable(
                columns: [
                  DataColumn(label: Text(
                    'Route Before Optimization')),
                  DataColumn(label: Text(
                    'Route After Optimization')),
                ],
                rows: List.generate(
                  initialRoute.length,
                  (index) => DataRow(
                    cells: [
                      DataCell(Text(initialRoute[index].id.toString())),
                      DataCell(Text(optimizedRoute[index].id.toString())),
                    ],
                  ),
                ),
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text(
                    'Distance Before Optimization')),
                  DataColumn(label: Text(
                    'Distance After Optimization')),
                ], 
                rows: [
                  DataRow(cells: [
                    DataCell(Text(first_Distance.toString())),
                    DataCell(Text(second_Distance.toString())),
                  ])
                ]
              ),
              DataTable(
                columns: [
                  DataColumn(label: Text(
                    overflow: TextOverflow.ellipsis,
                    'Time Before Optimization')),
                  DataColumn(label: Text(
                    overflow: TextOverflow.ellipsis,
                    'Time After Optimization')),
                ],
                rows: [
                  DataRow(cells: [
                    DataCell(Text((first_Distance / 6).toString())),
                    DataCell(Text((second_Distance / 6).toString())),
                  ])
                ]
              ),
            ],
          ),
        ),
      ),
    );
  }
}
