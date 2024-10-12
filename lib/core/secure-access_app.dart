

import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/features/login/presentation/login_page.dart';
import 'package:secure_access/generated/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'app_locals.dart';
import 'hive_storage.dart';

class SecureAccessApp{

  static Future<void> appInit() async{
    initializeDateFormatting();
    setupLocators();
    await initHive();
    run();
  }

 static  void run(){
    return runApp(
        GetMaterialApp(
          localizationsDelegates:  [
            AppLocalizations.delegate,
          ],
          supportedLocales:  AppSupportedLocals.appSupportedLocals,
          home: LoginPage(),
        )
    );
  }
}