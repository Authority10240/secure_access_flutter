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

import '../features/dashboard/data/data_source/remote/dashboard_service.dart'
    as _i11;
import '../features/dashboard/data/data_source/remote/dashboard_service_impl.dart'
    as _i12;
import '../features/dashboard/data/repository_impl/dashboard_repository_impl/dashboard_page_load_visitation_vehicle_repository_impl.dart'
    as _i31;
import '../features/dashboard/data/repository_impl/dashboard_repository_impl/dashboard_page_load_visitations_repository_impl.dart'
    as _i25;
import '../features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitation_vehicle_repository.dart'
    as _i30;
import '../features/dashboard/domain/repository/dashboard_repository/dashboard_page_load_visitations_repository.dart'
    as _i24;
import '../features/dashboard/domain/use_cases/dashboard_usecase/dashboard_page_load_visitation_vehicle_usecase.dart'
    as _i33;
import '../features/dashboard/domain/use_cases/dashboard_usecase/dashboard_page_load_visitations_usecase.dart'
    as _i38;
import '../features/dashboard/presentation/bloc/dashboard_bloc.dart' as _i50;
import '../features/identification_type/presentation/bloc/identification_type_bloc.dart'
    as _i7;
import '../features/login/data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart'
    as _i10;
import '../features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart'
    as _i13;
import '../features/login/data/data_source/remote/sign_in_service.dart' as _i36;
import '../features/login/data/data_source/remote/sign_in_service_impl.dart'
    as _i37;
import '../features/login/data/repository_impl/login_repository_impl/sign_in_clicked_repository_impl.dart'
    as _i48;
import '../features/login/domain/repository/login_repository/sign_in_clicked_repository.dart'
    as _i47;
import '../features/login/domain/use_cases/login_usecase/sign_in_clicked_usecase.dart'
    as _i55;
import '../features/login/presentation/bloc/login_bloc.dart' as _i56;
import '../features/manual_details/presentation/bloc/manual_details_bloc.dart'
    as _i8;
import '../features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service.dart'
    as _i14;
import '../features/manual_vehicle/data/data_source/remote/manual_vehicle_remote_service_impl.dart'
    as _i15;
import '../features/manual_vehicle/data/repository_impl/manual_vehicle_repository_impl/manual_vehicle_continue_clicked_repository_impl.dart'
    as _i21;
import '../features/manual_vehicle/domain/repository/manual_vehicle_repository/manual_vehicle_continue_clicked_repository.dart'
    as _i20;
import '../features/manual_vehicle/domain/use_cases/manual_vehicle_usecase/manual_vehicle_continue_clicked_usecase.dart'
    as _i43;
import '../features/manual_vehicle/presentation/bloc/manual_vehicle_bloc.dart'
    as _i46;
import '../features/person_details/data/data_source/remote/person_details_remote_service.dart'
    as _i18;
import '../features/person_details/data/data_source/remote/person_details_remote_service_impl.dart'
    as _i19;
import '../features/person_details/data/repository_impl/person_details_repository_impl/person_details_continue_clicked_repository_impl.dart'
    as _i40;
import '../features/person_details/domain/repository/person_details_repository/person_details_continue_clicked_repository.dart'
    as _i39;
import '../features/person_details/domain/use_cases/person_details_usecase/person_details_continue_clicked_usecase.dart'
    as _i52;
import '../features/person_details/presentation/bloc/person_details_bloc.dart'
    as _i54;
import '../features/personnel_scan/data/data_source/remote/personnel_scan_remote_service.dart'
    as _i22;
import '../features/personnel_scan/data/data_source/remote/personnel_scan_remote_service_impl.dart'
    as _i23;
import '../features/personnel_scan/data/repository_impl/personnel_scan_repository_impl/personnel_scan_continue_clicked_repository_impl.dart'
    as _i45;
import '../features/personnel_scan/domain/repository/personnel_scan_repository/personnel_scan_continue_clicked_repository.dart'
    as _i44;
import '../features/personnel_scan/domain/use_cases/personnel_scan_usecase/personnel_scan_continue_clicked_usecase.dart'
    as _i51;
