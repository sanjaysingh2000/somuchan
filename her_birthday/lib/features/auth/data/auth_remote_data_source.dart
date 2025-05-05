import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:injectable/injectable.dart';

abstract interface class AuthRemoteDataSource {
  Future<UserCredential> login(String email, String password);
  Future<UserCredential> signUp(String email, String password);
  
  Future<void> forgetPassword(String email);
  Future<void> logout();
}

@LazySingleton(as: AuthRemoteDataSource)
class AuthRemoteDataSourceImpl extends AuthRemoteDataSource {
  final FirebaseAuth _firebaseAuth;
  final FirebaseFirestore _store;

  AuthRemoteDataSourceImpl(this._firebaseAuth, this._store);

  @override
  Future<UserCredential> login(String email, String password) {
    return _firebaseAuth.signInWithEmailAndPassword(
        email: email, password: password);
  }

  @override
  Future<void> forgetPassword(String email) {
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  @override
  Future<UserCredential> signUp(String email, String password) async{
    final UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email, password: password);
  final user = userCredential.user;
  await FirebaseFirestore.instance.collection('users').doc(userCredential.user?.uid).set({
    'email': email,
    //'name': name,
    // Add any additional fields you need (e.g., profile picture URL, etc.)
  });
    if(userCredential!=null){
     await _store.collection('users').doc(user?.uid).set({
        'email': email,
        'password': password,
      });
    }
    return userCredential;
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.signOut();
  }
}
