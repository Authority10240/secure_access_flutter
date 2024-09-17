
import 'package:barcode_scan2/barcode_scan2.dart';
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
import 'package:secure_access/features/person_details/presentation/person_details_page.dart';
import 'package:secure_access/features/personnel_scan/data/models/personnel_scan_model_response/personnel_scan_continue_clicked_model.dart';
import 'package:secure_access/generated/l10n.dart';

import 'bloc/personnel_scan_bloc.dart';


class PersonnelScanPage extends BasePage {
  const PersonnelScanPage({super.key,
    required this.identificationType
  });
  final IdentificationType identificationType;


  @override
  _PersonnelScanPageState createState() => _PersonnelScanPageState();
}

class _PersonnelScanPageState extends BasePageState<PersonnelScanPage, PersonnelScanBloc> {

  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _middleNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      var result = await BarcodeScanner.scan();
      if(result.rawContent.isEmpty){
        Get.back();
        Get.snackbar(getLocalization().noScan, getLocalization().noIdentificationDocumentScanned);
      }else {
        getBloc().add(ScanQrEvent(qrCode: result.rawContent, identificationType: widget.identificationType));
      }
    });

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<PersonnelScanBloc, PersonnelScanPageState>(
      listener: (context, state){

        if(state.dataState == DataState.error && state is ScanQrState){
          Get.snackbar(appLocalizations.error, widget.identificationType == IdentificationType.id?appLocalizations.invalidIdCode: appLocalizations.invalidPassport);
        }
      },
      builder: (context, state) {
         return (state is PersonnelScanPageInitState)
             ||(state is ScanQrState && state.dataState == DataState.loading)?
         preloaderWidget(): (state is ScanQrState && state.dataState == DataState.error)?
         Padding(padding: EdgeInsets.only(left: pagePadding, right: pagePadding), child: Center(child: CustomFormButton(
             isActive: true,
             onPressed: ()async{
               var result = await BarcodeScanner.scan();
               if(result.rawContent.isEmpty){
                 Get.back();
                 Get.snackbar(getLocalization().noScan, getLocalization().noIdentificationDocumentScanned);
               }else {
                 getBloc().add(ScanQrEvent(qrCode: result.rawContent,identificationType:  widget.identificationType));
               }
             },
             buttonText: getLocalization().scanAgain),)):
         SingleChildScrollView(
             child: Padding(padding: EdgeInsets.only(left: pagePadding, right: pagePadding),
               child:Form(key: _formKey,child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   smallMediumSpacer,
                   Center(child: Text(getLocalization().personnelDetails, style: textStyleSubHeading(),)),
                   smallSpacer,
                   Center(child: Text("${state.idNUmber}", style: textStyleTitle(),)),

                   smallMediumSpacer,
                   Text(appLocalizations.firstName, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _firstNameController,
                     labelText: getLocalization().firstName,
                     validator: (value ) {
                     },

                   ),
                   smallMediumSpacer,
                   Text(appLocalizations.middleName, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _middleNameController,
                     labelText: getLocalization().middleName,
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
                   Text(appLocalizations.mobileNumber, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _mobileController,
                     labelText: getLocalization().mobileNumber,
                     validator: (value ) {
                     },
                   ),

                   largeSpacer,
                   CustomFormButton(
                       isActive: true,
                       onPressed: (){
                         getBloc().add(PersonnelScanContinueClickedEvent(
                             personnelScanContinueClickedModel:
                         PersonnelScanContinueClickedModel(
                           dateTime: DateTime.now(),
                             identificationNumber: state.idNUmber,
                             identificationType: widget.identificationType == IdentificationType.id ? "id": "passport",
                             firstName: _firstNameController.text.trim(),
                             middleName: _middleNameController.text.trim(),
                             lastName: _lastNameController.text.trim(),
                             transportationType: "",
                             mobileNumber: _mobileController.text.trim(),
                             email: _emailController.text.trim())
                         )
                         );
                       },
                       buttonText: getLocalization().wcontinue),

                 ],
               ),
             ),
             )
         );
      },
    );
  }


  @override
  PersonnelScanBloc initBloc() {
    return locator<PersonnelScanBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
