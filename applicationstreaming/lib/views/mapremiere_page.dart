import 'package:flutter/material.dart';
import '../controllers/emission_controller.dart';
import '../models/emission.dart';
import 'partie_grille_image.dart';
import 'album_streaming.dart';

class MapremierePage extends StatefulWidget {
  final EmissionController controller;

  const MapremierePage({super.key, required this.controller});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  int _indexSelectionne = 0;

  void _naviguerVersDetail(Emission emission) {
    final emissionChoisie = widget.controller.onEmissionSelected(emission);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AlbumStreaming(emission: emissionChoisie),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        leading: const Icon(Icons.search),
        title: const Text('Vos émissions en streaming'),
        actions: const [
          Icon(Icons.list),
          SizedBox(width: 12),
        ],
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(height: 20),
            Expanded(
              child: PartieGrilleImage(
                emissions: widget.controller.getEmissions(),
                onTap: _naviguerVersDetail,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexSelectionne,
        onTap: (index) => setState(() => _indexSelectionne = index),
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Accueil'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Recherche'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profil'),
        ],
      ),
    );
  }
}
