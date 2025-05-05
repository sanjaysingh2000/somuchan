// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:connectivity_plus/connectivity_plus.dart' as _i895;
import 'package:dio/dio.dart' as _i361;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:get_it/get_it.dart' as _i174;
import 'package:her_birthday/core/token_storage/token_storage.dart' as _i730;
import 'package:her_birthday/di/register_module.dart' as _i240;
import 'package:her_birthday/features/ai_chat/data/ai_chat_remote_data_source.dart'
    as _i333;
import 'package:her_birthday/features/ai_chat/data/ai_chat_repo_impl.dart'
    as _i638;
import 'package:her_birthday/features/ai_chat/domain/ai_chat_repo.dart'
    as _i698;
import 'package:her_birthday/features/ai_chat/domain/ai_chat_usecase.dart'
    as _i364;
import 'package:her_birthday/features/ai_chat/presentation/bloc/ai_bloc.dart'
    as _i687;
import 'package:her_birthday/features/auth/data/auth_remote_data_source.dart'
    as _i819;
import 'package:her_birthday/features/auth/data/auth_repo_impl.dart' as _i391;
import 'package:her_birthday/features/auth/domain/auth_repo.dart' as _i819;
import 'package:her_birthday/features/auth/domain/auth_use_cases.dart' as _i288;
import 'package:her_birthday/features/auth/presentation/bloc/auth_bloc.dart'
    as _i382;
import 'package:her_birthday/features/roast/data/roast_remote_data_source.dart'
    as _i81;
import 'package:her_birthday/features/roast/data/roast_repo_impl.dart' as _i849;
import 'package:her_birthday/features/roast/domain/repo/roast_repo.dart'
    as _i123;
import 'package:her_birthday/features/roast/domain/roast_usecase.dart' as _i956;
import 'package:her_birthday/features/roast/presentation/bloc/roast_bloc.dart'
    as _i1034;
import 'package:her_birthday/features/roast_comeback/data/come_back_remote_source.dart'
    as _i380;
import 'package:her_birthday/features/roast_comeback/data/comeback_repo_impl.dart'
    as _i181;
import 'package:her_birthday/features/roast_comeback/domain/comeback_use_case.dart'
    as _i137;
import 'package:her_birthday/features/roast_comeback/domain/repo/come_back_repo.dart'
    as _i37;
import 'package:her_birthday/features/roast_comeback/presentation/bloc/comeback_bloc.dart'
    as _i10;
import 'package:her_birthday/network/bloc/internet_bloc.dart' as _i598;
import 'package:injectable/injectable.dart' as _i526;
import 'package:shared_preferences/shared_preferences.dart' as _i460;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModule = _$RegisterModule();
    await gh.factoryAsync<_i460.SharedPreferences>(
      () => registerModule.prefs,
      preResolve: true,
    );
    gh.factory<_i974.FirebaseFirestore>(() => registerModule.firestore);
    gh.factory<_i59.FirebaseAuth>(() => registerModule.auth);
    gh.factory<_i895.Connectivity>(() => registerModule.connectivity);
    gh.lazySingleton<_i361.Dio>(() => registerModule.dio);
    gh.lazySingleton<_i730.TokenStorage>(
        () => _i730.TokenStorage(gh<_i460.SharedPreferences>()));
    gh.lazySingleton<_i333.IGeminiService>(
        () => _i333.GeminiService(gh<_i361.Dio>()));
    gh.lazySingleton<_i380.ComeBackRemoteSource>(
        () => _i380.ComeBackRemoteSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i819.AuthRemoteDataSource>(
        () => _i819.AuthRemoteDataSourceImpl(
              gh<_i59.FirebaseAuth>(),
              gh<_i974.FirebaseFirestore>(),
            ));
    gh.lazySingleton<_i81.RoastRemoteDataSource>(
        () => _i81.RoastRemoteDataSourceImpl(gh<_i361.Dio>()));
    gh.lazySingleton<_i123.RoastRepo>(
        () => _i849.RoastRepoImpl(gh<_i81.RoastRemoteDataSource>()));
    gh.lazySingleton<_i37.ComeBackRepo>(
        () => _i181.ComebackRepoImpl(gh<_i380.ComeBackRemoteSource>()));
    gh.factory<_i598.InternetBloc>(
        () => _i598.InternetBloc(gh<_i895.Connectivity>()));
    gh.lazySingleton<_i698.AiRepository>(
        () => _i638.AiRepositoryImpl(gh<_i333.IGeminiService>()));
    gh.lazySingleton<_i819.AuthRepo>(
        () => _i391.AuthRepoImpl(gh<_i819.AuthRemoteDataSource>()));
    gh.lazySingleton<_i364.AiChatUseCase>(
        () => _i364.AiChatUseCase(gh<_i698.AiRepository>()));
    gh.lazySingleton<_i956.RoastUsecase>(
        () => _i956.RoastUsecase(gh<_i123.RoastRepo>()));
    gh.lazySingleton<_i137.ComebackUseCase>(
        () => _i137.ComebackUseCase(gh<_i37.ComeBackRepo>()));
    gh.factory<_i687.AiChatBloc>(
        () => _i687.AiChatBloc(gh<_i364.AiChatUseCase>()));
    gh.factory<_i10.CombackBloc>(
        () => _i10.CombackBloc(gh<_i137.ComebackUseCase>()));
    gh.lazySingleton<_i288.AuthUseCases>(
        () => _i288.AuthUseCases(gh<_i819.AuthRepo>()));
    gh.factory<_i1034.RoastBloc>(
        () => _i1034.RoastBloc(gh<_i956.RoastUsecase>()));
    gh.factory<_i382.AuthBloc>(() => _i382.AuthBloc(
          gh<_i59.FirebaseAuth>(),
          gh<_i288.AuthUseCases>(),
          gh<_i974.FirebaseFirestore>(),
          gh<_i730.TokenStorage>(),
        ));
    return this;
  }
}

class _$RegisterModule extends _i240.RegisterModule {}
