
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
import 'package:secure_access/features/person_details/data/models/person_details_model_response/person_details_continue_clicked_model.dart';
import 'package:secure_access/features/person_details/presentation/bloc/person_details_bloc.dart';
import 'package:secure_access/features/vehicle_type/presentation/vehicle_type_page.dart';
import 'package:secure_access/generated/l10n.dart';


enum IdentificationType{
  id,
  passport,
  license,
  manual
}
class PersonDetailsPage extends BasePage {
  const PersonDetailsPage({required this.transportationType,required this.identificationType,super.key});
  final TransportationType transportationType;
  final IdentificationType identificationType;

  @override
  _PersonDetailsPageState createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends BasePageState<PersonDetailsPage, PersonDetailsBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _idNumberController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<PersonDetailsBloc, PersonDetailsPageState>(
      listener: (context, state){

        if(state is PersonalDetailsContinueClickedState && state.dataState == DataState.loading){
          preloaderWidgetOverlay(context);
        }

        if(state is PersonalDetailsContinueClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          Get.snackbar(appLocalizations.error, state.errorMessage!);
        }

        if(state is PersonalDetailsContinueClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          if(widget.transportationType == TransportationType.walkIn){
            Get.offAll(const DashboardPage());
          }else{
            Get.off(VehicleTypePage(identificationNumber: state.referenceId!));
          }
        }
      },
      builder: (context, state) {
        return SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.all(borderRadius),
            child:  Padding(
              padding:  EdgeInsets.all(pagePadding),
              child:Form(key: _formKey,child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    smallSpacer,
                    Center(child: Text(widget.identificationType == IdentificationType.id?
                    appLocalizations.captureVisitorsIDDetails:
                    widget.identificationType == IdentificationType.license?
                    appLocalizations.captureVisitorsLicenseDetails:
                    widget.identificationType == IdentificationType.passport?
                    appLocalizations.captureVisitorsPassportDetails:"", style: textStyleTitle(),)),
                    mediumSpacer,
                    Text(appLocalizations.name, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _nameController,
                      labelText: getLocalization().name,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.surname, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _surnameController,
                      labelText: getLocalization().surname,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(widget.identificationType == IdentificationType.id?
                    appLocalizations.id:
                    widget.identificationType == IdentificationType.license?
                    appLocalizations.license:
                    widget.identificationType == IdentificationType.passport?
                    appLocalizations.passport:"", style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _idNumberController,
                      labelText: widget.identificationType == IdentificationType.id?
                      appLocalizations.id:
                      widget.identificationType == IdentificationType.license?
                      appLocalizations.license:
                      widget.identificationType == IdentificationType.passport?
                      appLocalizations.passport:"",
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.emailAddress, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _emailController,
                      labelText: getLocalization().emailAddress,
                      validator: (value ) {
                      },

                    ),
                    smallMediumSpacer,
                    Text(appLocalizations.phoneNumber, style:  textStyleDescription(),),
                    labelSpacer,
                    CustomTextField(
                      controller: _phoneController,
                      labelText: getLocalization().phoneNumber,
                      validator: (value ) {
                      },

                    ),

                    largeSpacer,
                    CustomFormButton(
                        isActive: true,
                        onPressed: (){
                          getBloc().add(PersonDetailsContinueClickedEvent(
                              personDetailsContinueClickedModel:PersonDetailsContinueClickedModel(
                                dateTime: DateTime.now(),
                                  identificationNumber: _idNumberController.text.trim(),
                                  identificationType: IdentificationType.manual.toString() ,
                                  firstName: _nameController.text.trim(),
                                  middleName:_surnameController.text.trim(),
                                  lastName: _surnameController.text.trim(),
                                  transportationType: widget.transportationType.toString(),
                                  mobileNumber: _phoneController.text.trim(),
                                  email: _emailController.text.trim()) ));
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
  PersonDetailsBloc initBloc() {
    return locator<PersonDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
