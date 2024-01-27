import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsModel extends ChangeNotifier {
  final List<String> themeOptions = ['light', 'dark'];
  String selectedTheme = 'light';

  SettingsModel() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    selectedTheme = prefs.getString('theme') ?? 'light';

    notifyListeners();
  }

  Future<void> saveSettings() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('theme', selectedTheme);

    notifyListeners();
  }

  get theme => selectedTheme == 'dark' ? ThemeData.dark() : ThemeData.light();
}