import '../features/personnel_scan/presentation/bloc/personnel_scan_bloc.dart'
    as _i53;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source.dart'
    as _i16;
import '../features/scanner/data/data_source/remote/scanner_remote_data_source_impl.dart'
    as _i17;
import '../features/scanner/data/repository_impl/scanner_repository_impl/scanner_continue_clicked_repository_impl.dart'
    as _i35;
import '../features/scanner/domain/repository/scanner_repository/scanner_continue_clicked_repository.dart'
    as _i34;
import '../features/scanner/domain/use_cases/scanner_usecase/scanner_continue_clicked_usecase.dart'
    as _i41;
import '../features/scanner/presentation/bloc/scanner_bloc.dart' as _i49;
import '../features/sign_up/data/repository_impl/sign_up_repository_impl/sign_up_clicked_repository_impl.dart'
    as _i29;
import '../features/sign_up/data/source/remote/sign_up_service.dart' as _i26;
import '../features/sign_up/data/source/remote/sign_up_service_impl.dart'
    as _i27;
import '../features/sign_up/domain/repository/sign_up_repository/sign_up_clicked_repository.dart'
    as _i28;
import '../features/sign_up/domain/use_cases/sign_up_usecase/sign_up_clicked_usecase.dart'
    as _i32;
import '../features/sign_up/presentation/bloc/sign_up_bloc.dart' as _i42;
import '../features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart'
    as _i9;
