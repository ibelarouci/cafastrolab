import 'package:cafastrolab/providers/settingModel.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final settingsModel = Provider.of<SettingsModel>(context,
        listen: true); // Access the SettingsModel

    return Scaffold(
      appBar: AppBar(
        title: Text('settings'.tr()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'theme'.tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: settingsModel.selectedTheme,
              onChanged: (value) async {
                settingsModel.selectedTheme = value!;
                await settingsModel.saveSettings();
              },
              items: settingsModel.themeOptions.map((theme) {
                return DropdownMenuItem<String>(
                  value: theme,
                  child: Text(theme.tr()),
                );
              }).toList(),
            ),
            SizedBox(height: 20),
            Text(
              'language'.tr(),
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            DropdownButton<String>(
              value: context.locale.languageCode,
              onChanged: (value) async {
                context.setLocale(Locale(value!));
              },
              items: context.supportedLocales.map((locale) {
                return DropdownMenuItem<String>(
                  value: locale.languageCode,
                  child: Text(locale.languageCode.tr()),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
            Center(),
          ],
        ),
      ),
    );
  }
}
