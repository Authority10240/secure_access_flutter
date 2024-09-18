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
    as _i11;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i12;
import '../features/login/data/data_source/remote/sign_in_service.dart' as _i30;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i31;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i41;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i40;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i47;
import '../features/login/presentation/bloc/login_bloc.dart' as _i48;
import '../features/manual_details/presentation/bloc/manual_details_bloc.dart'
    as _i9;
import '../features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service.dart'
    as _i13;
import '../features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service_impl.dart'
    as _i14;
import '../features/manual_vehicle/data/repository_impl/manual_vehicle_repository_impl/manual_vehicle_continue_clicked_repository_impl.dart'
    as _i20;
import '../features/manual_vehicle/domain/repository/manual_vehicle_repository/manual_vehicle_continue_clicked_repository.dart'
    as _i19;
import '../features/manual_vehicle/domain/use_cases/manual_vehicle_usecase/manual_vehicle_continue_clicked_usecase.dart'
    as _i36;
import '../features/manual_vehicle/presentation/bloc/manual_vehicle_bloc.dart'
    as _i39;
import '../features/person_details/data/data_source/remote/person_details_remote_service.dart'
    as _i17;
import '../features/person_details/data/data_source/remote/person_details_remote_service_impl.dart'
    as _i18;
import '../features/person_details/data/repository_impl/person_details_repository_impl/person_details_continue_clicked_repository_impl.dart'
    as _i33;
import '../features/person_details/domain/repository/person_details_repository/person_details_continue_clicked_repository.dart'
    as _i32;
import '../features/person_details/domain/use_cases/person_details_usecase/person_details_continue_clicked_usecase.dart'
    as _i44;
import '../features/person_details/presentation/bloc/person_details_bloc.dart'
    as _i46;
import '../features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart'
    as _i21;
import '../features/personnel_scan/data/data_source/remote/personnel_scan_remote_service_impl.dart'
    as _i22;
import '../features/personnel_scan/data/repository_impl/personnel_scan_repository_impl/personnel_scan_continue_clicked_repository_impl.dart'
    as _i38;
import '../features/personnel_scan/domain/repository/personnel_scan_repository/personnel_scan_continue_clicked_repository.dart'
    as _i37;
import '../features/personnel_scan/domain/use_cases/personnel_scan_usecase/personnel_scan_continue_clicked_usecase.dart'
    as _i43;
import '../features/personnel_scan/presentation/bloc/personnel_scan_bloc.dart'
    as _i45;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source.dart'
    as _i15;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source_impl.dart'
    as _i16;
import '../features/scanner/data/repository_impl/scanner_repository_impl/scanner_continue_clicked_repository_impl.dart'
    as _i29;
import '../features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart'
    as _i28;
import '../features/scanner/domain/use_cases/scanner_usecase/scanner_continue_clicked_usecase.dart'
    as _i34;
import '../features/scanner/presentation/bloc/scanner_bloc.dart' as _i42;
import '../features/sign_up/data/repository_impl/sign_up_repository_impl/sign_up_clicked_repository_impl.dart'
    as _i26;
import '../features/sign_up/data/source/remote/sign_up_service.dart' as _i23;
import '../features/sign_up/data/source/remote/sign_up_service_impl.dart'
    as _i24;
import '../features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart'
    as _i25;
import '../features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart'
    as _i27;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i35;
import '../features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart'
    as _i10;
