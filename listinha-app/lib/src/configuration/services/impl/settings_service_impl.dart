import 'package:listinha_app/src/configuration/services/settings_service.dart';
import 'package:listinha_app/src/shared/services/realm/models/settings_model.dart';
import 'package:realm/realm.dart';

class SettingsServiceImpl implements SettingsService {
  final Realm realm;

  SettingsServiceImpl(this.realm);

  @override
  SettingsModel getSettings() {
    return realm.all<SettingsModel>().first;
  }

  @override
  void saveSettings(String themeModeName, DateTime? syncDate) {
    final model = getSettings();
    realm.write(() {
      model
        ..themeModeName = themeModeName
        ..syncDate = syncDate;
    });
  }

  @override
  void deleteAll() {
    realm.deleteAll();
  }
}
