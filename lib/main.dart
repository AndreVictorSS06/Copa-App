import 'package:copa_app/screens/FormJogadores/form_jogadores_screen.dart';
import 'package:copa_app/screens/FormSelecoes/form_selecoes_screen.dart';
import 'package:copa_app/screens/JogadoresScreen/jogadores_screen.dart';
import 'package:copa_app/screens/LoginScreen/login_screen.dart';
import 'package:copa_app/screens/SelecoesScreen/selecoes_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CopaApp',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      initialRoute: '/login',
      routes: {
        '/login': (context) => const LoginScreen(),
        '/selecoes': (context) => const SelecoesScreen(),
        '/form_selecoes': (context) => const FormSelecoesScreen(),
        '/jogadores': (context) => const JogadoresScreen(),
        '/form_jogadores': (context) => const FormJogadoreScreen(),
      },
    );
  }
}
