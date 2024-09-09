// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/login/data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart'
    as _i6;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i7;
import '../features/login/data/data_source/remote/sign_in_service.dart' as _i13;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i14;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i17;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i16;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i18;
import '../features/login/presentation/bloc/login_bloc.dart' as _i19;
import '../features/sign_up/data/repository_impl/sign_up_repository_impl/sign_up_clicked_repository_impl.dart'
    as _i11;
import '../features/sign_up/data/source/remote/sign_up_service.dart' as _i8;
import '../features/sign_up/data/source/remote/sign_up_service_impl.dart'
    as _i9;
import '../features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart'
    as _i10;
import '../features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart'
    as _i12;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i15;
import '../generated/l10n.dart' as _i4;
import 'locator.dart' as _i20;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    gh.factory<_i3.Dio>(() => registerModules.dio);
    gh.factory<_i4.AppLocalizations>(() => registerModules.appLocalizations);
    gh.factory<_i5.FirebaseAuth>(() => registerModules.firebaseAuth);
    gh.factory<_i6.BiometricsLocalModel>(
        () => _i6.BiometricsLocalModel(enabled: gh<bool>()));
    gh.factory<_i7.SignInLocalModel>(
        () => _i7.SignInLocalModel(signedIn: gh<bool>()));
    gh.factory<_i8.SignUpService>(
        () => _i9.SignUpServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i10.SignUpClickedRepository>(() =>
        _i11.SignUpClickedRepositoryImpl(
            signUpService: gh<_i8.SignUpService>()));
    gh.factory<_i12.SignUpClickedUseCase>(() => _i12.SignUpClickedUseCase(
        signUpClickedRepository: gh<_i10.SignUpClickedRepository>()));
    gh.factory<_i13.SignInService>(
        () => _i14.SignInServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i15.SignUpBloc>(() =>
        _i15.SignUpBloc(signUpClickedUseCase: gh<_i12.SignUpClickedUseCase>()));
    gh.factory<_i16.SignInClickedRepository>(() =>
        _i17.SignInClickedRepositoryImpl(
            signInService: gh<_i13.SignInService>()));
    gh.factory<_i18.SignInClickedUseCase>(() => _i18.SignInClickedUseCase(
        signInClickedRepository: gh<_i16.SignInClickedRepository>()));
    gh.factory<_i19.LoginBloc>(() =>
        _i19.LoginBloc(signInClickedUseCase: gh<_i18.SignInClickedUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i20.RegisterModules {
  @override
  _i4.AppLocalizations get appLocalizations => _i4.AppLocalizations();
}
