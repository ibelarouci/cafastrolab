import 'package:cafastrolab/providers/settingModel.dart';
import 'package:cafastrolab/screens/institute.dart';
import 'package:cafastrolab/multiProvider.dart';
import 'package:easy_localization_loader/easy_localization_loader.dart';
import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: Locale("en"),
      useOnlyLangCode: true,
      child: MultiProviders(
        child: MyApp(),
      ),
      assetLoader: JsonAssetLoader(),
    ),
    // home: InstituteListScreen(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Provider.of<SettingsModel>(context, listen: false).loadSettings(); // Ac
    final settingsModel = Provider.of<SettingsModel>(context,
        listen: true); // Access the SettingsModel

    //context.setLocale(settingsModel.locale);

    return MaterialApp(
      title: 'CafaStrolab',
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: settingsModel.theme,
      home: InstituteListScreen(),
    );
  }
}
