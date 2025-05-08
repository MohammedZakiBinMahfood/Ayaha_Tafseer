import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

class TafseerButtons extends StatelessWidget {
  final int suraIndex;
  final int ayahNumber;
  final String tafseerText;

  const TafseerButtons({
    super.key,
    required this.suraIndex,
    required this.ayahNumber,
    required this.tafseerText,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(102, 185, 116, 27),
            side: const BorderSide(color: Color.fromARGB(255, 0, 0, 0)),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
            ),
          ),
          onPressed: () {
            Clipboard.setData(ClipboardData(text: tafseerText));
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(const SnackBar(content: Text('✅ تم نسخ التفسير')));
          },
          icon: const Icon(Icons.copy, color: Colors.white),
          label: const Text(
            'نسخ تفسير الآية',
            style: TextStyle(color: Colors.white),
          ),
        ),
        const SizedBox(width: 20),
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(102, 185, 116, 27),
            side: const BorderSide(color: Color.fromARGB(235, 0, 0, 0)),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.elliptical(5, 5)),
            ),
          ),
          onPressed: () async {
            await SharePlus.instance.share(ShareParams(text: tafseerText));
          },
          icon: const Icon(Icons.share, color: Colors.white),
          label: const Text(
            'مشاركة تفسير الآية',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
