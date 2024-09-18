
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/colors.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/features/dashboard/presentation/widgets/transport_type_card.dart';
import 'package:secure_access/features/manual_vehicle/presentation/manual_vehicle_page.dart';
import 'package:secure_access/features/scanner/presentation/scanner_page.dart';
import 'package:secure_access/features/vehicle_type/presentation/bloc/vehicle_type_bloc.dart';
import 'package:secure_access/generated/l10n.dart';


class VehicleTypePage extends BasePage {
  const VehicleTypePage({required this.referenceId, super.key});
  final String referenceId;

  @override
  _VehicleTypePageState createState() => _VehicleTypePageState();
}

class _VehicleTypePageState extends BasePageState<VehicleTypePage, VehicleTypeBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<VehicleTypeBloc, VehicleTypePageState>(
      listener: (context, state){},
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(borderRadius),
            child:  Padding(
              padding:  EdgeInsets.all(pagePadding),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallSpacer,
                    Center(child: Text(appLocalizations.vehicle, style: textStyleTitle(),)),
                    smallSpacer,
                    Center(child: Text(appLocalizations.whatTypeOfVehicleAreTheyDriving, style: textStyleDirectives(),)),
                    mediumSpacer,


                    TransportTypeCard(
                      caption: getLocalization().car,
                      iconWidget: Icon(Icons.car_crash_outlined, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to( ScannerPage(referenceId: widget.referenceId,));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().truck,
                      iconWidget: HeroIcon(HeroIcons.truck, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to( ScannerPage(referenceId: widget.referenceId,));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().bike,
                      iconWidget: Icon(Icons.directions_bike_sharp, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to( ScannerPage(referenceId: widget.referenceId,));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().bus,
                      iconWidget: Icon(Icons.bus_alert, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to( ScannerPage(referenceId: widget.referenceId,));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().manual,
                      iconWidget: HeroIcon(HeroIcons.camera, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const ManualVehiclePage());
                      },
                    ),



                  ]
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  VehicleTypeBloc initBloc() {
    return locator<VehicleTypeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
