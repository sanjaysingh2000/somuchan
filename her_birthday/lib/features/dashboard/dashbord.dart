import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/features/ai_chat/presentation/ai_chat.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_event.dart';
import 'package:her_birthday/features/auth/presentation/pages/login_page.dart';
import 'package:her_birthday/features/roast/presentation/roast_me_screen.dart';
import 'package:her_birthday/features/roast_comeback/presentation/roast_comeback.dart';

import '../ai_call/ai_calling_screen.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Stack(
        children: [
          // Gradient Background
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFCE4EC), Color(0xFFF8BBD0)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),

          // Content
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18.0),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  Row(
                    children: [
                      Text(
                        'Welcome!',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 32,
                          fontFamily: GoogleFonts.urbanist().fontFamily,
                        ),
                  ),
                      const Spacer(),
                      GestureDetector(
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              behavior: SnackBarBehavior.floating,
                              content: Text('Profile feature is coming soon!'),
                            ),
                          );
                        },
                        child: CircleAvatar(
                          radius: 26,
                          backgroundColor: Colors.pinkAccent.withOpacity(0.6),
                          child: const Icon(Icons.person, size: 30, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),

                  // Chat Option
                  _OptionButton(
                    text: 'Let’s Chat!',
                    icon: Icons.chat,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AiChatScreen(),
                          ));
                    },
                  ),

                  const SizedBox(height: 20),

                  _OptionButton(
                    text: 'Roast lines ',
                    icon: Icons.adjust,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RoastScreen(),
                          ));
                    },
                  ),

                  const SizedBox(height: 20),

                  _OptionButton(
                    text: 'Roast Comeback',
                    icon: Icons.adjust,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const RoastComebackScreen(),
                          ));
                    },
                  ),

                  const SizedBox(height: 20),

                  // Call Option
                  _OptionButton(
                    text: 'Let’s Call!',
                    icon: Icons.call,
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => const AiCall(),
                          ));
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(
                      //     behavior: SnackBarBehavior.floating,
                      //     content: Text('This feature is coming soon!'),
                      //   ),
                      // );
                    },
                  ),

                  const Spacer(),

                  // Logout Button
                  GestureDetector(
                    onTap: () {
                      context.read<AuthBloc>().add(LogoutEvent());
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                        (route) => false,
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.red),
                      ),
                      child: const Text(
                        'Logout',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OptionButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback onTap;

  const _OptionButton({
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(20),
      color: Colors.pinkAccent.withOpacity(0.6),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(vertical: 18, horizontal: 20),
          child: Row(
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 16),
              Expanded(
                child: Text(
                  text,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontFamily: GoogleFonts.urbanist().fontFamily,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const Icon(Icons.arrow_forward_ios,
                  color: Colors.white, size: 16),
            ],
          ),
        ),
      ),
    );
  }
}
