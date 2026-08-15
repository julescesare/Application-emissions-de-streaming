import 'package:flutter/material.dart';
import 'controllers/emission_controller.dart';
import 'views/mapremiere_page.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Émissions en streaming - MVC',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: MapremierePage(controller: EmissionController()..loadEmissions()),
    );
  }
}
