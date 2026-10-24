import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/productos_data.dart';
import 'package:zapcontrol/models/producto.dart';
import 'package:zapcontrol/models/producto_color.dart';
import 'package:zapcontrol/screens/detalle_producto_screen.dart';

class ProductoCard extends StatefulWidget{

  final Producto producto;
  final ProductoColor productoColor;

  const ProductoCard({
    super.key, 
    required this.producto,
    required this.productoColor,
  });

  @override
  State<ProductoCard> createState() => _ProductoCardState();
}

class _ProductoCardState extends State<ProductoCard> {

  @override
  Widget build(BuildContext context) {
    
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetalleProductoScreen(
              producto: widget.producto,
              productoColor: widget.productoColor,
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
              child: Image.asset("assets/images/${widget.productoColor.imagen}"),
              
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
                        "${widget.producto.marca} ${widget.productoColor.color}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
                    ],
                  ),
                  const SizedBox(height: 2),
                  Text(
                    widget.producto.modelo, 
                    style: TextStyle(color: Colors.grey.shade600, fontSize: 13),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "\$ ${widget.producto.precio}",
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                      ),
      
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: StyleColors.categoriaFondo[widget.producto.categoria],
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              widget.producto.categoria,
                              style: TextStyle(color: StyleColors.categoriaTexto[widget.producto.categoria], fontSize: 10, fontWeight: FontWeight.bold),
                            ),
                          ),
                          const Icon(Icons.chevron_right, color: Colors.grey, size: 18),
                        ],
                      ),
                      ],
                  ),
                  const SizedBox(width: 12),
                  Text("Stock: ${widget.productoColor.stockTotal}", 
                    style: const TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.w500),
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