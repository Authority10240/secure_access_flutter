
import 'package:secure_access/core/base_classes/base_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/generated/l10n.dart';

import 'bloc/manual_details_bloc.dart';


class ManualDetailsPage extends BasePage {
  const ManualDetailsPage({super.key});

  @override
  _ManualDetailsPageState createState() => _ManualDetailsPageState();
}

class _ManualDetailsPageState extends BasePageState<ManualDetailsPage, ManualDetailsBloc> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }

    @override
  PreferredSizeWidget? buildAppbar() {
      return  AppBar(iconTheme: const IconThemeData(color: Colors.blue),);
  }

  @override
  Widget buildView(BuildContext context) {
    return BlocConsumer<ManualDetailsBloc, ManualDetailsPageState>(
      listener: (context, state){},
      builder: (context, state) {
         return Container(
          );
      },
    );
  }


  @override
  ManualDetailsBloc initBloc() {
    return locator<ManualDetailsBloc>();
  }

  @override
  AppLocalizations initLocalization() {
    return locator<AppLocalizations>();
  }


}
