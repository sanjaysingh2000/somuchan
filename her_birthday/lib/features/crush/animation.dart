import 'package:flutter/material.dart';
import 'package:her_birthday/features/dashboard/dashbord.dart';

class GiftBoxAnimation extends StatefulWidget {
  const GiftBoxAnimation({super.key});

  @override
  State<GiftBoxAnimation> createState() => _GiftBoxAnimationState();
}

class _GiftBoxAnimationState extends State<GiftBoxAnimation>
    with TickerProviderStateMixin {
  late AnimationController _jumpController;
  late Animation<Offset> _jumpAnimation;
  bool _isOpened = false;

  @override
  void initState() {
    super.initState();
    _jumpController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    )..repeat(reverse: true);

    _jumpAnimation = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -0.1),
    ).animate(CurvedAnimation(
      parent: _jumpController,
      curve: Curves.easeInOut,
    ));
  }

  void _onTapGift() async {
    setState(() => _isOpened = true);
    _jumpController.stop();

    // Delay to simulate box opening
    await Future.delayed(const Duration(seconds: 1));

    if (mounted) {
      Navigator.push(context, MaterialPageRoute(
        builder: (_) => const DashboardScreen(),
      ));
    }
  }

  @override
  void dispose() {
    _jumpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapGift,
      child: SlideTransition(
        position: _jumpAnimation,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          width: _isOpened ? 140 : 100,
          height: _isOpened ? 140 : 100,
          decoration: BoxDecoration(
            color: Colors.deepPurple,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              _isOpened ? "🎁 Opened!" : "🎁",
              style: const TextStyle(fontSize: 36),
            ),
          ),
        ),
      ),
    );
  }
}
