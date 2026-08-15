class Diffusion {
  final int numero;
  final DateTime date;

  Diffusion({
    required this.numero,
    required this.date,
  });

  // Format lisible : "2023-6-04"
  String get dateFormatee => '${date.year}-${date.month}-${date.day}';
}
