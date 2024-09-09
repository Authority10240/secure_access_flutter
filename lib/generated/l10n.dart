// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class AppLocalizations {
  AppLocalizations();

  static AppLocalizations? _current;

  static AppLocalizations get current {
    assert(_current != null,
        'No instance of AppLocalizations was loaded. Try to initialize the AppLocalizations delegate before accessing AppLocalizations.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<AppLocalizations> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = AppLocalizations();
      AppLocalizations._current = instance;

      return instance;
    });
  }

  static AppLocalizations of(BuildContext context) {
    final instance = AppLocalizations.maybeOf(context);
    assert(instance != null,
        'No instance of AppLocalizations present in the widget tree. Did you add AppLocalizations.delegate in localizationsDelegates?');
    return instance!;
  }

  static AppLocalizations? maybeOf(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  /// `Authenticate using biometrics `
  String get authenticateUsingBiometrics {
    return Intl.message(
      'Authenticate using biometrics ',
      name: 'authenticateUsingBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Welcome to `
  String get welcomeTo {
    return Intl.message(
      'Welcome to ',
      name: 'welcomeTo',
      desc: '',
      args: [],
    );
  }

  /// `Secure Access `
  String get appName {
    return Intl.message(
      'Secure Access ',
      name: 'appName',
      desc: '',
      args: [],
    );
  }

  /// `Sign In `
  String get signIn {
    return Intl.message(
      'Sign In ',
      name: 'signIn',
      desc: '',
      args: [],
    );
  }

  /// `Sign Up `
  String get signUp {
    return Intl.message(
      'Sign Up ',
      name: 'signUp',
      desc: '',
      args: [],
    );
  }

  /// `Username `
  String get username {
    return Intl.message(
      'Username ',
      name: 'username',
      desc: '',
      args: [],
    );
  }

  /// `Email Address `
  String get emailAddress {
    return Intl.message(
      'Email Address ',
      name: 'emailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Password `
  String get password {
    return Intl.message(
      'Password ',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password `
  String get forgotPassword {
    return Intl.message(
      'Forgot Password ',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dontHaveAnAccount {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dontHaveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password? `
  String get forgotPasswordQ {
    return Intl.message(
      'Forgot Password? ',
      name: 'forgotPasswordQ',
      desc: '',
      args: [],
    );
  }

  /// `Confirm Password `
  String get confirmPassword {
    return Intl.message(
      'Confirm Password ',
      name: 'confirmPassword',
      desc: '',
      args: [],
    );
  }

  /// `Have an account? `
  String get haveAnAccount {
    return Intl.message(
      'Have an account? ',
      name: 'haveAnAccount',
      desc: '',
      args: [],
    );
  }

  /// `Terms & Conditions `
  String get termsAndConditions {
    return Intl.message(
      'Terms & Conditions ',
      name: 'termsAndConditions',
      desc: '',
      args: [],
    );
  }

  // skipped getter for the 'continue.' key

  /// `Submit `
  String get submit {
    return Intl.message(
      'Submit ',
      name: 'submit',
      desc: '',
      args: [],
    );
  }

  /// `Forgot your Password? `
  String get forgotYourPassword {
    return Intl.message(
      'Forgot your Password? ',
      name: 'forgotYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset Your Password `
  String get resetYourPassword {
    return Intl.message(
      'Reset Your Password ',
      name: 'resetYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Enter a new password below to change your password `
  String get enterANewPasswordBelowToChangeYourPassword {
    return Intl.message(
      'Enter a new password below to change your password ',
      name: 'enterANewPasswordBelowToChangeYourPassword',
      desc: '',
      args: [],
    );
  }

  /// `Reset `
  String get reset {
    return Intl.message(
      'Reset ',
      name: 'reset',
      desc: '',
      args: [],
    );
  }

  /// `New Password `
  String get newPassword {
    return Intl.message(
      'New Password ',
      name: 'newPassword',
      desc: '',
      args: [],
    );
  }

  /// `View All`
  String get viewAll {
    return Intl.message(
      'View All',
      name: 'viewAll',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email address`
  String get pleaseEnterUserName {
    return Intl.message(
      'Please enter an email address',
      name: 'pleaseEnterUserName',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a password`
  String get pleaseEnterAPassword {
    return Intl.message(
      'Please enter a password',
      name: 'pleaseEnterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please re-enter a password`
  String get pleaseReenterAPassword {
    return Intl.message(
      'Please re-enter a password',
      name: 'pleaseReenterAPassword',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwordsDoNotMatch {
    return Intl.message(
      'Passwords do not match',
      name: 'passwordsDoNotMatch',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get wcontinue {
    return Intl.message(
      'Continue',
      name: 'wcontinue',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Surname`
  String get surname {
    return Intl.message(
      'Surname',
      name: 'surname',
      desc: '',
      args: [],
    );
  }

  /// `Error`
  String get error {
    return Intl.message(
      'Error',
      name: 'error',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Personal details`
  String get personalDetails {
    return Intl.message(
      'Personal details',
      name: 'personalDetails',
      desc: '',
      args: [],
    );
  }

  /// `Settings`
  String get settings {
    return Intl.message(
      'Settings',
      name: 'settings',
      desc: '',
      args: [],
    );
  }

  /// `Log out`
  String get logout {
    return Intl.message(
      'Log out',
      name: 'logout',
      desc: '',
      args: [],
    );
  }

  /// `Enable biometrics?`
  String get enableBiometrics {
    return Intl.message(
      'Enable biometrics?',
      name: 'enableBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Biometrics`
  String get biometrics {
    return Intl.message(
      'Biometrics',
      name: 'biometrics',
      desc: '',
      args: [],
    );
  }

  /// `Enable/Disable Biometrics`
  String get enableDisableBiometrics {
    return Intl.message(
      'Enable/Disable Biometrics',
      name: 'enableDisableBiometrics',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using phone number`
  String get signInUsingPhoneNumber {
    return Intl.message(
      'Sign in using phone number',
      name: 'signInUsingPhoneNumber',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using email address`
  String get signinUsingEmailAddress {
    return Intl.message(
      'Sign in using email address',
      name: 'signinUsingEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `and`
  String get and {
    return Intl.message(
      'and',
      name: 'and',
      desc: '',
      args: [],
    );
  }

  /// `Sign in using`
  String get signInUsing {
    return Intl.message(
      'Sign in using',
      name: 'signInUsing',
      desc: '',
      args: [],
    );
  }

  /// `Create your secure account`
  String get createYourSecureAccount {
    return Intl.message(
      'Create your secure account',
      name: 'createYourSecureAccount',
      desc: '',
      args: [],
    );
  }

  /// `Please enter an email address`
  String get pleaseEnterEmailAddress {
    return Intl.message(
      'Please enter an email address',
      name: 'pleaseEnterEmailAddress',
      desc: '',
      args: [],
    );
  }

  /// `Please enter a valid email address`
  String get pleaseEnterAValidEmailAddress {
    return Intl.message(
      'Please enter a valid email address',
      name: 'pleaseEnterAValidEmailAddress',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalizations> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<AppLocalizations> load(Locale locale) => AppLocalizations.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
