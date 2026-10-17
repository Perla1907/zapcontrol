import 'package:zapcontrol/data/productos.dart';
import 'package:zapcontrol/models/ticket.dart';

class Ticketdata {

  // Instancia única que contiene la lista de artículos y metadatos del ticket
  Ticket ticketDeVenta = Ticket(
    folio: "ZP-000123",
    fecha: "20/09/2026",
    listaCompra: productos,
    iva: 383.68, // IVA (16%)
    total: 2781.68,
    metodoPago: "Efectivo",
  );

}