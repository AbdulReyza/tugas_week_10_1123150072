import 'package:flutter/material.dart';

class LoginDong extends StatefulWidget {
  const LoginDong({super.key});

  @override
  State<LoginDong> createState() => _LoginDongState();
}

class _LoginDongState extends State<LoginDong> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: [],
        ),
      ),
    );
  }
}