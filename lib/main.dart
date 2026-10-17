import 'package:flutter/material.dart';
import 'package:zapcontrol/screens/productos_screen.dart';
import 'package:zapcontrol/screens/splash_screen.dart';
import 'package:zapcontrol/screens/ticket_venta.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TicketVenta(),
    );
  }
}
