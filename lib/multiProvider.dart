import 'package:cafastrolab/providers/instituteModel.dart';
import 'package:cafastrolab/providers/profileModel.dart';
import 'package:cafastrolab/providers/settingModel.dart';
import 'package:cafastrolab/screens/institute.dart';
import 'package:cafastrolab/screens/profile.dart';
import 'package:cafastrolab/screens/setting.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MultiProviders extends StatelessWidget {
  final Widget child;

  MultiProviders({required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<InstituteModel>(
          create: (_) => InstituteModel(),
          child: InstituteListScreen(),
        ),
        ChangeNotifierProvider<SettingsModel>(
          create: (_) => SettingsModel(),
          child: SettingsScreen(),
        ),
        ChangeNotifierProvider(
          create: (_) => ProfileModel(), // Provide the ProfileModel
          child: ProfileScreen(),
        ),
      ],
      child: child,
    );
  }
}
