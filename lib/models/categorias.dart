import 'package:flutter/material.dart';

class Categoria {
  String nombre;
  String iniciales;
  String descripcion;
  Color color;
  bool activa;

  Categoria({
    required this.nombre,
    required this.iniciales,
    required this.descripcion,
    required this.color,
    required this.activa,
  });
}
