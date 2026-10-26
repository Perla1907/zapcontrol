import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/carrito_data.dart';
import 'package:zapcontrol/models/producto.dart';
import 'package:zapcontrol/models/producto_color.dart';
import 'package:zapcontrol/models/producto_talla.dart';
import 'package:zapcontrol/models/venta.dart';
import 'package:zapcontrol/screens/productos_screen.dart';
import 'package:zapcontrol/screens/venta_screen.dart';

class DetalleProductoScreen extends StatefulWidget {
  final Producto producto;
  final ProductoColor productoColor;
  
  const DetalleProductoScreen({
    super.key, 
    required this.producto,
    required this.productoColor
  });

  @override
  State<DetalleProductoScreen> createState() => _DetalleProductoScreenState();
}

class _DetalleProductoScreenState extends State<DetalleProductoScreen> {
  // Variable para almacenar el color seleccionado actualmente (inicia con el de la tarjeta)
  late ProductoColor colorSeleccionado;
  // Variable para almacenar la talla seleccionada actualmente
  late String tallaSeleccionada;

  int cantidad = 1;

  @override
  void initState() {
    super.initState();
    // Inicializamos con el color que vino desde la tarjeta
    colorSeleccionado = widget.productoColor;
    
    // Seleccionamos por defecto la primera talla de este color
    tallaSeleccionada = colorSeleccionado.tallas.isNotEmpty 
        ? colorSeleccionado.tallas.first.talla 
        : '';
  }

  @override
  Widget build(BuildContext context) {
    
    final Color bgColor = StyleColors.categoriaFondo[widget.producto.categoria] ?? Colors.grey.shade100;
    final Color txtColor = StyleColors.categoriaTexto[widget.producto.categoria] ?? Colors.grey.shade700;

    // Buscamos el stock específico de la talla seleccionada dentro de las tallas de ESTE color
    final tallaActual = colorSeleccionado.tallas.firstWhere(
      (t) => t.talla == tallaSeleccionada,
      orElse: () => ProductoTalla(talla: '', stock: 0, codigoBarras: ''),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 40,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black87),
        ),
        title: const Text(
          'Detalle del producto',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          Stack(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VentaScreen(),
                    ),
                  );
                }, 
                icon: const Icon(Icons.shopping_cart_outlined), 
                iconSize: 35,
              ),
              Positioned(
                bottom: 30, 
                left: 23,  
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: Colors.red.shade400,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      "${CarritoData.carrito.length}", 
                      style: const TextStyle(
                        color: Colors.white, 
                        fontSize: 10, 
                        fontWeight: FontWeight.bold,
                      ), 
                      textAlign: TextAlign.center,
                    ),
                  ),
                ), 
              ),
            ],
          )

        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor de la imagen dinámica según el color seleccionado
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Center(
                child: Image.asset("assets/images/${colorSeleccionado.imagen}"),
              ),
            ),

            const SizedBox(height: 16),

            // Nombre y SKU
            Text(
              widget.producto.modelo,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
            ),
            const SizedBox(height: 4),
            Text(
              'SKU: ${widget.producto.sku}',
              style: TextStyle(color: Colors.grey.shade500, fontSize: 13, fontWeight: FontWeight.w500),
            ),

            const SizedBox(height: 12),

            // Precio e insignia de existencia
            Row(
              children: [
                Text(
                  '\$${widget.producto.precio.toStringAsFixed(2)}',
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22, color: Colors.black87),
                ),
                const SizedBox(width: 12),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                  decoration: BoxDecoration(
                    color: tallaActual.stock > 0 ? Colors.green.shade50 : Colors.red.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    tallaActual.stock > 0 ? "En existencia" : "Agotado",
                    style: TextStyle(color: tallaActual.stock > 0 ? Colors.green : Colors.red, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Selector de colores disponibles
            const Text(
              'Colores disponibles',
              style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.producto.colores.map((colorObj) {
                  final bool isColorSelected = colorObj == colorSeleccionado;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        colorSeleccionado = colorObj;
                        // Al cambiar de color, seleccionamos por defecto la primera talla de este nuevo color
                        tallaSeleccionada = colorObj.tallas.isNotEmpty 
                            ? colorObj.tallas.first.talla 
                            : '';
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
                      decoration: BoxDecoration(
                        color: isColorSelected ? Colors.blue.shade50 : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isColorSelected ? Colors.blue.shade300 : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        colorObj.color,
                        style: TextStyle(
                          color: isColorSelected ? Colors.blue.shade700 : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            // Tallas disponibles (Dinámicas desde el color seleccionado)
            const Text(
              'Tallas disponibles',
              style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: colorSeleccionado.tallas.map((tallaObj) {
                  final bool isSelected = tallaObj.talla == tallaSeleccionada;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tallaSeleccionada = tallaObj.talla;
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 8),
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? Colors.blue.shade50 : Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: isSelected ? Colors.blue.shade300 : Colors.transparent,
                        ),
                      ),
                      child: Text(
                        tallaObj.talla,
                        style: TextStyle(
                          color: isSelected ? Colors.blue.shade700 : Colors.black87,
                          fontWeight: FontWeight.bold,
                          fontSize: 13,
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Cantidad',
              style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text('Cantidad:',style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
                ElevatedButton(
                  onPressed: cantidad > 1  ? () {
                    setState(() {
                      cantidad--;
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
                  onPressed: cantidad < tallaActual.stock ? () {
                    setState(() {
                      cantidad++;
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

            const SizedBox(height: 24),

            // Tarjeta de detalles técnicos
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildDetailRow('Existencia total (Global)', '${widget.productoColor.stockTotal} pzas'),
                  const Divider(height: 24, color: Colors.grey),
                  _buildDetailRow('Stock en ${colorSeleccionado.color} - Talla $tallaSeleccionada', '${tallaActual.stock} pzas'),
                  const Divider(height: 24, color: Colors.grey),
                  _buildDetailRow('Código de barras', tallaActual.codigoBarras),
                  const Divider(height: 24, color: Colors.grey),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('Categoría', style: TextStyle(color: Colors.grey, fontSize: 14)),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: bgColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.producto.categoria,
                          style: TextStyle(color: txtColor, fontSize: 12, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),

            // Botón principal: Agregar a una venta
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: tallaActual.stock > 0 ? () {
                  setState(() {
                    CarritoData.carrito.add(Venta(producto: widget.producto, cantidad: cantidad, color: colorSeleccionado, talla: tallaActual.stock));
                  });
                } : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleColors.resaltado,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                  
                ),
                child: const Text('Agregar a una venta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),

            const SizedBox(height: 12),
          ],
        ),
      ),
    );
  }

  // Widget auxiliar para las filas de información detallada con SpaceBetween
  Widget _buildDetailRow(String label, String value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 14)),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15, color: Colors.black87)),
      ],
    );
  }
}