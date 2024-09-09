
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:heroicons/heroicons.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:secure_access/core/colors.dart';
import 'package:secure_access/core/hive_storage.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/core/utils.dart';
import 'package:secure_access/core/widgets/custom_form_button.dart';
import 'package:secure_access/core/widgets/custom_text_field.dart';
import 'package:secure_access/core/widgets/preloader_widget.dart';
import 'package:secure_access/features/login/data/data_source/local/hive/sign_in_local_storage/sign_in_local_model.dart';
import 'package:secure_access/features/login/presentation/bloc/login_bloc.dart';
import 'package:secure_access/features/sign_up/presentation/sign_up_page.dart';
import 'package:secure_access/generated/l10n.dart';

import '../data/data_source/local/hive/biometrics_local_storage/model/biometrics_local_model.dart';


class LoginPage extends BasePage {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends BasePageState<LoginPage, LoginBloc> {


  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  late String phoneNumber ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkBiometricsLogin();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
    return null;
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<LoginBloc, LoginPageState>(
      listener: (context, state){

        if(state is SignInClickedState && state.dataState == DataState.loading){
          preloaderWidgetOverlay(context);
        }

        if(state is SignInClickedState && state.dataState == DataState.success){
          Navigator.pop(context);
        }

        if(state is SignInClickedState && state.dataState == DataState.error){
          Navigator.pop(context);
          Get.snackbar(getLocalization().error, state.errorMessage!);
        }
      },
      builder: (context, state) {
         return SingleChildScrollView(
           child: Padding(
             padding:  EdgeInsets.all(borderRadius),
             child: Form(
               key: _formKey,
               child: Padding(
                 padding:  EdgeInsets.all(pagePadding),
                 child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     smallMediumSpacer,
                     Center(child: Text(appLocalizations.welcomeTo, style: textStyleSubHeading(),)),
                     smallSpacer,
                     Center(child: Text(appLocalizations.appName, style: textStyleTitle(),)),
                     largeSpacer,
                     largeSpacer,
                     largeSpacer,
                     Center(child: Text(appLocalizations.signInUsing, style:  textStyleDirectives(),)),
                     smallMediumSpacer,
                     CustomTextField(
                       controller: _usernameController,
                       labelText: getLocalization().emailAddress,
                       validator: (value ) {
                         return value!.isEmpty? getLocalization().pleaseEnterEmailAddress.toString():
                         !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                             .hasMatch(value??"")?getLocalization().pleaseEnterAValidEmailAddress:null;
                       },
                       suffixIcon: HeroIcon(HeroIcons.atSymbol, color: AppColorScheme.primary,),
                     ),
                     smallSpacer,
                     Center(child: Text(appLocalizations.and, style:  textStyleDirectives(),)),
                     smallSpacer,
                     CustomTextField(
                       controller: _passWordController,
                       labelText: getLocalization().password,
                       validator: (value ) {
                         return value!.isEmpty? getLocalization().pleaseEnterAPassword: null;
                       },
                       suffixIcon: HeroIcon(state.visiblePassword!? HeroIcons.eye: HeroIcons.eyeSlash, color: AppColorScheme.primary,),
                     ),
                     smallSpacer,
                     Row(
                         children: [

                           Text(
                             getLocalization().forgotPasswordQ,
                             style: textStyleDescription(),),
                           InkWell(
                             onTap: (){
                               Get.to(const SignUpPage());
                             },
                             child:Text( AppLocalizations.of(context).resetYourPassword,style: textStyleFinePrintUnderlined()),
                           ),
                           const Spacer(),

                         ]
                     ),
                     largeSpacer,

                     CustomFormButton(
                         isActive: true,
                         onPressed: (){
                           if(_formKey.currentState!.validate()){
                             getBloc().add(SignInClickedEvent(
                                 password: _passWordController.text,
                                 username: _usernameController.text));
                           }
                         },
                         buttonText: getLocalization().signIn),
                     smallSpacer,
                     Row(
                         children: [
                           const Spacer(),
                           Text(
                             AppLocalizations.of(context).dontHaveAnAccount,
                             style: textStyleDescription(),),
                           InkWell(
                             onTap: (){
                                Get.to(const SignUpPage());
                             },
                             child:Text( AppLocalizations.of(context).signUp,style: textStyleFinePrintUnderlined()),
                           ),
                           const Spacer(),

                         ]
                     ),

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
  LoginBloc initBloc() {
    return locator<LoginBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }

  

  void checkBiometricsLogin() {
    if (boxBiometrics.isNotEmpty && boxSignIn.isNotEmpty) {
      BiometricsLocalModel biometricsLocalModel = boxBiometrics.get(current);
      SignInLocalModel signInLocalModel = boxSignIn.get(current);
      if (biometricsLocalModel.enabled! && signInLocalModel.signedIn!
      ) {
        isAuthenticated(onSuccess: () {
          boxSignIn.put(current, SignInLocalModel(signedIn: true));

        },
            onError: () {},
            biometricsMessage: getLocalization().authenticateUsingBiometrics);
      }
    }
  }


}
