import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'dart:math';

import 'package:wastemanage/Screens/Tablescreen.dart';



class TrashBin {
  final int id;
  final double latitude;
  final double longitude;

  TrashBin({required this.id, required this.latitude, required this.longitude});
}

class Route {
  final List<TrashBin> bins;

  Route(this.bins);

  double calculateTotalDistance() {
   if (bins.length < 2) {
    return 0.0;
  } else {
    return calculateDistance(bins[0], bins[1]) + Route(bins.sublist(1)).calculateTotalDistance();
  }
  }

  double calculateDistance(TrashBin bin1, TrashBin bin2) {
 double lat1Rad = bin1.latitude * pi / 180.0;
  double lon1Rad = bin1.longitude * pi / 180.0;
  double lat2Rad = bin2.latitude * pi / 180.0;
  double lon2Rad = bin2.longitude * pi / 180.0;

  double dLat = lat2Rad - lat1Rad;
  double dLon = lon2Rad - lon1Rad;

  double a = sin(dLat / 2) * sin(dLat / 2) +
      cos(lat1Rad) * cos(lat2Rad) * sin(dLon / 2) * sin(dLon / 2);
  double c = 2 * atan2(sqrt(a), sqrt(1 - a));

  double radius = 6371.0;

  return radius * c;  }
}

class GeneticAlgorithm {
  List<TrashBin> initialRoute;
  int populationSize;
  double crossoverRate;
  double mutationRate;

  GeneticAlgorithm({
    required this.initialRoute,
    required this.populationSize,
    required this.crossoverRate,
    required this.mutationRate,
  });

  List<Route> runGeneticAlgorithm(int generations) {
    List<Route> population = initializePopulation();
    for (int generation = 0; generation < generations; generation++) {
      population = evolvePopulation(population);
    }
    return population;
  }

  List<Route> initializePopulation() {
    return List.generate(populationSize, (_) {
      return Route(List.from(initialRoute));
    });
  }

  List<Route> evolvePopulation(List<Route> population) {
    List<Route> newPopulation = [];

    newPopulation.add(findBestRoute(population));

    while (newPopulation.length < populationSize) {
      Route parent1 = selectParent(population);
      Route parent2 = selectParent(population);

      Route offspring = crossover(parent1, parent2);

      mutate(offspring);

      newPopulation.add(offspring);
    }

    return newPopulation;
  }

  Route findBestRoute(List<Route> population) {
    return population.reduce((a, b) => a.calculateTotalDistance() < b.calculateTotalDistance() ? a : b);
  }

  Route selectParent(List<Route> population) {
    return population[Random().nextInt(populationSize)];
  }

  Route crossover(Route parent1, Route parent2) {
    Set<int> addedBins = Set<int>();
    List<TrashBin> newBins = List<TrashBin>.filled(parent1.bins.length, TrashBin(id: -1, latitude: 0, longitude: 0));

    
    int crossoverPoint = Random().nextInt(parent1.bins.length - 1);

    
    for (int i = 0; i <= crossoverPoint; i++) {
      newBins[i] = parent1.bins[i];
      addedBins.add(newBins[i].id);
    }

    
    for (int i = 0; i < parent2.bins.length; i++) {
      if (!addedBins.contains(parent2.bins[i].id)) {
       
        for (int j = 0; j < newBins.length; j++) {
          if (newBins[j].id == -1) {
            newBins[j] = parent2.bins[i];
            addedBins.add(newBins[j].id);
            break;
          }
        }
      }
    }

    return Route(newBins);
  }

  void mutate(Route route) {
    for (int i = 0; i < route.bins.length; i++) {
      if (Random().nextDouble() < mutationRate) {
        int randomIndex = Random().nextInt(route.bins.length);
        TrashBin temp = route.bins[i];
        route.bins[i] = route.bins[randomIndex];
        route.bins[randomIndex] = temp;
      }
    }
  }
}


