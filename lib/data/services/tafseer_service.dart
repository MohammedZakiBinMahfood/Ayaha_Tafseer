import 'dart:convert';

import 'package:ayaha_reason/data/models/tafseer_model.dart';
import 'package:http/http.dart' as http;

class TafseerService {
  static Future<TafseerModel> fetchTafseer({
    required int suraIndex,
    required int ayahNumber,
    required int tafseerId,
  }) async {
    final url =
        "http://api.quran-tafseer.com/tafseer/$tafseerId/$suraIndex/$ayahNumber";

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return TafseerModel.fromJson(jsonResponse);
    } else {
      throw Exception('فشل في تحميل التفسير');
    }
  }
}
