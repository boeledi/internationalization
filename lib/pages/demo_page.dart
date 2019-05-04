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

/* -- Regular way
    final MaterialLocalizations localizations = MaterialLocalizations.of(context);
    final Locale currentLocale = Localizations.localeOf(context);
    final NumberFormat format = NumberFormat.compact(locale: currentLocale.languageCode);
-- */
    String stringSize = allTranslations.valueToString(1.8, format: GlobalTranslationsNumberFormat.normal, numberOfDecimals: 2);

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
              child: Text('==> $buttonCaption'),
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
                "size": stringSize + "m",
              }
            )),

            // Separation
            Divider(),

            // Date Picker
            RaisedButton(
              onPressed: () => _selectDate(context),
              child: Text(allTranslations.text('demoPage.buttons.selectDate')),
            ),

            // Separation
            Divider(),

            // Next Page
            RaisedButton(
              onPressed: () => Navigator.of(context).pushNamed('/page2'),
              child: Text('==> Page 2'),
            ),
          ],
        ),
      ),
    );
  }

  Future _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2016),
      lastDate: DateTime(2020),
    );
  }
}

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    MaterialLocalizations localizations = MaterialLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(allTranslations.text('page2.title')),
      ),
      body: Container(
        child: Center(
          child: Text(
            localizations.formatMonthYear(DateTime.now()),
          ),
        ),
      ),
    );
  }
}