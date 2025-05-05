import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthRepo {
  Future<UserCredential> login(String email, String password);
  Future<UserCredential> signUp(String email, String password);
  Future<void> forgetPassword(String email);
  Future<void> logout();
}