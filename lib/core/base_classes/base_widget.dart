import 'package:flutter/material.dart';
import 'package:secure_access/core/locator.dart';
import 'package:secure_access/generated/l10n.dart';
import 'base_bloc.dart';
import 'base_state.dart';

abstract class BaseWidget extends StatefulWidget{
  const BaseWidget({Key? key}) : super(key:key);
}

abstract class BaseWidgetState<T extends BaseWidget , B extends BaseBloc > extends State<T>{
  late B baseBloc;

  late AppLocalizations appLocalizations;


  @mustCallSuper
  void onBlocStateChanged(BaseBlocPrimaryState state) => state.call(context);

  @override
  void initState() {
    baseBloc = initBloc();
    appLocalizations = locator<AppLocalizations>();
    baseBloc.baseState?.listen(onBlocStateChanged);
    super.initState();
  }

  B getBloc() => baseBloc;

  B initBloc();

  AppLocalizations getLocalization() => appLocalizations;

  @override
  void dispose(){
    getBloc().dispose();
    super.dispose();
  }
}