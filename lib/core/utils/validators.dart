import 'package:ecommerce/l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce/main.dart'; // أو المكان اللي فيه navigatorKey

class AppValidators {
  static BuildContext get _context => navigatorKey.currentContext!;

  static String? validateEmail(String? value) {
    final emailRegex = RegExp(
      r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
    );

    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (!emailRegex.hasMatch(value)) {
      return AppLocalizations.of(_context)!.invalidEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    RegExp passwordRegex = RegExp(r'^.{6,}$');

    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (!passwordRegex.hasMatch(value)) {
      return AppLocalizations.of(_context)!.passwordLength;
    }
    return null;
  }

  static String? validateConfirmPassword(String? value, String? password) {
    if (value == null || value.isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (value != password) {
      return AppLocalizations.of(_context)!.passwordMismatch;
    }
    return null;
  }

  static String? validateUserNme(String? value) {
    RegExp userNameRegex = RegExp(r'^[a-zA-Z0-9_]{3,}$');

    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (!userNameRegex.hasMatch(value)) {
      return AppLocalizations.of(_context)!.usernameLength;
    }
    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (int.tryParse(value.trim()) == null) {
      return AppLocalizations.of(_context)!.invalidPhoneNumber;
    } else if (value.trim().length != 11) {
      return AppLocalizations.of(_context)!.phoneLength;
    }
    return null;
  }

  static String? validateFullName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    }
    return null;
  }

  static String? validateAddress(String? value) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (value.trim().length < 3) {
      return AppLocalizations.of(_context)!.addressLength;
    }
    return null;
  }

  static String? validatePostalCode(String? value) {
    final postalRegex = RegExp(r'^[0-9]{4,10}$');

    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.fieldRequired;
    } else if (!postalRegex.hasMatch(value.trim())) {
      return AppLocalizations.of(_context)!.invalidPostalCode;
    }
    return null;
  }

  static String? validateDropdown(String? value, String fieldName) {
    if (value == null || value.trim().isEmpty) {
      return AppLocalizations.of(_context)!.selectField(fieldName);
    }
    return null;
  }
}
