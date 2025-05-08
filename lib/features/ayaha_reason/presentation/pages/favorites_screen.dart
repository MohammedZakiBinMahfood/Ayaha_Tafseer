import 'package:ayaha_reason/cubit/favorite_cubit.dart';
import 'package:ayaha_reason/data/models/favorites_model.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/pages/ayaha_display.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/widget/favorite_Card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoritesScreen extends StatelessWidget {
  final int suraIndex;
  final int ayahNumber;
  const FavoritesScreen({
    super.key,
    required this.suraIndex,
    required this.ayahNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('آية وسبب', style: TextStyle(color: Colors.white)),
        actions: [
          ElevatedButton.icon(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (builder) {
                    return DisplayAyaha(
                      suraIndex: suraIndex,
                      ayahNumber: ayahNumber,
                    );
                  },
                ),
              );
            },
            icon: Icon(Icons.back_hand_outlined),
            label: Text('العودة للآية'),
          ),
        ],
      ),
      body: BlocBuilder<FavoriteCubit, List<FavoriteModel>>(
        builder: (context, favorites) {
          return ListView.builder(
            itemCount: favorites.length,
            itemBuilder: (context, index) {
              return FavoriteCard(model: favorites[index]);
            },
          );
        },
      ),
    );
  }
}