class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  bool _optimize = false;
  late Route initialRoute;
  late Route bestRoute;

  @override
  void initState() {
    super.initState();
    initializeRoutes();
  }

  void initializeRoutes() {
  
List<TrashBin> trashBins = [
  TrashBin(id: 1, latitude: 35.633706, longitude: 10.888172),
  TrashBin(id: 2, latitude: 35.625245, longitude: 10.896547),
  TrashBin(id: 3, latitude: 35.620966, longitude: 10.901452),
  TrashBin(id: 4, latitude: 35.634484, longitude: 10.91222),
  TrashBin(id: 5, latitude: 35.639929, longitude: 10.90217),
  TrashBin(id: 6, latitude: 35.644693, longitude: 10.904563),
  TrashBin(id: 7, latitude: 35.628941, longitude: 10.907793),
  TrashBin(id: 8, latitude: 35.634386, longitude: 10.894513),
  TrashBin(id: 9, latitude: 35.635359, longitude: 10.90217),
  TrashBin(id: 10, latitude: 35.628357, longitude: 10.908272),
  TrashBin(id: 11, latitude: 35.625732, longitude: 10.895589),
  TrashBin(id: 12, latitude: 35.625148, longitude: 10.889368),
  TrashBin(id: 13, latitude: 35.629719, longitude: 10.895948),
  TrashBin(id: 14, latitude: 35.637206, longitude: 10.890205),
  TrashBin(id: 15, latitude: 35.636428, longitude: 10.884702),
  TrashBin(id: 16, latitude: 35.641193, longitude: 10.894273),
  TrashBin(id: 17, latitude: 35.643137, longitude: 10.899298),
  TrashBin(id: 18, latitude: 35.63847, longitude: 10.909588),
  TrashBin(id: 19, latitude: 35.631469, longitude: 10.904204),
  TrashBin(id: 20, latitude: 35.634484, longitude: 10.91222),
];









  GeneticAlgorithm geneticAlgorithm = GeneticAlgorithm(
    initialRoute: trashBins,
    populationSize: 70,
    crossoverRate: 0.8,
    mutationRate: 0.2,
  );

  int generations = 100;
  List<Route> finalPopulation = geneticAlgorithm.runGeneticAlgorithm(generations);

  initialRoute = Route(List.from(trashBins));
  bestRoute = finalPopulation.reduce((a, b) => a.calculateTotalDistance() < b.calculateTotalDistance() ? a : b);
  
  double initialDistance = initialRoute.calculateTotalDistance();
  double truckSpeed = 20; 
  double travelTimeBeforeOptimization = (initialDistance / truckSpeed); // in hours
  print('Time before optimization: $travelTimeBeforeOptimization hours');
}

var overlaycontroller = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: FlutterMap(
          options: MapOptions(
            initialCenter: LatLng(35.6324, 10.8960),
            initialZoom: 17,
          ),
          children: [
            TileLayer(
              urlTemplate: 'http://{s}.google.com/vt/lyrs=m&x={x}&y={y}&z={z}',
                      subdomains: ['mt0', 'mt1', 'mt2', 'mt3'],
            ),
            MarkerLayer(
              markers: _optimize
                  ? createMarkers(bestRoute.bins)
                  : createMarkers(initialRoute.bins),
            ),
            PolylineLayer(
              polylines: [
                Polyline(
                  points: _optimize
                      ? bestRoute.bins.map((bin) => LatLng(bin.latitude, bin.longitude)).toList()
                      : initialRoute.bins.map((bin) => LatLng(bin.latitude, bin.longitude)).toList(),
                  color: Colors.blue,
                  strokeWidth: 4.0,
                ),
              ],
            ),
           
            
          ],
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
          onPressed: () {
            print(initialRoute.calculateTotalDistance());
            print(bestRoute.calculateTotalDistance());
            setState(() {
              _optimize = !_optimize;
            });
          },
          child: Icon(Icons.refresh),
        ),
        SizedBox(width: 10.0),
        FloatingActionButton(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>RouteTableScreen(initialRoute: initialRoute.bins, optimizedRoute: bestRoute.bins,first_Distance: initialRoute.calculateTotalDistance(),second_Distance: bestRoute.calculateTotalDistance(),)));
          },
          child: Icon(Icons.edit),
        ),
          ],
        )
      
      ),
    );
  }
  List<Marker> createMarkers(List<TrashBin> bins) {
  return bins.asMap().entries.map((entry) {
    final int index = entry.key;
    final TrashBin bin = entry.value;

    return Marker(
      width: 40.0,
      height: 40.0,
      point: LatLng(bin.latitude, bin.longitude),
      
        child:Stack(
          children: [
            Icon(
              Icons.delete,
              color: index == 0 || index == bins.length - 1 ? Colors.blue : Colors.red,
            ),
            Positioned(
              top: 10.0,
              child: Text(
                bin.id.toString(),
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        )
      
    );
  }).toList();
}


}


