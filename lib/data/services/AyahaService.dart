import 'dart:convert';

import 'package:ayaha_reason/data/models/ayaha_display_model.dart';
import 'package:http/http.dart' as http;

class AyahaService {
  static const String _baseUrl = 'http://api.quran-tafseer.com';

  static Future<AyahaDisplayModel> fetchAyahaData(
    int suraIndex,
    int ayahNumber,
  ) async {
    final response = await http.get(
      Uri.parse('$_baseUrl/quran/$suraIndex/$ayahNumber'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return AyahaDisplayModel.fromJson(data);
    } else {
      print('Error: ${response.statusCode}');
      throw Exception('❌ فشل في تحميل الآية');
    }
  }
}
