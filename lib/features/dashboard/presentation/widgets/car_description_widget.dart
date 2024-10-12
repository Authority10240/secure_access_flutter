import 'package:flutter/material.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/core/widgets/custom_form_button.dart';
import 'package:secure_access/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_visitations_vehicle_model.dart';
import 'package:get/get.dart';
import 'package:secure_access/features/dashboard/data/models/dashboard_model_response/dashboard_page_load_vistations_model.dart';
import 'package:secure_access/generated/l10n.dart';
void carDescriptionDialog({
  required DashboardPageLoadVisitationsVehicleModel vehicle,
  required DashboardPageLoadVisitationsModel visitation,
  required AppLocalizations appLocalizations}){

  Get.dialog(
      barrierDismissible: false,
      Dialog(
        child: Card(elevation: 11,
            child: Container(
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      smallSpacer,
                      Center(child: Text('${visitation?.firstName} ${visitation?.lastName}', style: textStyleTitle(),)),
                      smallSpacer,
                      Center(child: Text(appLocalizations.wasDrivingA, style: textStyleDirectives(),)),
                      mediumSpacer,
                      Text(appLocalizations.make, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(vehicle?.make??'', style:  textStyleDescription(),),
                      smallMediumSpacer,
                      Text(appLocalizations.model, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(vehicle?.model??'', style:  textStyleDescription(),),

                      smallMediumSpacer,
                      Text(appLocalizations.license, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(vehicle?.licenseNumber??''!, style:  textStyleDescription(),),

                      smallMediumSpacer,
                      Text(appLocalizations.description, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(vehicle?.regNumber??'', style:  textStyleDescription(),),

                      smallMediumSpacer,
                      Text(appLocalizations.color, style:  textStyleDirectives(),),
                      labelSpacer,
                      Text(vehicle?.color??'', style:  textStyleDescription(),),

                      largeSpacer,
                      CustomFormButton(
                          isActive: true,
                          onPressed: ()=> Get.back(),
                          buttonText: appLocalizations.back),

                    ]
                ),
              ),
            )),
      )
  );
}