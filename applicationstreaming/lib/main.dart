import 'package:flutter/material.dart';
import 'partie_grille_image.dart';

void main() {
  runApp(const MonApplication());
}

class MonApplication extends StatelessWidget {
  const MonApplication({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Émissions en streaming',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.amber),
      home: const MapremierePage(),
    );
  }
}

class MapremierePage extends StatefulWidget {
  const MapremierePage({super.key});

  @override
  State<MapremierePage> createState() => _MapremierePageState();
}

class _MapremierePageState extends State<MapremierePage> {
  int _indexSelectionne = 0;

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
      body: Column(
        children: const [
          SizedBox(height: 20),
          Expanded(child: PartieGrilleImage()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _indexSelectionne,
        onTap: (index) {
          setState(() {
            _indexSelectionne = index;
          });
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Recherche',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profil',
          ),
        ],
      ),
    );
  }
}
