import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:her_birthday/core/token_storage/token_storage.dart';
import 'package:her_birthday/features/auth/domain/auth_use_cases.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_event.dart';
import 'package:her_birthday/features/auth/presentation/bloc/auth_state.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final FirebaseAuth firebaseInstance;
  final FirebaseFirestore firebaseStorage;
  final TokenStorage _storage;
  final AuthUseCases _useCase;

  AuthBloc(
      this.firebaseInstance, this._useCase, this.firebaseStorage, this._storage)
      : super(AuthInitial()) {
    on<LoginEvent>(_login);
    on<SignUpEvent>(_signUp);
    on<ForgetPassEvent>(_forgetPass);
    on<LogoutEvent>(_logout);
    // on<SignUpWithGoogle>(_signInWithGoogle);
  }

  _login(event, emit) async {
    emit(AuthLoading());
    try {
      final credentials = await _useCase.login(event.email, event.password);
      final token =  await credentials.user?.getIdToken();
     if(token!=null){
      await _storage.saveToken(token);
     }
      emit(AuthSucess('Success'));
    } on FirebaseException catch (e) {
      print('error ==> ${e.code}');
      emit(AuthFailure(e.code));
    } catch (e) {
      print('error ==> ${e}');
      emit(AuthFailure('Something went wrong $e'));
    }
  }

  _signUp(event, emit) async {
    emit(AuthLoading());
    try {
      await _useCase.signup(event.email, event.password);
      emit(SignupSucess('Success'));
    } on FirebaseException catch (e) {
      print(e.code);
      emit(AuthFailure(e.code));
    } catch (e) {
      print(e);
      emit(AuthFailure('Something went wrong $e'));
    }
  }

  _forgetPass(event, emit) async {
    emit(AuthLoading());
    try {
      _useCase.forgetPassword(event.email);
      print('done');
      emit(AuthSucess('Success'));
    } on FirebaseException catch (e) {
      emit(AuthFailure(e.code));
    } catch (e) {
      emit(AuthFailure('Something went wrong'));
    }
  }

  _logout(event, emit) async {
    emit(AuthLoading());
    try {
      await _useCase.logout();
      await _storage.clearToken();
      emit(LogoutSuccess('Success'));
    } on FirebaseException catch (e) {
      emit(AuthFailure(e.code));
    } catch (e) {
      emit(AuthFailure('Something went wrong'));
    }
  }
}
