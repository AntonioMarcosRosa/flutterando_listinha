part of '../../../app_widget.dart';

ThemeData get darkTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _darkColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _darkColorScheme.primaryContainer,
      ),
      segmentedButtonTheme: _segmentedButtonTheme,
    );

ThemeData get lightTheme => ThemeData(
      useMaterial3: true,
      colorScheme: _lightColorScheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        backgroundColor: _lightColorScheme.primaryContainer,
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: _darkColorScheme.primaryContainer,
        foregroundColor: _lightColorScheme.onPrimary,
      ),
      segmentedButtonTheme: _segmentedButtonTheme,
    );

SegmentedButtonThemeData get _segmentedButtonTheme => SegmentedButtonThemeData(
      style: ButtonStyle(
        textStyle: MaterialStateProperty.resolveWith(
          (states) {
            if (states.contains(MaterialState.selected)) {
              return const TextStyle(fontSize: 12);
            }
            return null;
          },
        ),
      ),
    );
