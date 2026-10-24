import 'package:flutter/material.dart';

class Categoria {
  final String nombre;
  final String clave;
  final String descripcion;
  final Color color;

  const Categoria({
    required this.nombre,
    required this.clave,
    required this.descripcion,
    required this.color,
  });
}
