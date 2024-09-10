
import 'package:get/get.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/colors.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/core/widgets/custom_form_button.dart';
import 'package:secure_access/core/widgets/custom_text_field.dart';
import 'package:secure_access/features/dashboard/presentation/widgets/transport_type_card.dart';
import 'package:secure_access/features/identification_type/presentation/identification_type_page.dart';
import 'package:secure_access/generated/l10n.dart';
import 'package:image_picker/image_picker.dart';
import 'bloc/manual_vehicle_bloc.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ManualVehiclePage extends BasePage {
  const ManualVehiclePage({super.key});

  @override
  _ManualVehiclePageState createState() => _ManualVehiclePageState();
}

class _ManualVehiclePageState extends BasePageState<ManualVehiclePage, ManualVehicleBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();


  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<ManualVehicleBloc, ManualVehiclePageState>(
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
                    Center(child: Text(appLocalizations.whatTypeOfVehicleAreTheyDriving, style: textStyleTitle(),)),
                    smallSpacer,
                    Center(child: Text(appLocalizations.visitorIsDrivingA, style: textStyleDirectives(),)),
                    mediumSpacer,
                    Text(appLocalizations.make, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _makeController,
                      labelText: getLocalization().make,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.model, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _modelController,
                      labelText: getLocalization().model,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.license, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _licenseController,
                      labelText: getLocalization().license,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.description, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _descriptionController,
                      labelText: getLocalization().description,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.color, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _colorController,
                      labelText: getLocalization().color,
                      validator: (value ) {
                      },

                    ),

                    largeSpacer,
                    CustomFormButton(
                        isActive: true,
                        onPressed: (){
                          Get.to(const IdentificationTypePage());
                        },
                        buttonText: getLocalization().wcontinue),



                  ]
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  ManualVehicleBloc initBloc() {
    return locator<ManualVehicleBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
