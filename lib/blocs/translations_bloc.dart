import 'dart:async';
import 'dart:ui';

import 'package:internationalization/blocs/bloc_provider.dart';
import 'package:internationalization/utils/global_translations.dart';
import 'package:internationalization/utils/preferences.dart';

class TranslationsBloc implements BlocBase {
  StreamController<String> _languageController = StreamController<String>();
  Stream<String> get currentLanguage => _languageController.stream;

  StreamController<Locale> _localeController = StreamController<Locale>();
  Stream<Locale> get currentLocale => _localeController.stream;

  @override
  void dispose() {
    _languageController?.close();
    _localeController?.close();
  }

  void setNewLanguage(String newLanguage) async {
    // Save the selected language as a user preference
    await preferences.setPreferredLanguage(newLanguage);
    
    // Notification the translations module about the new language
    await allTranslations.setNewLanguage(newLanguage);

    _languageController.sink.add(newLanguage);
    _localeController.sink.add(allTranslations.locale);
  }
}