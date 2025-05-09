import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:ayaha_reason/data/models/favorites_model.dart';

class DatabaseHelper {
  static Database? _db;

  static Future<Database> getDatabase() async {
    if (_db != null) return _db!;

    final path = join(await getDatabasesPath(), 'favorites.db');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        return db.execute('''
          CREATE TABLE favorites (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            sura_index INTEGER,
            sura_name TEXT,
            ayah_number INTEGER,
            text TEXT
          )
        ''');
      },
    );

    return _db!;
  }

  static Future<void> insertFavorite(FavoriteModel model) async {
    final db = await getDatabase();
    await db.insert(
      'favorites',
      model.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  static Future<List<FavoriteModel>> getFavorites() async {
    final db = await getDatabase();
    final List<Map<String, dynamic>> maps = await db.query('favorites');

    return maps.map((map) => FavoriteModel.fromJson(map)).toList();
  }

  static Future<void> deleteFavorite(int id) async {
    final db = await getDatabase();
    await db.delete('favorites', where: 'id = ?', whereArgs: [id]);
  }
}
