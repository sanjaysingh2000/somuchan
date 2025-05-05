import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';
import 'package:her_birthday/features/auth/data/auth_remote_data_source.dart';
import 'package:her_birthday/features/auth/domain/auth_repo.dart';

@LazySingleton(as: AuthRepo)
class AuthRepoImpl extends AuthRepo{
  AuthRepoImpl(this._dataSource);
  final AuthRemoteDataSource _dataSource;
  @override
  Future<void> forgetPassword(String email) {
    return _dataSource.forgetPassword(email);
  }

  @override
  Future<UserCredential> login(String email, String password) {
  return _dataSource.login(email, password);
  }

  @override
  Future<UserCredential> signUp(String email, String password) {
    return _dataSource.signUp(email, password);
  }
  
  @override
  Future<void> logout() {
    return _dataSource.logout();
  }
}