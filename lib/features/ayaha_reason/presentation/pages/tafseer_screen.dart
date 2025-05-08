import 'package:ayaha_reason/data/models/tafseer_model.dart';
import 'package:ayaha_reason/data/services/tafseer_service.dart';
import 'package:ayaha_reason/features/ayaha_reason/presentation/widget/tafseer_card.dart';
import 'package:flutter/material.dart';

class TafseerScreen extends StatelessWidget {
  final int suraIndex;
  final int ayahNumber;
  final int tafseerId;

  const TafseerScreen({
    super.key,
    required this.suraIndex,
    required this.ayahNumber,
    required this.tafseerId,
  });
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("📖 التفسير", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: BackButton(color: Colors.black),
      ),
      body: FutureBuilder<TafseerModel>(
        future: TafseerService.fetchTafseer(
          suraIndex: suraIndex,
          ayahNumber: ayahNumber,
          tafseerId: tafseerId,
        ),

        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError || !snapshot.hasData) {
            return const Center(
              child: Text(
                "❌ فشل في تحميل التفسير",
                style: TextStyle(color: Colors.red),
              ),
            );
          }

          final tafseer = snapshot.data!;

          return SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      "${tafseer.tafseerName} - آية $ayahNumber",
                      style: const TextStyle(
                        fontSize: 25,
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TafseerCard(tafseerText: tafseer.text, ayahText: ''),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
