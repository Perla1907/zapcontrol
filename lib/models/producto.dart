class Producto {

  int idProducto;
  String marca;
  String modelo;
  String imagen;
  String sku;
  String talla;
  String color;
  double precio;
  int stock;
  String ubicacion;
  String categoria;
  List<Map<String, dynamic>> tallas;
  
  

  Producto ({
    required this.idProducto,
    required this.marca,
    required this.modelo,
    required this.imagen,
    required this.sku,
    required this.talla,
    required this.color,
    required this.precio,
    required this.stock,
    required this.ubicacion,
    required this.categoria,
    required this.tallas
  });

  int get stockTotal {
    return tallas.fold(0, (sum, item) => sum + (item['stock'] as int));
  }
}