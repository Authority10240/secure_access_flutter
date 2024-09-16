// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i6;
import 'package:dio/dio.dart' as _i3;
import 'package:firebase_auth/firebase_auth.dart' as _i5;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/dashboard/presentation/bloc/dashboard_bloc.dart' as _i7;
import '../features/identification_type/presentation/bloc/identification_type_bloc.dart'
    as _i8;
import '../features/login/data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart'
    as _i15;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i16;
import '../features/login/data/data_source/remote/sign_in_service.dart' as _i26;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i27;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i31;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i30;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i32;
import '../features/login/presentation/bloc/login_bloc.dart' as _i33;
import '../features/manual_details/presentation/bloc/manual_details_bloc.dart'
    as _i9;
import '../features/manual_vehicle/presentation/bloc/manual_vehicle_bloc.dart'
    as _i10;
import '../features/person_details/presentation/bloc/person_details_bloc.dart'
    as _i12;
import '../features/personnel_scan/presentation/bloc/personnel_scan_bloc.dart'
    as _i11;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source.dart'
    as _i17;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source_impl.dart'
    as _i18;
import '../features/scanner/data/repository_impl/scanner_repository_impl/scanner_continue_clicked_repository_impl.dart'
    as _i20;
import '../features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart'
    as _i19;
import '../features/scanner/domain/use_cases/scanner_usecase/scanner_continue_clicked_usecase.dart'
    as _i28;
import '../features/scanner/presentation/bloc/scanner_bloc.dart' as _i13;
import '../features/sign_up/data/repository_impl/sign_up_repository_impl/sign_up_clicked_repository_impl.dart'
    as _i24;
import '../features/sign_up/data/source/remote/sign_up_service.dart' as _i21;
import '../features/sign_up/data/source/remote/sign_up_service_impl.dart'
    as _i22;
import '../features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart'
    as _i23;
import '../features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart'
    as _i25;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i29;
import '../features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart'
    as _i14;
import '../generated/l10n.dart' as _i4;
import 'locator.dart' as _i34;

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
    gh.factory<_i6.FirebaseFirestore>(() => registerModules.firebaseFireStore);
    gh.factory<_i7.DashboardBloc>(() => _i7.DashboardBloc());
    gh.factory<_i8.IdentificationTypeBloc>(() => _i8.IdentificationTypeBloc());
    gh.factory<_i9.ManualDetailsBloc>(() => _i9.ManualDetailsBloc());
    gh.factory<_i10.ManualVehicleBloc>(() => _i10.ManualVehicleBloc());
    gh.factory<_i11.PersonnelScanBloc>(() => _i11.PersonnelScanBloc());
    gh.factory<_i12.PersonDetailsBloc>(() => _i12.PersonDetailsBloc());
    gh.factory<_i13.ScannerBloc>(() => _i13.ScannerBloc());
    gh.factory<_i14.VehicleTypeBloc>(() => _i14.VehicleTypeBloc());
    gh.factory<_i15.BiometricsLocalModel>(
        () => _i15.BiometricsLocalModel(enabled: gh<bool>()));
    gh.factory<_i16.SignInLocalModel>(
        () => _i16.SignInLocalModel(signedIn: gh<bool>()));
    gh.singleton<_i17.ScannerRemoteDataSource>(() =>
        _i18.ScannerRemoteDataSourceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i19.ScannerContinueClickedRepository>(
        () => _i20.ScannerContinueClickedRepositoryImpl());
    gh.factory<_i21.SignUpService>(
        () => _i22.SignUpServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i23.SignUpClickedRepository>(() =>
        _i24.SignUpClickedRepositoryImpl(
            signUpService: gh<_i21.SignUpService>()));
    gh.factory<_i25.SignUpClickedUseCase>(() => _i25.SignUpClickedUseCase(
        signUpClickedRepository: gh<_i23.SignUpClickedRepository>()));
    gh.factory<_i26.SignInService>(
        () => _i27.SignInServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i28.ScannerContinueClickedUseCase>(() =>
        _i28.ScannerContinueClickedUseCase(
            scannerContinueClickedRepository:
                gh<_i19.ScannerContinueClickedRepository>()));
    gh.factory<_i29.SignUpBloc>(() =>
        _i29.SignUpBloc(signUpClickedUseCase: gh<_i25.SignUpClickedUseCase>()));
    gh.factory<_i30.SignInClickedRepository>(() =>
        _i31.SignInClickedRepositoryImpl(
            signInService: gh<_i26.SignInService>()));
    gh.factory<_i32.SignInClickedUseCase>(() => _i32.SignInClickedUseCase(
        signInClickedRepository: gh<_i30.SignInClickedRepository>()));
    gh.factory<_i33.LoginBloc>(() =>
        _i33.LoginBloc(signInClickedUseCase: gh<_i32.SignInClickedUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i34.RegisterModules {
  @override
  _i4.AppLocalizations get appLocalizations => _i4.AppLocalizations();
}
