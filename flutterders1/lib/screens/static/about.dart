import 'package:flutter/material.dart';

class aboutScreen extends StatefulWidget {
  const aboutScreen({super.key});

  @override
  State<aboutScreen> createState() => _aboutScreenState();
}

class _aboutScreenState extends State<aboutScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        body: SafeArea(child: Center(child: Text("About"))),
      ),
    );
  }
}
