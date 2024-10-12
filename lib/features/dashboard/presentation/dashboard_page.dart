import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:secure_access/core/colors.dart';
import 'package:secure_access/core/extensions/date_extension.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/core/widgets/custom_form_button.dart';
import 'package:secure_access/core/widgets/preloader_widget.dart';
import 'package:secure_access/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';
import 'package:secure_access/features/dashboard/presentation/widgets/car_description_widget.dart';
import 'package:secure_access/features/dashboard/presentation/widgets/transport_type_card.dart';
import 'package:secure_access/features/identification_type/presentation/identification_type_page.dart';
import 'package:secure_access/generated/l10n.dart';
import 'package:get/get.dart';
import 'bloc/dashboard_bloc.dart';


class DashboardPage extends BasePage {
  const DashboardPage({super.key});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends BasePageState<DashboardPage, DashboardBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBloc().add(DashBoardPageVisitationEvent());

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardPageState>(
      listener: (context, state){
        if(state is DashBoardPageLoadVisitationVehicleState){

          if(state.dataState == DataState.loading) {
            preloaderWidgetOverlay(context);
          }
              if(state.dataState == DataState.error){
                Navigator.pop(context);
                Get.snackbar(appLocalizations.error, state.errorMessage!);
              }

              if(state.dataState == DataState.success) {
                Navigator.pop(context);
                carDescriptionDialog(
                    appLocalizations: appLocalizations,
                    vehicle: state.dashboardPageLoadVisitationsVehicleModel!,
                    visitation: state.dashboardPageLoadVisitationsModel!

                );
              }
        }
      },
      builder: (context, state) {
        switch(state){
          case DashBoardPageLogsState () || DashBoardPageLoadVisitationVehicleState():
            return state.dataState == DataState.success?
            SingleChildScrollView(
              child: Padding(
                padding:  EdgeInsets.all(borderRadius),
                child:  Padding(
                  padding:  EdgeInsets.all(pagePadding),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        smallSpacer,
                        Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                        smallSpacer,
                        Center(child: Text(appLocalizations.complexName, style: textStyleTitle(),)),
                        smallSpacer,
                        Center(child: Text(appLocalizations.whoHasBeenHereToday, style: textStyleDirectives(),)),
                        mediumSpacer,
                        SizedBox(
                          height: 500,
                            child:
                        StreamBuilder<QuerySnapshot<DashboardPageLoadVisitationsModel?>>(
                            stream: state.visitations,
                            builder: (context, snapshot){
                              List<QueryDocumentSnapshot<DashboardPageLoadVisitationsModel?>>? data = snapshot.data?.docs??[];
                              return ListView.builder(
                                itemCount: snapshot.data?.docs.length,
                                  itemBuilder: (context, index){
                                  DashboardPageLoadVisitationsModel? visitation = snapshot.data?.docs.elementAt(index).data();
                                  String? visitationId  = snapshot.data?.docs.elementAt(index).id;
                                  return Card(elevation: 11,child: Container( child: ListTile(
                                    leading: Text("Unit: ${visitation?.unitVisited??""}",style: textStyleSubHeading(),),
                                    title: Text("Name: ${visitation?.firstName??""}\n"
                                        "Surname: ${visitation?.lastName??""}",style: textStyleSubHeading(),),
                                    subtitle: Text("Date: ${visitation?.dateTime!.toString().toFormattedDate()} Time:${visitation?.dateTime!.toString().toFormattedTime()}",),
                                    trailing: InkWell(
                                    child: Icon(
                                        visitation?.transportationType == TransportationType.driveIn.toString()?
                                        Icons.car_crash_sharp :
                                        Icons.directions_walk_outlined,
                                    color: Colors.blue,),
                                  onTap: (){
                                      if(visitation?.transportationType == TransportationType.driveIn.toString()) {
                                        getBloc().add(DashBoardPageLoadVisitationVehicleEvent(
                                            dashboardPageLoadVisitationsModel: visitation!,
                                            visitationId: visitationId!));
                                      }else{
                                        Get.snackbar('Walk in', '${visitation?.firstName} ${visitation?.lastName} walked in');
                                      }
                                  },))),);
                              });
                        }))
                      ]
                  ),
                ),
              ),
            ):
            state.dataState == DataState.loading?
            preloaderWidget():
            Text("Error",style: textStyleSubHeading(),)
            ;
          case DashboardPageInitState():
        case DashBoardPageVisitationState():
            return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(borderRadius),
            child:  Padding(
              padding:  EdgeInsets.all(pagePadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallSpacer,
                    Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                    smallSpacer,
                    Center(child: Text(appLocalizations.complexName, style: textStyleTitle(),)),
                    smallSpacer,
                    Center(child: Text(appLocalizations.whoIsVisitingToday, style: textStyleDirectives(),)),
                    mediumSpacer,


                    TransportTypeCard(
                      caption: getLocalization().drivein,
                      iconWidget: Icon(Icons.car_crash_sharp, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const IdentificationTypePage(transportationType: TransportationType.driveIn,));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().walkIn,
                      iconWidget:Icon(Icons.directions_walk_outlined, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const IdentificationTypePage(transportationType: TransportationType.walkIn,));
                      },
                    ),



                  ]
              ),
            ),
          ),
        );
          default: return SingleChildScrollView(
            child: Padding(
              padding:  EdgeInsets.all(borderRadius),
              child:  Padding(
                padding:  EdgeInsets.all(pagePadding),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      smallSpacer,
                      Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                      smallSpacer,
                      Center(child: Text(appLocalizations.complexName, style: textStyleTitle(),)),
                      smallSpacer,
                      Center(child: Text(appLocalizations.whoIsVisitingToday, style: textStyleDirectives(),)),
                      mediumSpacer,


                      TransportTypeCard(
                        caption: getLocalization().drivein,
                        iconWidget: Icon(Icons.car_crash_sharp, size: 50, color: AppColorScheme.primary),
                        ontap: (){
                          Get.to(const IdentificationTypePage(transportationType: TransportationType.driveIn,));
                        },
                      ),

                      TransportTypeCard(
                        caption: getLocalization().walkIn,
                        iconWidget:Icon(Icons.directions_walk_outlined, size: 50, color: AppColorScheme.primary),
                        ontap: (){
                          Get.to(const IdentificationTypePage(transportationType: TransportationType.walkIn,));
                        },
                      ),



                    ]
                ),
              ),
            ),
          );
        }
      },
    );
  }


  @override
  DashboardBloc initBloc() {
    return locator<DashboardBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  @override
  Widget? floatingActionButton() {
    return FloatingActionButton(
      backgroundColor: AppColorScheme.primary,
        onPressed:()=> getBloc().add(DashBoardPageSwitchEvent(
            pageState: baseBloc.state)),
    child:const HeroIcon(
       HeroIcons.arrowsRightLeft,
      color: Colors.white,) ,);
  }


}


enum TransportationType{
  walkIn,
  driveIn
}
