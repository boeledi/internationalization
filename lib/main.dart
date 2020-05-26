import 'package:flutter/widgets.dart';
import 'package:internationalization/application.dart';
import 'package:internationalization/utils/global_translations.dart';

//
// Update iOS app bundle to run on iOS
//
void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize the translations module
  await allTranslations.init();

  // Start the application
  runApp(Application());
}
