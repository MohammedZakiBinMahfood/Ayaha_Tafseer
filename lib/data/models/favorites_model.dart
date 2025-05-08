class FavoriteModel {
  int? id;
  final int suraIndex;
  final String suraName;
  final int ayahNumber;
  final String text;

  FavoriteModel({
    this.id,
    required this.suraIndex,
    required this.suraName,
    required this.ayahNumber,
    required this.text,
  });

  factory FavoriteModel.fromJson(Map<String, dynamic> json) {
    return FavoriteModel(
      id: json['id'],
      suraIndex: json['sura_index'],
      suraName: json['sura_name'],
      ayahNumber: json['ayah_number'],
      text: json['text'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'sura_index': suraIndex,
      'sura_name': suraName,
      'ayah_number': ayahNumber,
      'text': text,
    };
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'sura_index': suraIndex,
      'sura_name': suraName,
      'ayah_number': ayahNumber,
      'text': text,
    };
  }

  factory FavoriteModel.fromMap(Map<String, dynamic> map) {
    return FavoriteModel(
      id: map['id'],
      suraIndex: map['sura_index'],
      suraName: map['sura_name'],
      ayahNumber: map['ayah_number'],
      text: map['text'],
    );
  }
}
