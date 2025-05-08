import 'package:ayaha_reason/data/models/favorites_model.dart';
import 'package:ayaha_reason/data/services/database_helper.dart';

class FavoriteService {
  static Future<void> addToFavorites(FavoriteModel model) async {
    final db = await DatabaseHelper.getDatabase();
    await db.insert('favorites', model.toMap());
  }

  static Future<void> deleteFavorite(int id) async {
    final db = await DatabaseHelper.getDatabase();
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }

  static Future<List<FavoriteModel>> getFavorites() async {
    final db = await DatabaseHelper.getDatabase();
    final maps = await db.query('favorites', orderBy: 'id DESC');

    return maps.map((map) => FavoriteModel.fromMap(map)).toList();
  }
}
