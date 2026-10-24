/*import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/screens/productos_screen.dart'; // Asegúrate de que la ruta coincida con tu proyecto

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    
    // Temporizador de 3 segundos para cambiar de pantalla automáticamente
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductosScreen(),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0E2A47),
      body: Center(
        child: Image.asset(
          'assets/images/logo.png',
          width: 220,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}*/