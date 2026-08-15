import 'package:flutter/material.dart';
import 'dart:math';

class AlbumStreaming extends StatelessWidget {
  final String tagStream;
  final String imageStream;
  final String nomStream;
  final String chaineRadio;

  const AlbumStreaming({
    super.key,
    required this.tagStream,
    required this.imageStream,
    required this.nomStream,
    required this.chaineRadio,
  });

  // Génère une liste de 5 diffusions avec des dates aléatoires
  List<Map<String, dynamic>> _genererDiffusions() {
    final random = Random();
    return List.generate(5, (index) {
      final annee = 2023;
      final mois = random.nextInt(12) + 1;
      final jour = random.nextInt(28) + 1;
      return {
        'numero': index + 1,
        'date': '$annee-$mois-$jour',
      };
    });
  }

  @override
  Widget build(BuildContext context) {
    final diffusions = _genererDiffusions();

    return Scaffold(
      body: Column(
        children: [
          // Image de fond avec bouton retour et coeur superposés
          Stack(
            children: [
              Hero(
                tag: tagStream,
                child: Image.asset(
                  imageStream,
                  height: 280,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              SafeArea(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () => Navigator.pop(context),
                      ),
                      IconButton(
                        icon: const Icon(Icons.favorite_border,
                            color: Colors.white),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Bandeau titre
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  nomStream,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  chaineRadio,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
          // Liste des diffusions
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 12),
              itemCount: diffusions.length,
              itemBuilder: (context, index) {
                final diffusion = diffusions[index];
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  child: Row(
                    children: [
                      Text('Diffusion ${diffusion['numero']} - '),
                      const Icon(Icons.volume_up,
                          size: 18, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text('Date: ${diffusion['date']}'),
                    ],
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
