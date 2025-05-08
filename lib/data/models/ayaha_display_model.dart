class AyahaDisplayModel {
  final int suraIndex;
  final String suraName;
  final int ayahNumber;
  final String text;

  AyahaDisplayModel({
    required this.suraIndex,
    required this.suraName,
    required this.ayahNumber,
    required this.text,
  });

  factory AyahaDisplayModel.fromJson(Map<String, dynamic> json) {
    return AyahaDisplayModel(
      suraIndex: json['sura_index'] ?? 0,
      suraName: json['sura_name'] ?? '',
      ayahNumber: json['ayah_number'] ?? 0,
      text: json['text'] ?? '',
    );
  }
}
