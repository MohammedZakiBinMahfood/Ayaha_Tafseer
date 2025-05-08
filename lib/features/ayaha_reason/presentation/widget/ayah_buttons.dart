import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class AyahButtons extends StatelessWidget {
  final String suraName;
  final int ayahNumber;
  final String ayahText;

  const AyahButtons({
    super.key,
    required this.suraName,
    required this.ayahNumber,
    required this.ayahText,
  });

  void _shareAyah() {
    final message =
        "﴿$ayahText﴾\nسورة $suraName - آية $ayahNumber\nDeveloped by Mohammed Zaki";
    Share.share(message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(102, 185, 116, 27),
              ),
              onPressed: () {},
              icon: Icon(Icons.book, color: Colors.white),
              label: Text('عرض التفسير', style: TextStyle(color: Colors.white)),
            ),
            SizedBox(width: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(102, 80, 181, 18),
              ),
              onPressed: () {},
              icon: Icon(Icons.star, color: Colors.white),
              label: Text(
                'اضافة للمفضلة',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        SizedBox(height: 20),
        Center(
          child: ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color.fromARGB(102, 80, 181, 18),
            ),
            onPressed: _shareAyah,
            icon: Icon(Icons.share, color: Colors.white),
            label: Text('مشاركة الآية', style: TextStyle(color: Colors.white)),
          ),
        ),
      ],
    );
  }
}
