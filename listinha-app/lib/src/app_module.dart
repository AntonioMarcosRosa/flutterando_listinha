import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/configuration/settings_page.dart';
import 'package:listinha_app/src/home/home_module.dart';

class AppModule extends Module {
  @override
  List<ModularRoute> get routes => [
        ModuleRoute('/home', module: HomeModule()),
        ChildRoute('/settings', child: (context, args) => const SettingsPage()),
      ];
}