import '../generated/l10n.dart' as _i4;
import 'locator.dart' as _i57;

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
    gh.factory<_i7.IdentificationTypeBloc>(() => _i7.IdentificationTypeBloc());
    gh.factory<_i8.ManualDetailsBloc>(() => _i8.ManualDetailsBloc());
    gh.factory<_i9.VehicleTypeBloc>(() => _i9.VehicleTypeBloc());
    gh.factory<_i10.BiometricsLocalModel>(
        () => _i10.BiometricsLocalModel(enabled: gh<bool>()));
    gh.singleton<_i11.DashboardService>(() => _i12.DashboardServiceImpl(
        firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i13.SignInLocalModel>(
        () => _i13.SignInLocalModel(signedIn: gh<bool>()));
    gh.singleton<_i14.ManualVehicleRemoteService>(() =>
        _i15.ManualVehicleRemoteServiceIMpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.singleton<_i16.ScannerRemoteDataSource>(() =>
        _i17.ScannerRemoteDataSourceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.singleton<_i18.PersonDetailsRemoteService>(() =>
        _i19.PersonDetailsRemoteServiceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i20.ManualVehicleContinueClickedRepository>(() =>
        _i21.ManualVehicleContinueClickedRepositoryImpl(
            manualVehicleRemoteService: gh<_i14.ManualVehicleRemoteService>()));
    gh.singleton<_i22.PersonnelScanRemoteService>(() =>
        _i23.PersonnelScanRemoteServiceImpl(
            firebaseFirestore: gh<_i6.FirebaseFirestore>()));
    gh.factory<_i24.DashboardPageLoadVisitationsRepository>(() =>
        _i25.DashboardPageLoadVisitationsRepositoryImpl(
            dashboardService: gh<_i11.DashboardService>()));
    gh.factory<_i26.SignUpService>(
        () => _i27.SignUpServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i28.SignUpClickedRepository>(() =>
        _i29.SignUpClickedRepositoryImpl(
            signUpService: gh<_i26.SignUpService>()));
    gh.factory<_i30.DashboardPageLoadVisitationVehicleRepository>(() =>
        _i31.DashboardPageLoadVisitationVehicleRepositoryImpl(
            dashboardService: gh<_i11.DashboardService>()));
    gh.factory<_i32.SignUpClickedUseCase>(() => _i32.SignUpClickedUseCase(
        signUpClickedRepository: gh<_i28.SignUpClickedRepository>()));
    gh.factory<_i33.DashboardPageLoadVisitationVehicleUseCase>(() =>
        _i33.DashboardPageLoadVisitationVehicleUseCase(
            dashboardPageLoadVisitationVehicleRepository:
                gh<_i30.DashboardPageLoadVisitationVehicleRepository>()));
    gh.factory<_i34.ScannerContinueClickedRepository>(() =>
        _i35.ScannerContinueClickedRepositoryImpl(
            scannerRemoteDataSource: gh<_i16.ScannerRemoteDataSource>()));
    gh.factory<_i36.SignInService>(
        () => _i37.SignInServiceImpl(firebaseAuth: gh<_i5.FirebaseAuth>()));
    gh.factory<_i38.DashboardPageLoadVisitationsUseCase>(() =>
        _i38.DashboardPageLoadVisitationsUseCase(
            dashboardPageLoadVisitationsRepository:
                gh<_i24.DashboardPageLoadVisitationsRepository>()));
    gh.factory<_i39.PersonDetailsContinueClickedRepository>(() =>
        _i40.PersonDetailsContinueClickedRepositoryImpl(
            personDetailsRemoteService: gh<_i18.PersonDetailsRemoteService>()));
    gh.factory<_i41.ScannerContinueClickedUseCase>(() =>
        _i41.ScannerContinueClickedUseCase(
            scannerContinueClickedRepository:
                gh<_i34.ScannerContinueClickedRepository>()));
    gh.factory<_i42.SignUpBloc>(() =>
        _i42.SignUpBloc(signUpClickedUseCase: gh<_i32.SignUpClickedUseCase>()));
    gh.factory<_i43.ManualVehicleContinueClickedUseCase>(() =>
        _i43.ManualVehicleContinueClickedUseCase(
            manualVehicleContinueClickedRepository:
                gh<_i20.ManualVehicleContinueClickedRepository>()));
    gh.factory<_i44.PersonnelScanContinueClickedRepository>(() =>
        _i45.PersonnelScanContinueClickedRepositoryImpl(
            personnelScanRemoteService: gh<_i22.PersonnelScanRemoteService>()));
    gh.factory<_i46.ManualVehicleBloc>(() => _i46.ManualVehicleBloc(
        manualVehicleContinueClickedUseCase:
            gh<_i43.ManualVehicleContinueClickedUseCase>()));
    gh.factory<_i47.SignInClickedRepository>(() =>
        _i48.SignInClickedRepositoryImpl(
            signInService: gh<_i36.SignInService>()));
    gh.factory<_i49.ScannerBloc>(() => _i49.ScannerBloc(
        scannerContinueClickedUseCase:
            gh<_i41.ScannerContinueClickedUseCase>()));
    gh.factory<_i50.DashboardBloc>(() => _i50.DashboardBloc(
          dashboardPageLoadVisitationVehicleUseCase:
              gh<_i33.DashboardPageLoadVisitationVehicleUseCase>(),
          dashboardPageLoadVisitationsUseCase:
              gh<_i38.DashboardPageLoadVisitationsUseCase>(),
        ));
    gh.factory<_i51.PersonnelScanContinueClickedUseCase>(() =>
        _i51.PersonnelScanContinueClickedUseCase(
            personnelScanContinueClickedRepository:
                gh<_i44.PersonnelScanContinueClickedRepository>()));
    gh.factory<_i52.PersonDetailsContinueClickedUseCase>(() =>
        _i52.PersonDetailsContinueClickedUseCase(
            personDetailsContinueClickedRepository:
                gh<_i39.PersonDetailsContinueClickedRepository>()));
    gh.factory<_i53.PersonnelScanBloc>(() => _i53.PersonnelScanBloc(
        personnelScanContinueClickedUseCase:
            gh<_i51.PersonnelScanContinueClickedUseCase>()));
    gh.factory<_i54.PersonDetailsBloc>(() => _i54.PersonDetailsBloc(
        personDetailsContinueClickedUseCase:
            gh<_i52.PersonDetailsContinueClickedUseCase>()));
    gh.factory<_i55.SignInClickedUseCase>(() => _i55.SignInClickedUseCase(
        signInClickedRepository: gh<_i47.SignInClickedRepository>()));
    gh.factory<_i56.LoginBloc>(() =>
        _i56.LoginBloc(signInClickedUseCase: gh<_i55.SignInClickedUseCase>()));
    return this;
  }
}

class _$RegisterModules extends _i57.RegisterModules {
  @override
  _i4.AppLocalizations get appLocalizations => _i4.AppLocalizations();
}
