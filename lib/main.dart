import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_provider/controller/favorite_provider.dart';
import 'package:test_provider/controller/provider.dart';
import 'package:test_provider/controller/slider_provider.dart';
import 'package:test_provider/controller/theme_provider.dart';
import 'package:test_provider/view/dark_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // final themeChanger = Provider.of<ThemeProvider>(context);
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => CounterProvider()),
          ChangeNotifierProvider(create: (context) => SliderProvider()),
          ChangeNotifierProvider(create: (context) => FavoriteProvider()),
          ChangeNotifierProvider(create: (context) => ThemeProvider()),
        ],
        child: Builder(builder: (context) {
          final themeChanger = Provider.of<ThemeProvider>(context);

          return MaterialApp(
            themeMode: themeChanger.themeMode,
            theme: ThemeData(brightness: Brightness.light),
            darkTheme: ThemeData(brightness: Brightness.dark),
            home: DarkTheme(),
          );
        }));
  }
}
