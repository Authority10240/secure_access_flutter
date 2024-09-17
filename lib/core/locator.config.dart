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
    as _i12;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i13;
import '../features/login/data/data_source/remote/sign_in_service.dart' as _i27;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i28;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i36;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i35;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i42;
import '../features/login/presentation/bloc/login_bloc.dart' as _i43;
import '../features/manual_details/presentation/bloc/manual_details_bloc.dart'
    as _i9;
import '../features/manual_vehicle/presentation/bloc/manual_vehicle_bloc.dart'
    as _i10;
import '../features/person_details/data/data_source/remote/person_details_remote_service.dart'
    as _i16;
import '../features/person_details/data/data_source/remote/person_details_remote_service_impl.dart'
    as _i17;
import '../features/person_details/data/repository_impl/person_details_repository_impl/person_details_continue_clicked_repository_impl.dart'
    as _i30;
import '../features/person_details/domain/repository/person_details_repository/person_details_continue_clicked_repository.dart'
    as _i29;
import '../features/person_details/domain/use_cases/person_details_usecase/person_details_continue_clicked_usecase.dart'
    as _i39;
import '../features/person_details/presentation/bloc/person_details_bloc.dart'
    as _i41;
import '../features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart'
    as _i18;
import '../features/personnel_scan/data/data_source/remote/personnel_scan_remote_service_impl.dart'
    as _i19;
import '../features/personnel_scan/data/repository_impl/personnel_scan_repository_impl/personnel_scan_continue_clicked_repository_impl.dart'
    as _i34;
import '../features/personnel_scan/domain/repository/personnel_scan_repository/personnel_scan_continue_clicked_repository.dart'
    as _i33;
import '../features/personnel_scan/domain/use_cases/personnel_scan_usecase/personnel_scan_continue_clicked_usecase.dart'
    as _i38;
import '../features/personnel_scan/presentation/bloc/personnel_scan_bloc.dart'
    as _i40;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source.dart'
    as _i14;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source_impl.dart'
    as _i15;
import '../features/scanner/data/repository_impl/scanner_repository_impl/scanner_continue_clicked_repository_impl.dart'
    as _i26;
import '../features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart'
    as _i25;
import '../features/scanner/domain/use_cases/scanner_usecase/scanner_continue_clicked_usecase.dart'
    as _i31;
import '../features/scanner/presentation/bloc/scanner_bloc.dart' as _i37;
import '../features/sign_up/data/repository_impl/sign_up_repository_impl/sign_up_clicked_repository_impl.dart'
    as _i23;
import '../features/sign_up/data/source/remote/sign_up_service.dart' as _i20;
import '../features/sign_up/data/source/remote/sign_up_service_impl.dart'
    as _i21;
import '../features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart'
    as _i22;
import '../features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart'
    as _i24;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i32;
import '../features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart'
    as _i11;
import '../generated/l10n.dart' as _i4;
import 'locator.dart' as _i44;

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
    gh.factory<_i11.VehicleTypeBloc>(() => _i11.VehicleTypeBloc());
    gh.factory<_i12.BiometricsLocalModel>(
        () => _i12.BiometricsLocalModel(enabled: gh<bool>()));
    gh.factory<_i13.SignInLocalModel>(
        () => _i13.SignInLocalModel(signedIn: gh<bool>()));
    gh.singleton<_i14.ScannerRemoteDataSource>(() =>
        _i15.ScannerRemoteDataSourceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.singleton<_i16.PersonDetailsRemoteService>(() =>
        _i17.PersonDetailsRemoteServiceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.singleton<_i18.PersonnelScanRemoteService>(() =>
        _i19.PersonnelScanRemoteServiceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i20.SignUpService>(
        () => _i21.SignUpServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i22.SignUpClickedRepository>(() =>
        _i23.SignUpClickedRepositoryImpl(
            signUpService: gh<_i20.SignUpService>()));
    gh.factory<_i24.SignUpClickedUseCase>(() => _i24.SignUpClickedUseCase(
        signUpClickedRepository: gh<_i22.SignUpClickedRepository>()));
    gh.factory<_i25.ScannerContinueClickedRepository>(() =>
        _i26.ScannerContinueClickedRepositoryImpl(
            scannerRemoteDataSource: gh<_i14.ScannerRemoteDataSource>()));
    gh.factory<_i27.SignInService>(
        () => _i28.SignInServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i29.PersonDetailsContinueClickedRepository>(() =>
        _i30.PersonDetailsContinueClickedRepositoryImpl(
            personDetailsRemoteService: gh<_i16.PersonDetailsRemoteService>()));
    gh.factory<_i31.ScannerContinueClickedUseCase>(() =>
        _i31.ScannerContinueClickedUseCase(
            scannerContinueClickedRepository:
                gh<_i25.ScannerContinueClickedRepository>()));
    gh.factory<_i32.SignUpBloc>(() =>
        _i32.SignUpBloc(signUpClickedUseCase: gh<_i24.SignUpClickedUseCase>()));
    gh.factory<_i33.PersonnelScanContinueClickedRepository>(() =>
        _i34.PersonnelScanContinueClickedRepositoryImpl(
            personnelScanRemoteService: gh<_i18.PersonnelScanRemoteService>()));
    gh.factory<_i35.SignInClickedRepository>(() =>
        _i36.SignInClickedRepositoryImpl(
            signInService: gh<_i27.SignInService>()));
    gh.factory<_i37.ScannerBloc>(() => _i37.ScannerBloc(
        scannerContinueClickedUseCase:
            gh<_i31.ScannerContinueClickedUseCase>()));
    gh.factory<_i38.PersonnelScanContinueClickedUseCase>(() =>
        _i38.PersonnelScanContinueClickedUseCase(
            personnelScanContinueClickedRepository:
                gh<_i33.PersonnelScanContinueClickedRepository>()));
    gh.factory<_i39.PersonDetailsContinueClickedUseCase>(() =>
        _i39.PersonDetailsContinueClickedUseCase(
            personDetailsContinueClickedRepository:
                gh<_i29.PersonDetailsContinueClickedRepository>()));
    gh.factory<_i40.PersonnelScanBloc>(() => _i40.PersonnelScanBloc(
        personnelScanContinueClickedUseCase:
            gh<_i38.PersonnelScanContinueClickedUseCase>()));
    gh.factory<_i41.PersonDetailsBloc>(() => _i41.PersonDetailsBloc(
        personDetailsContinueClickedUseCase:
            gh<_i39.PersonDetailsContinueClickedUseCase>()));
    gh.factory<_i42.SignInClickedUseCase>(() => _i42.SignInClickedUseCase(
        signInClickedRepository: gh<_i35.SignInClickedRepository>()));
    gh.factory<_i43.LoginBloc>(() =>
        _i43.LoginBloc(signInClickedUseCase: gh<_i42.SignInClickedUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i44.RegisterModules {
  @override
  _i4.AppLocalizations get appLocalizations => _i4.AppLocalizations();
}
