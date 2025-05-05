import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/core/extensions/extensions.dart';
import 'package:her_birthday/core/widgets/animation_widgets/app_loader.dart';
import 'package:her_birthday/core/widgets/animation_widgets/rabit_animation.dart';

import '../../../../core/widgets/custom_text_form_field.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: BlocConsumer<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthLoading) {
              return const Center(child: AppLoader());
            }

            return SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
                child: Column(
                 // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const RabbitAnimation(),
                    30.h,
                    const Text(
                      "Forgot Password?",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    10.h,
                    const Text(
                      "Don't worry! Just enter your email and we’ll send you a link to reset your password.",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    30.h,
                    Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.black12,
                            blurRadius: 10,
                            offset: Offset(0, 4),
                          )
                        ],
                      ),
                      child: Column(
                        children: [
                          CustomTextField(
                            controller: _emailController,
                            hintText: 'Enter your email',
                          ),
                          30.h,
                          SizedBox(
                            width: double.infinity,
                            child: ElevatedButton(
                              onPressed: () {
                                final email = _emailController.text.trim();
                                if (email.isNotEmpty) {
                                  context
                                      .read<AuthBloc>()
                                      .add(ForgetPassEvent(email));
                                } else {
                                  FlutterToastr.show(
                                      "Email can't be empty", context);
                                }
                                // context.read<AuthBloc>().add(AuthLogin(
                                //       _emailController.text.trim(),
                                //       _passwordController.text.trim(),
                                //     ));
                              },
                              style: ElevatedButton.styleFrom(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12),
                                ),
                                backgroundColor: Colors.blueAccent,
                              ),
                              child: Text(
                                "Login",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          listener: (context, state) {
            if (state is OtpSend) {
              FlutterToastr.show(state.message, context);
              Navigator.pop(context);
            }

            if (state is AuthFailure) {
              FlutterToastr.show(state.message, context);
            }
          },
        ),
      ),
    );
  }
}
