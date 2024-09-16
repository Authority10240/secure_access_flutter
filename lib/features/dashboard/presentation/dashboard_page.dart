
import 'package:heroicons/heroicons.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/colors.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/features/dashboard/presentation/widgets/transport_type_card.dart';
import 'package:secure_access/features/identification_type/presentation/identification_type_page.dart';
import 'package:secure_access/features/vehicle_type/presentation/vehicle_type_page.dart';
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

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<DashboardBloc, DashboardPageState>(
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
                        Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                      smallSpacer,
                      Center(child: Text(appLocalizations.complexName, style: textStyleTitle(),)),
                      smallSpacer,
                      Center(child: Text(appLocalizations.whoIsVisitingToday, style: textStyleDirectives(),)),
                      mediumSpacer,


                      TransportTypeCard(
                        caption: getLocalization().vehicle,
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


}

enum TransportationType{
  walkIn,
  driveIn
}
