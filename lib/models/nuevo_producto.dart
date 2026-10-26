import 'package:flutter/material.dart';

class OpcionColor {
  final String nombre;
  final Color color;

  const OpcionColor(this.nombre, this.color);
}

class Variante {
  final OpcionColor color;
  final String talla;
  final int existencias;

  const Variante({
    required this.color,
    required this.talla,
    required this.existencias,
  });
}

class Producto {
  final String marca;
  final String modelo;
  final String categoria;
  final double precio;
  final String ubicacion;
  final List<Variante> variantes;
  final String sku;
  final String codigoBarras;

  const Producto({
    required this.marca,
    required this.modelo,
    required this.categoria,
    required this.precio,
    required this.ubicacion,
    required this.variantes,
    required this.sku,
    required this.codigoBarras,
  });

  int get totalPares => variantes.fold(0, (suma, v) => suma + v.existencias);
}