import '../generated/l10n.dart' as _i4;
import 'locator.dart' as _i49;

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
    gh.factory<_i10.VehicleTypeBloc>(() => _i10.VehicleTypeBloc());
    gh.factory<_i11.BiometricsLocalModel>(
        () => _i11.BiometricsLocalModel(enabled: gh<bool>()));
    gh.factory<_i12.SignInLocalModel>(
        () => _i12.SignInLocalModel(signedIn: gh<bool>()));
    gh.singleton<_i13.ManualVehicleRemoteService>(() =>
        _i14.ManualVehicleRemoteServiceIMpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.singleton<_i15.ScannerRemoteDataSource>(() =>
        _i16.ScannerRemoteDataSourceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.singleton<_i17.PersonDetailsRemoteService>(() =>
        _i18.PersonDetailsRemoteServiceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i19.ManualVehicleContinueClickedRepository>(() =>
        _i20.ManualVehicleContinueClickedRepositoryImpl(
            manualVehicleRemoteService: gh<_i13.ManualVehicleRemoteService>()));
    gh.singleton<_i21.PersonnelScanRemoteService>(() =>
        _i22.PersonnelScanRemoteServiceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i23.SignUpService>(
        () => _i24.SignUpServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i25.SignUpClickedRepository>(() =>
        _i26.SignUpClickedRepositoryImpl(
            signUpService: gh<_i23.SignUpService>()));
    gh.factory<_i27.SignUpClickedUseCase>(() => _i27.SignUpClickedUseCase(
        signUpClickedRepository: gh<_i25.SignUpClickedRepository>()));
    gh.factory<_i28.ScannerContinueClickedRepository>(() =>
        _i29.ScannerContinueClickedRepositoryImpl(
            scannerRemoteDataSource: gh<_i15.ScannerRemoteDataSource>()));
    gh.factory<_i30.SignInService>(
        () => _i31.SignInServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i32.PersonDetailsContinueClickedRepository>(() =>
        _i33.PersonDetailsContinueClickedRepositoryImpl(
            personDetailsRemoteService: gh<_i17.PersonDetailsRemoteService>()));
    gh.factory<_i34.ScannerContinueClickedUseCase>(() =>
        _i34.ScannerContinueClickedUseCase(
            scannerContinueClickedRepository:
                gh<_i28.ScannerContinueClickedRepository>()));
    gh.factory<_i35.SignUpBloc>(() =>
        _i35.SignUpBloc(signUpClickedUseCase: gh<_i27.SignUpClickedUseCase>()));
    gh.factory<_i36.ManualVehicleContinueClickedUseCase>(() =>
        _i36.ManualVehicleContinueClickedUseCase(
            manualVehicleContinueClickedRepository:
                gh<_i19.ManualVehicleContinueClickedRepository>()));
    gh.factory<_i37.PersonnelScanContinueClickedRepository>(() =>
        _i38.PersonnelScanContinueClickedRepositoryImpl(
            personnelScanRemoteService: gh<_i21.PersonnelScanRemoteService>()));
    gh.factory<_i39.ManualVehicleBloc>(() => _i39.ManualVehicleBloc(
        manualVehicleContinueClickedUseCase:
            gh<_i36.ManualVehicleContinueClickedUseCase>()));
    gh.factory<_i40.SignInClickedRepository>(() =>
        _i41.SignInClickedRepositoryImpl(
            signInService: gh<_i30.SignInService>()));
    gh.factory<_i42.ScannerBloc>(() => _i42.ScannerBloc(
        scannerContinueClickedUseCase:
            gh<_i34.ScannerContinueClickedUseCase>()));
    gh.factory<_i43.PersonnelScanContinueClickedUseCase>(() =>
        _i43.PersonnelScanContinueClickedUseCase(
            personnelScanContinueClickedRepository:
                gh<_i37.PersonnelScanContinueClickedRepository>()));
    gh.factory<_i44.PersonDetailsContinueClickedUseCase>(() =>
        _i44.PersonDetailsContinueClickedUseCase(
            personDetailsContinueClickedRepository:
                gh<_i32.PersonDetailsContinueClickedRepository>()));
    gh.factory<_i45.PersonnelScanBloc>(() => _i45.PersonnelScanBloc(
        personnelScanContinueClickedUseCase:
            gh<_i43.PersonnelScanContinueClickedUseCase>()));
    gh.factory<_i46.PersonDetailsBloc>(() => _i46.PersonDetailsBloc(
        personDetailsContinueClickedUseCase:
            gh<_i44.PersonDetailsContinueClickedUseCase>()));
    gh.factory<_i47.SignInClickedUseCase>(() => _i47.SignInClickedUseCase(
        signInClickedRepository: gh<_i40.SignInClickedRepository>()));
    gh.factory<_i48.LoginBloc>(() =>
        _i48.LoginBloc(signInClickedUseCase: gh<_i47.SignInClickedUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i49.RegisterModules {
  @override
  _i4.AppLocalizations get appLocalizations => _i4.AppLocalizations();
}
