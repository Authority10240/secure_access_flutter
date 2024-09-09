
import 'package:heroicons/heroicons.dart';
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/base_classes/base_state.dart';
import 'package:secure_access/core/colors.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/core/sizes.dart';
import 'package:secure_access/core/text_styles.dart';
import 'package:secure_access/core/widgets/custom_form_button.dart';
import 'package:secure_access/core/widgets/custom_text_field.dart';
import 'package:secure_access/core/widgets/preloader_widget.dart';
import 'package:secure_access/features/sign_up/presentation/bloc/sign_up_bloc.dart';
import 'package:secure_access/generated/l10n.dart';


class SignUpPage extends BasePage {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends BasePageState<SignUpPage, SignUpBloc> {

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _confirmPasswordController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  late String phoneNumber ;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

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
    return BlocConsumer<SignUpBloc, SignUpPageState>(
      listener: (context, state){
        if(state is SignUpPageState && state.dataState == DataState.loading){
          preloaderWidgetOverlay(context);
        }

        if(state is SignUpPageState && state.dataState == DataState.success){
          Navigator.pop(context);
        }

        if(state is SignUpPageState && state.dataState == DataState.error){
          Navigator.pop(context);
          Get.snackbar(getLocalization().error, state.errorMessage!);
        }

      },
      builder: (context, state) {
         return  SingleChildScrollView(
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
                       Center(child: Text(appLocalizations.appName, style: textStyleTitle(),)),
                       smallSpacer,
                       Center(child: Text(appLocalizations.createYourSecureAccount, style: textStyleSubHeading(),)),
                       largeSpacer,
                       largeSpacer,
                       largeSpacer,
                       Center(child: Text(appLocalizations.signUp, style:  textStyleDirectives(),)),
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
                           String? errors = '';
                           if(value!.isEmpty){
                             return getLocalization().pleaseEnterAPassword;
                           }
                           if(!RegExp(r"^(?=.*[A-Z])")
                               .hasMatch(value??"")){
                                errors = "Should contain at least one upper case";
                           }
                           if(!RegExp(r"^(?=.*?[a-z])")
                               .hasMatch(value??"")){
                             errors = "$errors \nShould contain at least one lower case";
                           }
                           if(!RegExp(r"^(?=.*?[0-9]) ")
                               .hasMatch(value??"")){
                             errors = "$errors \nShould contain at least one digit";
                           }
                           if(!RegExp(r"^(?=.*?[!@#\$&*~])")
                               .hasMatch(value??"")){
                             errors = "$errors \nShould contain at least one Special character";
                           }
                           if(!RegExp(r".{8,}")
                               .hasMatch(value??"")){
                             errors = "$errors \nMust be at least 8 characters in length";
                           }

                           return errors.isEmpty ? null : errors;

                         },
                         suffixIcon: HeroIcon(state.visiblePassword!? HeroIcons.eye: HeroIcons.eyeSlash, color: AppColorScheme.primary,),
                       ),
                       smallSpacer,
                       CustomTextField(
                         controller: _confirmPasswordController,
                         labelText: getLocalization().confirmPassword,
                         validator: (value ) {
                          return value != _passWordController.text?
                               getLocalization().passwordsDoNotMatch: null;
                         },
                         suffixIcon: HeroIcon(state.visiblePassword!? HeroIcons.eye: HeroIcons.eyeSlash, color: AppColorScheme.primary,),
                       ),
                       largeSpacer,

                       CustomFormButton(isActive: true, onPressed: (){
                         if(_formKey.currentState!.validate()){
                           getBloc().add(SignUpClickedEvent(
                               password: _passWordController.text,
                               username: _usernameController.text));
                         }
                       }, buttonText: getLocalization().signUp),
                       smallSpacer,
                       Row(
                           children: [
                             const Spacer(),
                             Text(
                               AppLocalizations.of(context).haveAnAccount,
                               style: textStyleDescription(),),
                             InkWell(
                               onTap: (){
                                 Get.back();
                               },
                               child:Text( AppLocalizations.of(context).signIn,style: textStyleFinePrintUnderlined()),
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
  SignUpBloc initBloc() {
    return locator<SignUpBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
