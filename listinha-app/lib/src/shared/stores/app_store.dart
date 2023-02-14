import 'package:flutter/material.dart';

class AppStore {
  final themeMode = ValueNotifier(ThemeMode.system);
  final syncDate = ValueNotifier<DateTime?>(null);

  AppStore();

  void init() {}

  void save() {
    // TODO: Salvar quando alterar o estado.
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

}
