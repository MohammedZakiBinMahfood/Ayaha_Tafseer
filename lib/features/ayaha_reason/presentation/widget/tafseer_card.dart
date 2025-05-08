import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TafseerCard extends StatelessWidget {
  final String? tafseerText;
  final String ayahText;

  const TafseerCard({super.key, this.tafseerText, required this.ayahText});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.green[50],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0, 4),
                blurRadius: 8,
              ),
            ],
          ),
          child: Text(
            tafseerText!,
            style: const TextStyle(
              fontSize: 20,
              fontFamily: 'Cairo',
              height: 1.8,
              color: Colors.black87,
            ),
            textAlign: TextAlign.justify,
          ),
        ),
        Positioned(
          top: 0,
          right: 0,
          child: IconButton(
            icon: const Icon(Icons.copy, color: Colors.grey),
            onPressed: () {
              Clipboard.setData(ClipboardData(text: ayahText));
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(const SnackBar(content: Text('✅ تم نسخ التفسير')));
            },
          ),
        ),
      ],
    );
  }
}
