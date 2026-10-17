import 'package:zapcontrol/models/producto.dart';

class Ticket {

  String folio;
  String fecha;
  List<Producto> listaCompra;
  double iva;
  double total;
  String metodoPago;

  Ticket({
    required this.folio,
    required this.fecha,
    required this.listaCompra,
    required this.iva,
    required this.total,
    required this.metodoPago
  });

}