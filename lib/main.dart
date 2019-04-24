
import 'package:flutter/widgets.dart';
import 'package:internationalization/application.dart';
import 'package:internationalization/utils/global_translations.dart';

void main() async {
  // Initialize the translations module
  await allTranslations.init();

  // Start the application
  runApp(Application());
}
