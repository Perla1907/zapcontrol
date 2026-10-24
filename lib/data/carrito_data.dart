import 'package:zapcontrol/models/venta.dart';

class CarritoData {
  static List<Venta> carrito = [];

  static get total {
    double sumaTotal = 0.0; 
    for (Venta productoCarrito in carrito) {
      sumaTotal += productoCarrito.producto.precio * productoCarrito.cantidad;
    }
    
    return sumaTotal; 
  }
  
}



