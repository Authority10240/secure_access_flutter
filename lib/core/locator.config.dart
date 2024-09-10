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

import '../features/dashboard/presentation/bloc/dashboard_bloc.dart' as _i6;
import '../features/identification_type/presentation/bloc/identification_type_bloc.dart'
    as _i7;
import '../features/login/data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart'
    as _i9;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i10;
import '../features/login/data/data_source/remote/sign_in_service.dart' as _i16;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i17;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i20;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i19;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i21;
import '../features/login/presentation/bloc/login_bloc.dart' as _i22;
import '../features/sign_up/data/repository_impl/sign_up_repository_impl/sign_up_clicked_repository_impl.dart'
    as _i14;
import '../features/sign_up/data/source/remote/sign_up_service.dart' as _i11;
import '../features/sign_up/data/source/remote/sign_up_service_impl.dart'
    as _i12;
import '../features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart'
    as _i13;
import '../features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart'
    as _i15;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i18;
import '../features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart'
    as _i8;
import '../generated/l10n.dart' as _i4;
import 'locator.dart' as _i23;

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
    gh.factory<_i6.DashboardBloc>(() => _i6.DashboardBloc());
    gh.factory<_i7.IdentificationTypeBloc>(() => _i7.IdentificationTypeBloc());
    gh.factory<_i8.VehicleTypeBloc>(() => _i8.VehicleTypeBloc());
    gh.factory<_i9.BiometricsLocalModel>(
        () => _i9.BiometricsLocalModel(enabled: gh<bool>()));
    gh.factory<_i10.SignInLocalModel>(
        () => _i10.SignInLocalModel(signedIn: gh<bool>()));
    gh.factory<_i11.SignUpService>(
        () => _i12.SignUpServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i13.SignUpClickedRepository>(() =>
        _i14.SignUpClickedRepositoryImpl(
            signUpService: gh<_i11.SignUpService>()));
    gh.factory<_i15.SignUpClickedUseCase>(() => _i15.SignUpClickedUseCase(
        signUpClickedRepository: gh<_i13.SignUpClickedRepository>()));
    gh.factory<_i16.SignInService>(
        () => _i17.SignInServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i18.SignUpBloc>(() =>
        _i18.SignUpBloc(signUpClickedUseCase: gh<_i15.SignUpClickedUseCase>()));
    gh.factory<_i19.SignInClickedRepository>(() =>
        _i20.SignInClickedRepositoryImpl(
            signInService: gh<_i16.SignInService>()));
    gh.factory<_i21.SignInClickedUseCase>(() => _i21.SignInClickedUseCase(
        signInClickedRepository: gh<_i19.SignInClickedRepository>()));
    gh.factory<_i22.LoginBloc>(() =>
        _i22.LoginBloc(signInClickedUseCase: gh<_i21.SignInClickedUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i23.RegisterModules {
  @override
  _i4.AppLocalizations get appLocalizations => _i4.AppLocalizations();
}
