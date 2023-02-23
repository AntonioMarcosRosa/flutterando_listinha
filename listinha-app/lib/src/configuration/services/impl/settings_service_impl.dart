import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/configuration/services/settings_service.dart';
import 'package:listinha_app/src/shared/services/realm/models/settings_model.dart';
import 'package:listinha_app/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';
import 'package:rx_notifier/rx_notifier.dart';

class SettingsServiceImpl implements SettingsService, Disposable {
  final Realm realm;
  final AppStore appStore;
  late final RxDisposer disposer;
  SettingsServiceImpl(
    this.realm,
    this.appStore,
  );

  @override
  void init() {
    final model = _getSettings();
    appStore.themeMode.value = _getThemeModeByName(model.themeModeName);
    appStore.syncDate.value = model.syncDate;

    disposer = rxObserver(() {
      final themeMode = appStore.themeMode.value;
      final syncDate = appStore.syncDate.value;

      _saveSettings(themeMode.name, syncDate);
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }

  SettingsModel _getSettings() {
    return realm.all<SettingsModel>().first;
  }

  void _saveSettings(String themeModeName, DateTime? syncDate) {
    final model = _getSettings();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  ThemeMode _getThemeModeByName(String name) {
    return ThemeMode.values.firstWhere((mode) => mode.name == name);
  }

  @override
  void dispose() {
    disposer();
  }
}
