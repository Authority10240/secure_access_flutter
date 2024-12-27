part of 'dashboard_bloc.dart';
@immutable
sealed  class DashboardPageState extends BaseState {

  DashboardPageState({this.visitations, super.errorCode, super.errorMessage});

  Stream<QuerySnapshot<SecureAccessVisitationsModel?>>? visitations;
}

class DashboardPageInitState extends DashboardPageState {}

class DashBoardPageVisitationState extends DashboardPageState{
  DashBoardPageVisitationState({super.visitations,super.errorCode, super.errorMessage});
}

class DashBoardPageLogsState extends DashboardPageState{

  DashBoardPageLogsState({ super.visitations,super.errorCode, super.errorMessage});
}

class DashBoardPageLoadVisitationVehicleState extends DashboardPageState{
   final SecureAccessVisitationsVehicleModel? dashboardPageLoadVisitationsVehicleModel;
   final SecureAccessVisitationsModel? dashboardPageLoadVisitationsModel;
  DashBoardPageLoadVisitationVehicleState({
    this.dashboardPageLoadVisitationsModel,
    this.dashboardPageLoadVisitationsVehicleModel,
  super.visitations, super.errorMessage, super.errorCode});
}