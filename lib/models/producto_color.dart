import 'package:zapcontrol/models/producto_talla.dart';

class ProductoColor {
  final String color;
  final String imagen;
  final List<ProductoTalla> tallas;

  ProductoColor({
    required this.color,
    required this.imagen,
    required this.tallas,
  });

  int get stockTotal {
    return tallas.fold(
      0,
      (total, productoTalla) => total + productoTalla.stock,
    );
  }
}