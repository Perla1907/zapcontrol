import 'package:flutter/material.dart';

class StyleColors {
  static Color fondo = const Color(0xFFd0d2e3);
  static Color resaltado = Colors.blue;

  // Colores específicos para las categorías
  static Map<String, Color> categoriaFondo = {
    'Deportivo': Colors.blue.shade50,
    'Casual': Colors.orange.shade50,
    'Escolar': Colors.deepPurple.shade50,
  };

  static Map<String, Color> categoriaTexto = {
    'Deportivo': Colors.blue.shade700,
    'Casual': Colors.orange.shade800,
    'Escolar': Colors.deepPurple.shade700,
  };
}