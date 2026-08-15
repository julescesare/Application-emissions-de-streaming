import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'identification_streaming.dart';

class PartieGrilleImage extends StatelessWidget {
  const PartieGrilleImage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      children: [
        IdentificationStreaming(
          tagStream: 'Documentaires',
          imageStream: 'assets/images/documentaires.jpg',
          nomStream: 'Documentaires',
          chaineRadio: 'Radio 4',
        ),
        IdentificationStreaming(
          tagStream: 'Tendances Mode',
          imageStream: 'assets/images/mode.jpg',
          nomStream: 'Tendances Mode',
          chaineRadio: 'Radio 3',
        ),
        IdentificationStreaming(
          tagStream: 'Enquetes Criminelles',
          imageStream: 'assets/images/enquetes.png',
          nomStream: 'Enquêtes Criminelles',
          chaineRadio: 'Radio 2',
        ),
        IdentificationStreaming(
          tagStream: 'Match de Foot',
          imageStream: 'assets/images/foot.jpg',
          nomStream: 'Match de Foot',
          chaineRadio: 'Radio 5',
        ),
        IdentificationStreaming(
          tagStream: 'Streaming Meteo',
          imageStream: 'assets/images/meteo.jpg',
          nomStream: 'Streaming Météo',
          chaineRadio: 'Radio 1',
        ),
        IdentificationStreaming(
          tagStream: 'Que des news',
          imageStream: 'assets/images/news.jpg',
          nomStream: 'Que des news',
          chaineRadio: 'Radio 4',
        ),
      ],
    );
  }
}
