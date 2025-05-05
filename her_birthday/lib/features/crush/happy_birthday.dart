import 'dart:io';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'package:her_birthday/core/extensions/extensions.dart';
import 'package:her_birthday/core/token_storage/token_storage.dart';
import 'package:her_birthday/core/widgets/animation_widgets/birthday_animation.dart';
import 'package:her_birthday/di/di.dart';
import 'package:her_birthday/features/crush/meet_your_ai.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:her_birthday/features/dashboard/dashbord.dart'; // Add this line

class HappyBirthdayScreen extends StatefulWidget {
  final File imageFile;

  const HappyBirthdayScreen({super.key, required this.imageFile});

  @override
  State<HappyBirthdayScreen> createState() => _HappyBirthdayScreenState();
}

class _HappyBirthdayScreenState extends State<HappyBirthdayScreen> {
  late ConfettiController _confettiController;
  final AudioPlayer _audioPlayer = AudioPlayer(); // Add this line

  @override
  void initState() {
    super.initState();
    _confettiController =
        ConfettiController(duration: const Duration(seconds: 2));
    _confettiController.play(); // Start immediately
    _playBirthdaySong(); // Play the birthday song
  }

  Future<void> _playBirthdaySong() async {
    try {
      await _audioPlayer.play(AssetSource('images/birthday.mp3'));

      await getIt<TokenStorage>().saveBirthdaySetup('true');

      // await _audioPlayer.play(AssetSource('images/birthday.mp3'),
      //     position: const Duration(seconds: 100));
    } catch (e) {
      print("Error playing birthday song: $e");
    }
  }

  @override
  void dispose() {
    _confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.pink[50],
      body: Stack(
        alignment: Alignment.center,
        children: [
          //Background gradient
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFCE4EC), Color(0xFFF8BBD0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Confetti Animation
          ConfettiWidget(
            confettiController: _confettiController,
            blastDirectionality: BlastDirectionality.explosive,
            shouldLoop: true,
            numberOfParticles: 100,
            maxBlastForce: 15,
            minBlastForce: 8,
            gravity: 0.3,
            colors: const [
              Colors.pink,
              Colors.purple,
              Colors.orange,
              Colors.blue,
              Colors.yellow,
            ],
          ),

          // Main content
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  40.h,
                  // Image in a cute circle
                  CircleAvatar(
                    radius: 80,
                    backgroundImage: FileImage(widget.imageFile),
                  ),

                  14.h,
                  const Text(
                    "Happy Birthday Soumya 🎉",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(height: 14),
                  const BirthdayAnimation(),
                  const Text(
                    "Wishing you all the happiness, laughter, and love in the world 🎈",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                    ),
                  ),
                  25.h,
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(
                        builder: (context) {
                          return const DashboardScreen();
                        },
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurple,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                      elevation: 8,
                    ),
                    child: const Text(
                      "Take me to my gift 🎁 ",
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                  30.h,
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
