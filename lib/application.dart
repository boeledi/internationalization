import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:internationalization/blocs/bloc_provider.dart';
import 'package:internationalization/blocs/translations_bloc.dart';
import 'package:internationalization/pages/demo_page.dart';
import 'package:internationalization/utils/global_translations.dart';

class Application extends StatefulWidget {
  @override
  ApplicationState createState() => ApplicationState();
}

class ApplicationState extends State<Application> {
  TranslationsBloc translationsBloc;

  @override
  void initState() {
    super.initState();
    translationsBloc = TranslationsBloc();
  }

  @override
  void dispose() {
    translationsBloc?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<TranslationsBloc>(
      bloc: translationsBloc,
      child: StreamBuilder<String>(
        stream: translationsBloc.currentLanguage,
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
          return MaterialApp(
            title: 'Application Title',

            ///
            /// Multi lingual
            ///
            localizationsDelegates: [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: allTranslations.supportedLocales(),

            home: DemoPage(),
          );
        }
      ),
    );
  }
}