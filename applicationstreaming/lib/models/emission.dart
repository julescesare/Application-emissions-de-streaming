import 'dart:math';
import 'diffusion.dart';

class Emission {
  final String id;
  final String tagStream;
  final String nom;
  final String chaineRadio;
  final String imagePath;

  Emission({
    required this.id,
    required this.tagStream,
    required this.nom,
    required this.chaineRadio,
    required this.imagePath,
  });

  // Logique métier : génère des diffusions aléatoires pour cette émission
  List<Diffusion> genererDiffusions({int nombre = 5}) {
    final random = Random();
    return List.generate(nombre, (index) {
      return Diffusion(
        numero: index + 1,
        date: DateTime(2023, random.nextInt(12) + 1, random.nextInt(28) + 1),
      );
    });
  }
}
