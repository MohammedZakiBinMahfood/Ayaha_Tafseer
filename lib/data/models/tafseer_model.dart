class TafseerModel {
  final String tafseerName;
  final String text;

  TafseerModel({required this.tafseerName, required this.text});

  factory TafseerModel.fromJson(Map<String, dynamic> json) {
    return TafseerModel(tafseerName: json['tafseer_name'], text: json['text']);
  }
}
