import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'dart:async';

import 'ayaha_display.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AudioPlayer _audioPlayer;

  @override
  void initState() {
    super.initState();
    _audioPlayer = AudioPlayer();
    _playQuranAudio();
    _navigateToHome();
  }

  Future<void> _playQuranAudio() async {
    await _audioPlayer.play(AssetSource('audio/quruan.m4a'));
  }

  Future<void> _navigateToHome() async {
    await Future.delayed(Duration(seconds: 15));
    Navigator.pushReplacement(
      // ignore: use_build_context_synchronously
      context,
      MaterialPageRoute(
        builder: (context) => const DisplayAyaha(suraIndex: 1, ayahNumber: 1),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'آية و تفسير',
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontFamily: 'Tajawal',
              ),
            ),
            SizedBox(height: 20),
            Image.asset('assets/image/images.jpg', width: 150, height: 150),
            SizedBox(height: 50),
            Text(
              'devlop by : Mohammed zaki',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white,
                fontFamily: 'Cairo',
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _audioPlayer.dispose();
    super.dispose();
  }
}
