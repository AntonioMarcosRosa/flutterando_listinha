import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/configuration/services/impl/settings_service_impl.dart';
import 'package:listinha_app/src/configuration/services/settings_service.dart';
import 'package:listinha_app/src/configuration/settings_page.dart';
import 'package:listinha_app/src/home/home_module.dart';
import 'package:listinha_app/src/shared/services/realm/realm_config.dart';
import 'package:listinha_app/src/shared/stores/app_store.dart';
import 'package:realm/realm.dart';

class AppModule extends Module {
  @override
  List<Bind<Object>> get binds => [
        Bind.instance<Realm>(Realm(config)),
        Bind.singleton<SettingsService>(
          (i) => SettingsServiceImpl(i.get<Realm>(), i.get<AppStore>()),
        ),
        Bind.singleton((i) => AppStore()),
      ];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/settings', child: (context, args) => const SettingsPage()),
      ];
}
