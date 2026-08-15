import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../models/emission.dart';
import 'identification_streaming.dart';

class PartieGrilleImage extends StatelessWidget {
  final List<Emission> emissions;
  final void Function(Emission) onTap;

  const PartieGrilleImage({
    super.key,
    required this.emissions,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveGridList(
      desiredItemWidth: 150,
      minSpacing: 10,
      children: emissions.map((emission) {
        return IdentificationStreaming(
          emission: emission,
          onTap: () => onTap(emission),
        );
      }).toList(),
    );
  }
}
