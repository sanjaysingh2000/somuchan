import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_toastr/flutter_toastr.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:her_birthday/core/extensions/extensions.dart';
import 'package:her_birthday/core/token_storage/token_storage.dart';
import 'package:her_birthday/core/widgets/animation_widgets/app_loader.dart';
import 'package:her_birthday/core/widgets/animation_widgets/rabit_animation.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_event.dart';
import 'package:her_birthday/features/auth/presentation/pages/forget_password.dart';
import 'package:her_birthday/features/dashboard/dashbord.dart';
import '../../../../core/app_validations/app_validations.dart';
import '../../../../core/widgets/custom_text_form_field.dart';
import '../../../../di/di.dart';
import '../bloc/auth_state.dart';
import 'signup._screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: SafeArea(
          child: BlocConsumer<AuthBloc, AuthState>(
            listener: (context, state) async {
              if (state is AuthSucess) {
                //  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                //     builder: (context) {
                //       return const DashboardScreen();
                //     },
                //   ), (route) => false,);

                final setup = await getIt<TokenStorage>().getBirthdaySetup();
                if (setup != null) {
                  print(setup);
                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const DashboardScreen();
                    },
                  ), (route) => false,);
                }
                 else {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const DashboardScreen()),
                    (route) => false,
                  );
                }

                FlutterToastr.show('Login Success', context);
              }
              if (state is AuthFailure) {
                FlutterToastr.show(state.message, context);
              }
            },
            builder: (context, state) {
              if (state is AuthLoading) {
                return const Center(child: AppLoader());
              }

              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                  //  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const RabbitAnimation(),
                      40.h,
                      Text("Welcome👋",
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          )),
                      const SizedBox(height: 8),
                      Text("Login to continue",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.grey[700],
                          )),
                      40.h,
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
                              hintText: 'Email',
                              validator: (p0) {
                                return AppValidations().emailValidation(
                                    _emailController.text.trim());
                              },
                              controller: _emailController,
                            ),
                            const SizedBox(height: 16),
                            CustomTextField(
                              hintText: 'Password',
                              controller: _passwordController,
                              obscureText: true,
                              validator: (p0) {
                                if (p0!.isEmpty) {
                                  return 'Please enter your password';
                                }
                              },
                            ),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              const ForgetPasswordScreen()));
                                },
                                child: Text(
                                  'Forgot Password?',
                                  style: GoogleFonts.poppins(
                                    color: Colors.red,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    context.read<AuthBloc>().add(LoginEvent(
                                          _emailController.text.trim(),
                                          _passwordController.text.trim(),
                                        ));
                                  }
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

                            14.h,
                            // OutlinedButton.icon(
                            //   onPressed: () {
                            //     context.read<AuthBloc>().add(SignUpWithGoogle());
                            //   },
                            //   style: OutlinedButton.styleFrom(
                            //     padding: const EdgeInsets.symmetric(
                            //         vertical: 12, horizontal: 60),
                            //     shape: RoundedRectangleBorder(
                            //         borderRadius: BorderRadius.circular(12)),
                            //   ),
                            //   icon: const Icon(
                            //     Icons.g_mobiledata,
                            //     color: Colors.red,
                            //     size: 30,
                            //   ),
                            //   label: Text(
                            //     "Continue with Google",
                            //     style: GoogleFonts.poppins(
                            //       fontSize: 15,
                            //       color: Colors.black,
                            //     ),
                            //   ),
                            // ),
                            // const SizedBox(height: 10),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => const SignupScreen()));
                              },
                              child: Text(
                                'Don’t have an account? Sign Up',
                                style: GoogleFonts.poppins(
                                  fontSize: 14,
                                  color: Colors.grey[700],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
