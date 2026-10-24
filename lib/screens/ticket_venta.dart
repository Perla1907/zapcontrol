import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/ticketData.dart';
import 'package:zapcontrol/widgets/navigator.dart';

class TicketVenta extends StatefulWidget {
  const TicketVenta({super.key});

  @override
  State<TicketVenta> createState() => _TicketVentaState();
}

class _TicketVentaState extends State<TicketVenta> {
  Ticketdata ticket = Ticketdata();

  @override
  Widget build(BuildContext context) {
    final venta = ticket.ticketDeVenta;

    final double total = venta.listaCompra.fold<double>(
      0,
      (suma, producto) => suma + producto.precio.toDouble(),
    );

    final double subtotal = total / 1.16;
    final double iva = total - subtotal;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: const Text(
          "Ticket de venta",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                border: Border.all(
                  color: StyleColors.fondo,
                  width: 3,
                ),
                borderRadius: BorderRadius.circular(30),
              ),
            
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Encabezado
                  const Text(
                    "ZapControl",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  const Text(
                    "Calzado que te lleva más lejos",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
            
                  const SizedBox(height: 15),
                  Divider(color: StyleColors.fondo),
            
                  // Datos de la venta
                  datoTicket("Folio:", venta.folio),
                  datoTicket("Fecha:", venta.fecha),
            
                  const SizedBox(height: 10),
                  Divider(color: StyleColors.fondo),
                  const SizedBox(height: 10),
            
                  // Encabezado de productos
                  const Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Producto",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text(
                          "Precio",
                          textAlign: TextAlign.right,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
            
                  const SizedBox(height: 10),
            
                  // Lista de productos
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: venta.listaCompra.length,
            
                    itemBuilder: (BuildContext context, int index) {
                      final producto = venta.listaCompra[index];
            
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 10,
                            ),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    producto.marca,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
            
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    "\$${producto.precio.toStringAsFixed(2)}",
                                    textAlign: TextAlign.right,
                                    style: const TextStyle(
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
            
                          Divider(
                            color: Colors.grey.shade300,
                          ),
                        ],
                      );
                    },
                  ),
            
                  const SizedBox(height: 15),
                  Divider(color: StyleColors.fondo),
            
                  // Resumen de venta
                  datoTicket(
                    "Subtotal:",
                    "\$${subtotal.toStringAsFixed(2)}",
                  ),
            
                  datoTicket(
                    "IVA (16%):",
                    "\$${iva.toStringAsFixed(2)}",
                  ),
            
                  const SizedBox(height: 10),
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Total:",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
            
                      Text(
                        "\$${total.toStringAsFixed(2)}",
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
            
                  const SizedBox(height: 20),
                  Divider(color: StyleColors.fondo),
                  const SizedBox(height: 20),
            
                  // Pie del ticket
                  const Text(
                    "¡Gracias por tu compra!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
            
                  const SizedBox(height: 5),
            
                  const Text(
                    "Calidad y estilo en cada paso",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
              ), 
              child: Text("Compartir como PDF", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),
            ),
          ],
        ),
      ),
      bottomNavigationBar: CustomNavigationBar(), 
    );
  }

  // Widget reutilizable para los datos del ticket
  Widget datoTicket(String etiqueta, String valor) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(color: Colors.grey),
          ),

          Flexible(
            child: Text(
              valor,
              textAlign: TextAlign.right,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}