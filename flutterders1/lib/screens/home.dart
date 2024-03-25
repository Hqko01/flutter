import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: InkWell(
              onTap: () => GoRouter.of(context).push("/ali"),
              child: Center(child: Text("Home")))),
    );
  }
}
