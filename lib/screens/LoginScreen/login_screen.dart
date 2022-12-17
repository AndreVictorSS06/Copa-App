import 'package:copa_app/screens/LoginScreen/components/body_login.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          'CopaApp',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: const BodyLogin(),
    );
  }
}
