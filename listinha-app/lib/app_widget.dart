import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:listinha_app/src/configuration/services/settings_service.dart';
import 'package:listinha_app/src/shared/stores/app_store.dart';
import 'package:rx_notifier/rx_notifier.dart';
part 'src/shared/themes/color_schemes.g.dart';
part 'src/shared/themes/themes.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final settings = Modular.get<SettingsService>();
  final appStore = Modular.get<AppStore>();

  @override
  void initState() {
    super.initState();
    settings.init();
  }

  @override
  Widget build(BuildContext context) {
    Modular.setInitialRoute('/home/');
    final themeMode = context.select(() => appStore.themeMode.value);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: themeMode,
      theme: lightTheme,
      darkTheme: darkTheme,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
    );
  }
}
