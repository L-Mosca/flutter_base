import 'package:flutter/widgets.dart';
import 'package:flutter_base_project/localization/strings/app_localization.dart';
import 'package:flutter_base_project/localization/delegate/app_localization_delegate.dart';

extension LocalizationContextExtensions on BuildContext {
  AppLocalization get appLocalizations {
    return AppLocalizationDelegate.of(this);
  }
}

extension LocalizationStateExtensions on State {
  AppLocalization get appLocalizations {
    return context.appLocalizations;
  }
}