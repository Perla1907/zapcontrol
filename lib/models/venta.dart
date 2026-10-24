import 'package:zapcontrol/models/producto.dart';
import 'package:zapcontrol/models/producto_color.dart';

class Venta {
  final Producto producto;
  final ProductoColor color;
  int cantidad;
  int talla;

  Venta({
    required this.producto,
    required this.color,
    required this.cantidad,
    required this.talla
  });
}