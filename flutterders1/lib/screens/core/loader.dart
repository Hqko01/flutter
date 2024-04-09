import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutterders1/core/storage.dart';
import 'package:go_router/go_router.dart';

class loaderScreen extends StatefulWidget {
  const loaderScreen({super.key});

  @override
  State<loaderScreen> createState() => _loaderScreenState();
}

class _loaderScreenState extends State<loaderScreen> {
  loadApp() async {
    final storage = Storage();
    final firstLaunch = await storage.firstLaunch();

    if (firstLaunch) {
      //Get device lang

      final String defaultLocale = Platform.localeName;
      //Get dark mode
      const darkMode = ThemeMode.system == ThemeMode.dark;

      final langParts = defaultLocale.split("_");

      final supportedLanguages = ["en", "tr"];
      final finalLang;

      if (supportedLanguages.contains(langParts[0])) {
        finalLang = langParts[0];
      } else {
        finalLang = "en";
      }

      await storage.setConfig(language: finalLang, darkMode: darkMode);

      GoRouter.of(context).replace('/boarding');
    } else {
      final config = await storage.getConfig(); 
      GoRouter.of(context).replace('/home');
    }
  }

  @override
  void initState() {
    super.initState();
    loadApp();
  }

  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Center(child: CircularProgressIndicator())),
    );
  }
}
