import 'package:flutter/material.dart';

class BaseState{
  DataState dataState;
  String? errorMessage;
  String? errorCode;

  BaseState({
    this.dataState = DataState.init,
    this.errorMessage,
    this.errorCode
});
}

enum DataState{
  init,
  loading,
  reloading,
  success,
  error
}

abstract class BaseBlocPrimaryState{
  void call(BuildContext context);
}