import 'package:zapcontrol/models/producto_color.dart';

class Producto {

  final int idProducto;
  final String marca;
  final String modelo;
  final String sku;
  double precio;
  final String categoria;

  final List<ProductoColor> colores;

  Producto({
    required this.idProducto,
    required this.marca,
    required this.modelo,
    required this.sku,
    required this.precio,
    required this.categoria,
    required this.colores,
  });
}