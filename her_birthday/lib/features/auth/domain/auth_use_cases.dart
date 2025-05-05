import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:her_birthday/features/auth/domain/auth_repo.dart';

@lazySingleton
class AuthUseCases {
  AuthUseCases(this._authRepo);
  final AuthRepo _authRepo;

   Future<void> forgetPassword(String email) {
    return _authRepo.forgetPassword(email);
  }

  Future<UserCredential> login(String email, String password) {
    return _authRepo.login(email, password);
  }

  
  Future<UserCredential> signup(String email, String password) {
    return _authRepo.signUp(email, password);
  }

  Future<void> logout(){
    return _authRepo.logout();
  }
}
