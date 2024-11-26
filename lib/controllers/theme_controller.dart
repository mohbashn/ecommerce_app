import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeController extends GetxController {
  final _isDarkMode = false.obs;
  final _prefs = SharedPreferences.getInstance();

  bool get isDarkMode => _isDarkMode.value;

  @override
  void onInit() {
    super.onInit();
    loadThemeMode();
  }

  Future<void> loadThemeMode() async {
    final prefs = await _prefs;
    _isDarkMode.value = prefs.getBool('isDarkMode') ?? false;
    updateTheme();
  }

  Future<void> toggleTheme() async {
    _isDarkMode.toggle();
    final prefs = await _prefs;
    await prefs.setBool('isDarkMode', _isDarkMode.value);
    updateTheme();
  }

  void updateTheme() {
    Get.changeThemeMode(_isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
  }
}