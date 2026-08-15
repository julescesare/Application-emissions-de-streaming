import 'package:flutter/material.dart';
import '../models/emission.dart';

class AlbumStreaming extends StatelessWidget {
  final Emission emission;

  const AlbumStreaming({super.key, required this.emission});

  @override
  Widget build(BuildContext context) {
    final diffusions = emission.genererDiffusions();

    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Hero(
                tag: emission.tagStream,
                child: Image.asset(
                  emission.imagePath,
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
          Container(
            width: double.infinity,
            color: Colors.deepPurple,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  emission.nom,
                  style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  emission.chaineRadio,
                  style: const TextStyle(color: Colors.white70, fontSize: 13),
                ),
              ],
            ),
          ),
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
                      Text('Diffusion ${diffusion.numero} - '),
                      const Icon(Icons.volume_up,
                          size: 18, color: Colors.deepPurple),
                      const SizedBox(width: 8),
                      Text('Date: ${diffusion.dateFormatee}'),
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
