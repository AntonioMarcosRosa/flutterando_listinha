import 'package:flutter/material.dart';
import 'package:listinha_app/src/configuration/services/settings_service.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);
  final SettingsService _settingsService;

  AppStore(this._settingsService) {
    init();
  }

  void init() {
    final model = _settingsService.getSettings();
    syncDate.value = model.syncDate;
    themeMode.value = _getThemeModeByName(model.themeModeName);
  }

  void save() {
    _settingsService.saveSettings(
      themeMode.value.name,
      syncDate.value,
    );
  }

  void changeTheme(ThemeMode? mode) {
    if (mode != null) {
      themeMode.value = mode;
      save();
    }
  }

  void setSyncDate(DateTime date) {
    syncDate.value = date;
    save();
  }

  void deleteApp() {
    _settingsService.deleteAll();
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }
}
