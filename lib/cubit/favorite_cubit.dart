import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ayaha_reason/data/models/favorites_model.dart';
import 'package:ayaha_reason/data/data%20Source/database_helper.dart';

class FavoriteCubit extends Cubit<List<FavoriteModel>> {
  FavoriteCubit() : super([]);

  Future<void> loadFavorites() async {
    final favorites = await DatabaseHelper.getFavorites();
    emit(favorites);
  }

  // إضافة مفضلة
  Future<void> addFavorite(FavoriteModel model) async {
    await DatabaseHelper.insertFavorite(model);
    loadFavorites();
  }

  // إزالة مفضلة
  Future<void> removeFavorite(int id) async {
    await DatabaseHelper.deleteFavorite(id);
    loadFavorites();
  }
}
