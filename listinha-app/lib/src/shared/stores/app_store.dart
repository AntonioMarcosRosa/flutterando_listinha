import 'package:flutter/material.dart';
import 'package:rx_notifier/rx_notifier.dart';

@RxStore()
abstract class _AppStore {
  final themeMode = RxNotifier(ThemeMode.system);
  final syncDate = RxNotifier<DateTime?>(null);
}
