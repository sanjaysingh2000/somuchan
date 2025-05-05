import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/di/di.dart';
import 'package:her_birthday/features/ai_chat/presentation/bloc/ai_bloc.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_bloc.dart';
import 'package:her_birthday/features/roast/presentation/bloc/roast_event.dart';
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_bloc.dart';
import 'package:her_birthday/features/splash_screen.dart';
import 'package:her_birthday/network/bloc/internet_bloc.dart';
import 'package:her_birthday/network/bloc/internet_state.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<InternetBloc>()),
        BlocProvider(create: (context) => getIt<AuthBloc>()),
        BlocProvider(create: (context) => getIt<AiChatBloc>()),
        BlocProvider(create: (context) => getIt<RoastBloc>()..add(const RoastEventGetRandom()),),
        BlocProvider(create: (context) => getIt<CombackBloc>()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        builder: (context, child) {
          // The BlocListener should wrap the child, not return from listener
          return BlocListener<InternetBloc, InternetState>(
            listener: (context, state) {
              state.when(
                initial: () => ScaffoldMessenger.of(context).removeCurrentSnackBar(),
                connected: () {},
                disconnected: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('⚠️ No Internet Connection'),
                      backgroundColor: Colors.red,
                      duration: Duration(days: 365),
                    ),
                  );
                },
              );
            },
            child: child!, // Move the child here
          );
        },
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}