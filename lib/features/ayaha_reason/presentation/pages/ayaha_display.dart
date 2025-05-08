import 'dart:math';

import 'package:ayaha_reason/cubit/favorite_cubit.dart';
import 'package:ayaha_reason/data/models/ayaha_display_model.dart';
import 'package:ayaha_reason/data/services/AyahaService.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/pages/favorites_screen.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/pages/tafseer_screen.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/widget/ayaha_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_plus/share_plus.dart';

import '../../../../data/models/favorites_model.dart' show FavoriteModel;

class DisplayAyaha extends StatefulWidget {
  final int suraIndex;
  final int ayahNumber;

  const DisplayAyaha({
    super.key,
    required this.suraIndex,
    required this.ayahNumber,
  });

  @override
  _DisplayAyahaState createState() => _DisplayAyahaState();
}

class _DisplayAyahaState extends State<DisplayAyaha> {
  late int currentSuraIndex = widget.suraIndex;
  late int currentAyahNumber = widget.ayahNumber;

  final Map<int, int> maxAyahsInSura = {
    1: 7,
    2: 286,
    3: 200,
    4: 176,
    5: 120,
    6: 165,
    7: 206,
    8: 75,
    9: 129,
    10: 109,
    11: 123,
    12: 111,
    13: 43,
    14: 52,
    15: 99,
    16: 128,
    17: 111,
    18: 110,
    19: 98,
    20: 135,
    21: 112,
    22: 78,
    23: 118,
    24: 64,
    25: 77,
    26: 227,
    27: 93,
    28: 88,
    29: 69,
    30: 60,
    31: 34,
    32: 30,
    33: 73,
    34: 54,
    35: 45,
    36: 83,
    37: 182,
    38: 88,
    39: 75,
    40: 85,
    41: 54,
    42: 53,
    43: 89,
    44: 59,
    45: 37,
    46: 35,
    47: 38,
    48: 29,
    49: 18,
    50: 45,
    51: 60,
    52: 49,
    53: 62,
    54: 55,
    55: 78,
    56: 96,
    57: 29,
    58: 22,
    59: 24,
    60: 13,
    61: 14,
    62: 11,
    63: 11,
    64: 18,
    65: 12,
    66: 12,
    67: 30,
    68: 52,
    69: 52,
    70: 44,
    71: 28,
    72: 28,
    73: 20,
    74: 56,
    75: 40,
    76: 31,
    77: 50,
    78: 40,
    79: 46,
    80: 42,
    81: 29,
    82: 19,
    83: 36,
    84: 25,
    85: 22,
    86: 17,
    87: 19,
    88: 26,
    89: 30,
    90: 20,
    91: 15,
    92: 21,
    93: 11,
    94: 8,
    95: 8,
    96: 19,
    97: 5,
    98: 8,
    99: 8,
    100: 11,
    101: 11,
    102: 8,
    103: 3,
    104: 9,
    105: 5,
    106: 4,
    107: 7,
    108: 3,
    109: 6,
    110: 3,
    111: 5,
    112: 4,
    113: 5,
    114: 6,
  };

  @override
  void initState() {
    super.initState();

    currentSuraIndex = widget.suraIndex;
    currentAyahNumber = widget.ayahNumber;

    if (currentSuraIndex == 0 || currentAyahNumber == 0) {
      _getRandomAyah(); // جلب آية عشوائية عند الضرورة
    }
  }

  void _getRandomAyah() {
    final suraKeys = maxAyahsInSura.keys.toList();

    final randomSuraIndex = suraKeys[Random().nextInt(suraKeys.length)];

    final maxAyah = maxAyahsInSura[randomSuraIndex]!;

    final randomAyahNumber = Random().nextInt(maxAyah) + 1;

    debugPrint(
      'Selected random SuraIndex: $randomSuraIndex, AyahNumber: $randomAyahNumber',
    );

    setState(() {
      currentSuraIndex = randomSuraIndex;
      currentAyahNumber = randomAyahNumber;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text('آية وسبب', style: TextStyle(color: Colors.white)),
        actions: [
          ElevatedButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
              ),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => FavoritesScreen(
                        suraIndex: currentSuraIndex,
                        ayahNumber: currentAyahNumber,
                      ),
                ),
              );
            },
            icon: Icon(Icons.star, color: Colors.white),
            label: Text('المفضلة', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
      body: FutureBuilder<AyahaDisplayModel>(
        future: AyahaService.fetchAyahaData(
          currentSuraIndex,
          currentAyahNumber,
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('❌ فشل في تحميل البيانات'));
          }
          final ayaha = snapshot.data!;

          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SizedBox(height: 100),
                Text(
                  'الآيه الكريمة',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                AyahaCard(
                  ayahText:
                      ayaha.text.isNotEmpty
                          ? ayaha.text
                          : 'بسم الله الرحمن الرحيم',
                  suraName:
                      ayaha.suraName.isNotEmpty ? ayaha.suraName : 'الفاتحة',
                  ayahNumber: ayaha.ayahNumber > 0 ? ayaha.ayahNumber : 1,
                  onNextAyah: _getRandomAyah,
                ),

                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.orangeAccent,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        shadowColor: Colors.orangeAccent.withOpacity(0.5),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => TafseerScreen(
                                  suraIndex: ayaha.suraIndex,
                                  ayahNumber: ayaha.ayahNumber,
                                  tafseerId: 1, // أو أي معرف تفسير تريده
                                ),
                          ),
                        );
                      },
                      icon: const Icon(Icons.menu_book, color: Colors.white),
                      label: const Text(
                        'عرض التفسير',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.teal,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 12,
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5,
                        shadowColor: Colors.teal.withOpacity(0.5),
                      ),
                      onPressed: () {
                        final favoriteModel = FavoriteModel(
                          suraIndex: ayaha.suraIndex,
                          suraName: ayaha.suraName,
                          ayahNumber: ayaha.ayahNumber,
                          text: ayaha.text,
                        );
                        context.read<FavoriteCubit>().addFavorite(
                          favoriteModel,
                        );
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('✅ تم إضافة الآية إلى المفضلة'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      },
                      icon: const Icon(Icons.star, color: Colors.white),
                      label: const Text(
                        'اضافة للمفضلة',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigoAccent,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 40,
                      vertical: 12,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                    shadowColor: Colors.indigoAccent.withOpacity(0.5),
                  ),
                  onPressed: () {
                    final shareText =
                        "سورة ${ayaha.suraName} - آية ${ayaha.ayahNumber}: ${ayaha.text}\n\nDeveloped by Mohammed Zaki";
                    Share.share(shareText);
                  },
                  icon: const Icon(Icons.share, color: Colors.white),
                  label: const Text(
                    'مشاركة الآية',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
