import 'package:flutter/foundation.dart';
import '../models/emission.dart';

class EmissionController extends ChangeNotifier {
  final List<Emission> _emissions = [];

  List<Emission> getEmissions() => List.unmodifiable(_emissions);

  // Construit les données
  void loadEmissions() {
    _emissions.clear();
    _emissions.addAll([
      Emission(
        id: '1',
        tagStream: 'Documentaires',
        nom: 'Documentaires',
        chaineRadio: 'Radio 4',
        imagePath: 'assets/images/documentaires.jpg',
      ),
      Emission(
        id: '2',
        tagStream: 'Tendances Mode',
        nom: 'Tendances Mode',
        chaineRadio: 'Radio 3',
        imagePath: 'assets/images/mode.jpg',
      ),
      Emission(
        id: '3',
        tagStream: 'Enquetes Criminelles',
        nom: 'Enquêtes Criminelles',
        chaineRadio: 'Radio 2',
        imagePath: 'assets/images/enquetes.png',
      ),
      Emission(
        id: '4',
        tagStream: 'Match de Foot',
        nom: 'Match de Foot',
        chaineRadio: 'Radio 5',
        imagePath: 'assets/images/foot.jpg',
      ),
      Emission(
        id: '5',
        tagStream: 'Streaming Meteo',
        nom: 'Streaming Météo',
        chaineRadio: 'Radio 1',
        imagePath: 'assets/images/meteo.jpg',
      ),
      Emission(
        id: '6',
        tagStream: 'Que des news',
        nom: 'Que des news',
        chaineRadio: 'Radio 4',
        imagePath: 'assets/images/news.jpg',
      ),
    ]);
    notifyListeners();
  }

  // Prépare la sélection : ne navigue pas, retourne juste l'émission choisie
  Emission onEmissionSelected(Emission emission) {
    return emission;
  }
}
