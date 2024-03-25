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
      GoRouter.of(context).replace('/boarding');
    } else {
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
