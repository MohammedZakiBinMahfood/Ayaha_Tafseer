import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AyahaCard extends StatelessWidget {
  final String ayahText;
  final String suraName;
  final int ayahNumber;
  final VoidCallback onNextAyah;

  const AyahaCard({
    super.key,
    required this.ayahText,
    required this.suraName,
    required this.ayahNumber,
    required this.onNextAyah,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 350,
          padding: const EdgeInsets.all(24),
          margin: const EdgeInsets.only(top: 12, right: 12, left: 12),
          decoration: BoxDecoration(
            color: Color(0xFFF9F9F9),
            borderRadius: BorderRadius.circular(24),
            boxShadow: const [
              BoxShadow(
                color: Color(0x22000000),
                offset: Offset(0, 8),
                blurRadius: 20,
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              Text(
                ayahText,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 26,
                  fontFamily: 'Cairo',
                  height: 1.8,
                  color: Color(0xFF333333),
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'سورة $suraName - آية $ayahNumber',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Tajawal',
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF777777),
                ),
              ),
            ],
          ),
        ),

        Positioned(
          top: 4,
          right: 4,
          child: IconButton(
            icon: const Icon(Icons.copy, color: Color(0xFF888888)),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: ayahText));
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('✅ تم نسخ الآية'),
                  behavior: SnackBarBehavior.floating,
                  backgroundColor: Color(0xFF27AE60),
                  duration: Duration(seconds: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                  ),
                ),
              );
            },
          ),
        ),

        Positioned(
          top: 4,
          left: 4,
          child: IconButton(
            icon: const Icon(Icons.refresh, color: Color(0xFF888888)),
            onPressed: onNextAyah,
          ),
        ),
      ],
    );
  }
}
