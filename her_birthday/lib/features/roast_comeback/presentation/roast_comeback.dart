import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:her_birthday/features/auth/presentation/pages/login_page.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_bloc.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_state.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_bloc.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_bloc_event.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_state.dart';

class RoastComebackScreen extends StatefulWidget {
  const RoastComebackScreen({super.key});

  @override
  _RoastComebackScreenState createState() => _RoastComebackScreenState();
}

class _RoastComebackScreenState extends State<RoastComebackScreen> {
  final TextEditingController _controller = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final String _comeback = "Comeback will appear here!";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        title: const Text('🔥 Roast Comeback'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Roast Input Section
            TextField(
              controller: _controller,
              maxLines: 3,
              decoration: InputDecoration(
                hintText: 'Enter your roast here...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            // Send Button
            ElevatedButton(
              onPressed: () {
                context
                    .read<CombackBloc>()
                    .add(GetComebackRoasttt(_controller.text));
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepOrange,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: BlocBuilder<CombackBloc, ComebackState>(
                  builder: (context, state) {
                return (state is ComebackStateLoading)
                    ? const CircularProgressIndicator(
                        color: Colors.white,
                      )
                    : const Text('Send Roast');
              }),
            ),
            const SizedBox(height: 30),
            // AI Comeback Display Section
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: BlocBuilder<CombackBloc, ComebackState>(
                  builder: (context, state) {
                return (state is ComebackStateLoaded)
                    ? Text(
                        state.comeback,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        textAlign: TextAlign.center,
                      )
                    : Center(
                        child: Text(
                          _comeback,
                          style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
