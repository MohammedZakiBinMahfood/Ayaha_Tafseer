// remote_data_source.dart
import 'package:ayaha_reason/data/models/ayaha_display_model.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/pages/ayaha_display.dart';
import 'package:dio/dio.dart';

class RemoteDataSource {
  final Dio dio;

  RemoteDataSource(this.dio);

  //  Future<DisplayAyaha> getRandomVerse() async {
  //    final response = await dio.get("https://api.quran.com/v4/verses/random");
  //    return AyahaDisplayModel.fromJson(response.data['verse']);
  //  }
}
