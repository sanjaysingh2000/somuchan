import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_bloc.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_event.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_state.dart';

class RoastScreen extends StatelessWidget {
  const RoastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink.shade50,
      appBar: AppBar(
        backgroundColor: Colors.pink.shade400,
        title: Text(
          '🔥 Roast Me!',
          style: GoogleFonts.permanentMarker(fontSize: 26, color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 20),
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.amber,
              child: Text(
                '😬',
                style: TextStyle(fontSize: 50),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Ready to be roasted?',
              style: GoogleFonts.bangers(
                fontSize: 28,
                color: Colors.red.shade400,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            // Text(
            //   'Drop your pic below, and we\'ll unleash the sass!',
            //   style: GoogleFonts.comicNeue(fontSize: 16, color: Colors.black87),
            //   textAlign: TextAlign.center,
            // ),
            // const SizedBox(height: 24),
            // ElevatedButton.icon(
            //   onPressed: () {},
            //   icon: const Icon(Icons.camera_alt_outlined),
            //   label: const Text('Upload Your Face'),
            //   style: ElevatedButton.styleFrom(
            //     backgroundColor: Colors.deepOrange,
            //     foregroundColor: Colors.white,
            //     padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30),
            //     ),
            //   ),
            // ),
            const SizedBox(height: 30),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.yellow.shade100,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: Colors.brown.shade300, width: 2),
                ),
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Latest Roast 🔥',
                      style: GoogleFonts.urbanist(),
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: Center(
                        child: BlocBuilder<RoastBloc, RoastState>(
                          builder: (context, state) {
                            if (state is RoastStateLoading) {
                              return Center(
                                  child: const CircularProgressIndicator());
                            } else if (state is RoastStateLoaded) {
                              return Text(
                                state.roast,
                                style: GoogleFonts.urbanist(
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                                textAlign: TextAlign.center,
                              );
                            } else if (state is RoastStateError) {
                              return Text(
                                'Error: ${state.error}',
                                style: const TextStyle(color: Colors.red),
                              );
                            }
                            return Container();
                          },
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<RoastBloc>()
                            .add(const RoastEventGetRandom());
                      },
                      icon: const Icon(Icons.repeat),
                      label: const Text('Roast again!'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepOrange,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
