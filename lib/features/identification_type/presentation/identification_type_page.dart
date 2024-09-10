
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
import 'package:secure_access/features/manual_details/presentation/manual_details_page.dart';
import 'package:secure_access/features/person_details/presentation/person_details_page.dart';
import 'package:secure_access/generated/l10n.dart';

import 'bloc/identification_type_bloc.dart';


class IdentificationTypePage extends BasePage {
  const IdentificationTypePage({super.key});

  @override
  _IdentificationTypePageState createState() => _IdentificationTypePageState();
}

class _IdentificationTypePageState extends BasePageState<IdentificationTypePage, IdentificationTypeBloc> {

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
    return BlocConsumer<IdentificationTypeBloc, IdentificationTypePageState>(
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

                    Center(child: Text(appLocalizations.person, style: textStyleTitle(),)),
                    smallSpacer,
                    Center(child: Text(appLocalizations.whatKindOfIdentificationDoTheyHave, style: textStyleDirectives(),)),
                    mediumSpacer,


                    TransportTypeCard(
                      caption: getLocalization().id,
                      iconWidget: Icon(Icons.perm_identity, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const PersonDetailsPage(identificationType: IdentificationType.id,));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().license,
                      iconWidget: HeroIcon(HeroIcons.creditCard, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const PersonDetailsPage(identificationType: IdentificationType.license));
                      },
                    ),

                    TransportTypeCard(
                      caption: getLocalization().passport,
                      iconWidget: HeroIcon(HeroIcons.wallet, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const PersonDetailsPage(identificationType: IdentificationType.passport));
                      },
                    ),

                  /*  TransportTypeCard(
                      caption: getLocalization().manual,
                      iconWidget: HeroIcon(HeroIcons.camera, size: 50, color: AppColorScheme.primary),
                      ontap: (){
                        Get.to(const ManualDetailsPage());
                      },
                    ),*/



                  ]
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  IdentificationTypeBloc initBloc() {
    return locator<IdentificationTypeBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
