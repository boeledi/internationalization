import 'package:flutter/material.dart';
import 'package:internationalization/blocs/bloc_provider.dart';
import 'package:internationalization/blocs/translations_bloc.dart';
import 'package:internationalization/utils/global_translations.dart';

class DemoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //
    // Retrieves the BLoC that handles the changes to the current language
    //
    final TranslationsBloc translationsBloc =
        BlocProvider.of<TranslationsBloc>(context);

    //
    // Retrieves the title of the page, from the translations
    //
    final String pageTitle = allTranslations.text("demoPage.title");

    //
    // Retrieves the caption of the button
    //
    final String otherLanguage =
        allTranslations.currentLanguage == 'fr' ? 'en' : 'fr';
    final String buttonCaption = allTranslations.text(
        'demoPage.buttons.${otherLanguage == 'en' ? 'english' : 'french'}');

    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            //
            // Button to switch from one language to the other
            //
            RaisedButton(
              child: Text(buttonCaption),
              onPressed: () {
                //
                // Switch the working language
                //
                translationsBloc.setNewLanguage(otherLanguage);
              },
            ),

            // Separation
            Divider(),

            //
            // String with parameters
            //
            Text(allTranslations.text(
              "demoPage.tests.string_values", 
              values:{
                "name": 'Didier', 
                "country": allTranslations.text('demoPage.values.my_country'),
              },
            )),

            // Separation
            Divider(),

            //
            // Plural / Singular
            //
            Text(allTranslations.text(
              "demoPage.tests.string_plural",
              plural: 3,
            )),

            // Separation
            Divider(),

            //
            // Plural / Singular
            //
            Text(allTranslations.text(
              "demoPage.tests.string_plural",
              plural: 0,
            )),

            // Separation
            Divider(),

            //
            // Gender
            //
            Text(allTranslations.text(
              "demoPage.tests.string_gender",
              gender: GlobalTranslationsGender.male,
            )),

            // Separation
            Divider(),

            //
            // Gender + Values
            //
            Text(allTranslations.text(
              "demoPage.tests.string_gender_values",
              gender: GlobalTranslationsGender.male,
              values: {
                "size": "1.80m"
              }
            )),

          ],
        ),
      ),
    );
  }
}
