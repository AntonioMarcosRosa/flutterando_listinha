import 'package:listinha_app/src/shared/services/realm/models/settings_model.dart';

abstract class SettingsService {
  SettingsModel getSettings();

  void saveSettings(String themeModeName, DateTime? syncDate);

  void deleteAll();
}
