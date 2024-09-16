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
import 'package:secure_access/features/identification_type/presentation/identification_type_page.dart';
import 'package:secure_access/features/scanner/data/models/scanner_model_response/scanner_continue_clicked_model.dart';
import 'package:secure_access/generated/l10n.dart';
import 'bloc/scanner_bloc.dart';


class ScannerPage extends BasePage {
  const ScannerPage({required this.identificationNumber,super.key});

  final String identificationNumber;



  @override
  _ScannerPageState createState() => _ScannerPageState();
}

class _ScannerPageState extends BasePageState<ScannerPage, ScannerBloc> {

  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _engineController = TextEditingController();
  final TextEditingController _licenseController = TextEditingController();
  final TextEditingController _regNoController = TextEditingController();
  final TextEditingController _vinController = TextEditingController();
  final TextEditingController _yearController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_)async{
      var result = await BarcodeScanner.scan();
      if(result.rawContent.isEmpty){
        Get.back();
       Get.snackbar(getLocalization().noScan, getLocalization().noLicenseDiskScannedTryEnteringVehicleDetailsManually);
      }else {
        getBloc().add(ScanQrEvent(qrCode: result.rawContent));
      }
    });
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<ScannerBloc, ScannerPageState>(
      listener: (context, state)async{
        if(state.dataState == DataState.success && state is ScanQrState){
          _yearController.text = state.year!;
          _descriptionController.text = state.description!;
          _regNoController.text = state.regNo!;
          _vinController.text = state.vin!;
          _engineController.text = state.engine!;
          _licenseController.text = state.licenseNo!;
        }
        
        if(state.dataState == DataState.error && state is ScanQrState){
          Get.snackbar(appLocalizations.error, appLocalizations.invalidLicenseDiskPleaseScanLicenseDiskPresentedOnCarWindShield);
        }

        if(state is ScannerContinueClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
          Get.snackbar(appLocalizations.error, state.errorMessage!);
        }

        if(state is ScannerContinueClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          Get.snackbar(appLocalizations.error, state.errorMessage!);

        }

        if(state is ScannerContinueClickedState && state.dataState == DataState.loading){
          preloaderWidgetOverlay(context);

        }

      },
      builder: (context, state) {
         return (state is ScannerPageInitState)
             ||(state is ScanQrState && state.dataState == DataState.loading)?
             preloaderWidget(): (state is ScanQrState && state.dataState == DataState.error)?
             Padding(padding: EdgeInsets.only(left: pagePadding, right: pagePadding), child: Center(child: CustomFormButton(
                  isActive: true,
                  onPressed: ()async{
                    var result = await BarcodeScanner.scan();
                    if(result.rawContent.isEmpty){
                      Get.back();
                      Get.snackbar(getLocalization().noScan, getLocalization().noLicenseDiskScannedTryEnteringVehicleDetailsManually);
                    }else {
                      getBloc().add(ScanQrEvent(qrCode: result.rawContent));
                    }
                  },
                  buttonText: getLocalization().scanAgain),)):
             SingleChildScrollView(
               child: Padding(padding: EdgeInsets.only(left: pagePadding, right: pagePadding),
                 child:Form( key: _formKey , child:Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   smallMediumSpacer,
                   Center(child: Text(getLocalization().carDetails, style: textStyleSubHeading(),)),
                   smallSpacer,
                   Center(child: Text("${state.make} ${state.model}", style: textStyleTitle(),)),

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
                   Text(appLocalizations.engineNumber, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _engineController,
                     labelText: getLocalization().engineNumber,
                     validator: (value ) {
                     },

                   ),
                   smallMediumSpacer,
                   Text(appLocalizations.vin, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _vinController,
                     labelText: getLocalization().vin,
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
                   Text(appLocalizations.registrationNumber, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _regNoController,
                     labelText: getLocalization().registrationNumber,
                     validator: (value ) {
                     },

                   ),
                   smallMediumSpacer,
                   Text(appLocalizations.expirationYear, style:  textStyleDescription(),),
                   labelSpacer,
                   CustomTextField(
                     controller: _yearController,
                     labelText: getLocalization().expirationYear,
                     validator: (value ) {
                     },

                   ),
                   largeSpacer,
                   CustomFormButton(
                       isActive: true,
                       onPressed: (){
                         if(_formKey.currentState!.validate()){
                           getBloc().add(ScannerContinueClickedEvent(
                               scannerContinueClickedModel: ScannerContinueClickedModel(
                                 identificationNumber: widget.identificationNumber,
                                   engineNumber: _engineController.text.trim(),
                                   licenseNumber: _licenseController.text.trim(),
                                   regNumber: _regNoController.text.trim(),
                                   vinNumber: _vinController.text.trim(),
                                   expiryYear: _yearController.text.trim(),
                                   make: state.make,
                                   model: state.model)));
                         }
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
  ScannerBloc initBloc() {
    return locator<ScannerBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
