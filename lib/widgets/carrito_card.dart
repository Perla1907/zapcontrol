import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/carrito_data.dart';
import 'package:zapcontrol/models/producto_talla.dart';
import 'package:zapcontrol/models/venta.dart';
import 'package:zapcontrol/screens/detalle_producto_screen.dart';

class CarritoCard extends StatefulWidget{

  final Venta venta;

  const CarritoCard({
    super.key, 
    required this.venta,
  });

  @override
  State<CarritoCard> createState() => _CarritoCardState();
}

class _CarritoCardState extends State<CarritoCard> {

  int cantidad = 0;

  @override
  void initState() {
    cantidad = widget.venta.cantidad;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleProductoScreen(
              producto: widget.venta.producto,
              productoColor: widget.venta.color,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 12),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.grey.shade200),
        ),
        child: Row(
          children: [
            // Imagen o contenedor del producto
            Container(
              width: 70,
              height: 70,
              decoration: BoxDecoration(
                color: StyleColors.fondo,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset("assets/images/${widget.venta.color.imagen}"),
              
            ),
            const SizedBox(width: 12),
            
            // Información del producto
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${widget.venta.producto.marca} ${widget.venta.color.color}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.venta.producto.modelo, 
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.venta.producto.precio}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text('Cantidad:',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                      ElevatedButton(
                        onPressed: cantidad > 1  ? () {
                          setState(() {
                            cantidad--;
                            widget.venta.cantidad = cantidad;
                          });
                        } : null,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),      
                          padding: const EdgeInsets.all(12), 
                          backgroundColor: Colors.blue,     
                          foregroundColor: Colors.white,    
                          elevation: 2,                     
                        ),
                        child: const Icon(Icons.remove, size: 20),
                      ),

                      Text("$cantidad", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, fontStyle: FontStyle.italic)),

                      ElevatedButton(
                        onPressed: cantidad < widget.venta.talla ? () {
                          setState(() {
                            cantidad++;
                            widget.venta.cantidad = cantidad;
                          });
                        } : null,
                        style: ElevatedButton.styleFrom(
                          shape: const CircleBorder(),      
                          padding: const EdgeInsets.all(12), 
                          backgroundColor: Colors.blue,     
                          foregroundColor: Colors.white,    
                          elevation: 2,                     
                        ),
                        child: const Icon(Icons.add, size: 20),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}