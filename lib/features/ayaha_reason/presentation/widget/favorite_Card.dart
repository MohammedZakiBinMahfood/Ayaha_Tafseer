import 'package:ayaha_reason/cubit/favorite_cubit.dart';
import 'package:ayaha_reason/data/models/tafseer_model.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/pages/tafseer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../data/models/favorites_model.dart' show FavoriteModel;

class FavoriteCard extends StatelessWidget {
  final FavoriteModel model;
  final TafseerModel? modelTafseer;

  const FavoriteCard({super.key, required this.model, this.modelTafseer});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 4,
      color: Color(0xFFF9F9F9),
      shadowColor: Color(0xFFDDDDDD),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              model.text,
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF333333),
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 10),
            Text(
              'سورة ${model.suraName} - آية ${model.ayahNumber}',
              style: TextStyle(fontSize: 16, color: Color(0xFF777777)),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    context.read<FavoriteCubit>().removeFavorite(model.id!);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("❌ تم حذف الآية من المفضلة"),
                        backgroundColor: Color(0xFFEB5757),
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    );
                  },
                  icon: Icon(Icons.delete_outline, color: Colors.white),
                  label: Text("حذف", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFE74C3C),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (_) => TafseerScreen(
                              suraIndex: model.suraIndex,
                              ayahNumber: model.ayahNumber,
                              tafseerId: 1,
                            ),
                      ),
                    );
                  },
                  icon: Icon(Icons.menu_book, color: Colors.white),
                  label: Text(
                    "عرض التفسير",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF27AE60),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
