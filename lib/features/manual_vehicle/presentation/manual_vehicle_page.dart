
import 'package:get/get.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/core/widgets/custom_form_button.dart';
import 'package:secure_access/core/widgets/custom_text_field.dart';
import 'package:secure_access/core/widgets/preloader_widget.dart';
import 'package:secure_access/features/dashboard/presentation/dashboard_page.dart';
import 'package:secure_access/features/manual_vehicle/data/models/manual_vehicle_model_response/manual_vehicle_continue_clicked_model.dart';
import 'package:secure_access/generated/l10n.dart';

import 'bloc/manual_vehicle_bloc.dart';



class ManualVehiclePage extends BasePage {
  const ManualVehiclePage({required this.referenceId, super.key});

  final String referenceId;

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
      return  AppBar(iconTheme: const IconThemeData(color: Colors.blue),);
  }

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _makeController = TextEditingController();
  final TextEditingController _modelController = TextEditingController();
  final TextEditingController _colorController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<ManualVehicleBloc, ManualVehiclePageState>(
      listener: (context, state){
        if(state is ManualVehicleContinueClickedState && state.dataState == DataState.loading){
          preloaderWidgetOverlay(context);
        }

        if(state is ManualVehicleContinueClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          Get.snackbar(appLocalizations.error, state.errorMessage!);

        }

        if(state is ManualVehicleContinueClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          Get.snackbar(appLocalizations.visitationLoggedSuccessfully, state.referenceId!);
          Get.offAll(const DashboardPage());
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(borderRadius),
            child:  Padding(
              padding:  EdgeInsets.all(pagePadding),
              child: Form(key: _formKey ,child:Column(
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
                          if(_formKey.currentState!.validate()){
                            getBloc().add(ManualVehicleContinueClickedEvent(
                                manualVehicleContinueClickedModel:
                                ManualVehicleContinueClickedModel(
                                    engineNumber: "",
                                    licenseNumber: _licenseController.text.trim(),
                                    regNumber: "",
                                    vinNumber: "",
                                    expiryYear: "",
                                    make: _makeController.text.trim(),
                                    model:_modelController.text.trim(),
                                    identificationNumber: widget.referenceId,
                                color: _colorController.text.trim())));
                          }
                        },
                        buttonText: getLocalization().wcontinue),



                  ]
              ),
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
