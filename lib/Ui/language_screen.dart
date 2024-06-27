import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/localization_provider.dart';
import 'model/model.dart';

class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<LocalizationProvider>(
        builder: (context, localizationProvider, child) {
      var groupValue = localizationProvider.locale.languageCode;
      return Scaffold(
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        appBar: AppBar(
        ),
        body: ListView.builder(
          itemCount: languageModel.length,
          itemBuilder: (context, index) {
            var item = languageModel[index];
            return RadioListTile(
              activeColor: Color(0xff4AACAB),
              value: item.languageCode,
              groupValue: groupValue,
              title: Text(item.language,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
              subtitle: Text(item.subLanguage,style: TextStyle(color: Theme.of(context).appBarTheme.foregroundColor),),
              onChanged: (value) {
                groupValue = value.toString();
                localizationProvider.setLocale(Locale(item.languageCode));
              },
            );
          },
        ),
      );
    });
  }
}
