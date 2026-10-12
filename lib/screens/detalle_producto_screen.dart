import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/models/producto.dart';
import 'package:zapcontrol/widgets/navigator.dart';

class DetalleProductoScreen extends StatefulWidget {
  final Producto producto;

  const DetalleProductoScreen({super.key, required this.producto});

  @override
  State<DetalleProductoScreen> createState() => _DetalleProductoScreenState();
}

class _DetalleProductoScreenState extends State<DetalleProductoScreen> {
  // Variable para almacenar la talla seleccionada actualmente
  late String tallaSeleccionada;

  @override
  void initState() {
    super.initState();
    // Seleccionamos por defecto la primera talla de la lista del mapa
    tallaSeleccionada = widget.producto.tallas.isNotEmpty 
        ? widget.producto.tallas.first['talla'].toString() 
        : '';
  }

  @override
  Widget build(BuildContext context) {
    
    final Color bgColor = StyleColors.categoriaFondo[widget.producto.categoria] ?? Colors.grey.shade100;
    final Color txtColor = StyleColors.categoriaTexto[widget.producto.categoria] ?? Colors.grey.shade700;

    // Buscamos el stock específico de la talla seleccionada dentro del mapa
    final tallaActual = widget.producto.tallas.firstWhere(
      (t) => t['talla'].toString() == tallaSeleccionada,
      orElse: () => {'talla': '', 'stock': 0},
    );

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leadingWidth: 40,
        titleSpacing: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(Icons.arrow_back_ios_outlined, color: Colors.black87),
        ),
        title: const Text(
          'Detalle del producto',
          style: TextStyle(color: Colors.black87, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.more_horiz, color: Colors.black87),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Contenedor de la imagen del producto
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Center(
                child: Image.asset("assets/images/${widget.producto.imagen}")
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
                    color: Colors.green.shade50,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Text(
                    'En existencia',
                    style: TextStyle(color: Colors.green, fontSize: 12, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Tallas disponibles (Dinámicas desde el mapa de tallas)
            const Text(
              'Tallas disponibles',
              style: TextStyle(color: Colors.grey, fontSize: 13, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: widget.producto.tallas.map((tallaMap) {
                  final String tallaStr = tallaMap['talla'].toString();
                  final bool isSelected = tallaStr == tallaSeleccionada;

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        tallaSeleccionada = tallaStr;
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
                        tallaStr,
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

            const SizedBox(height: 24),

            // Tarjeta de detalles (Existencia total, Stock por talla, Ubicación, Categoría) con SpaceBetween
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey.shade50,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
              ),
              child: Column(
                children: [
                  _buildDetailRow('Existencia total', '${widget.producto.stockTotal}'),
                  const Divider(height: 24, color: Colors.grey),
                  _buildDetailRow('Stock en talla $tallaSeleccionada', '${tallaActual['stock']} pzas'),
                  const Divider(height: 24, color: Colors.grey),
                  _buildDetailRow('Ubicación', widget.producto.ubicacion),
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
                onPressed: () {},
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

            // Botón secundario: Editar producto
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleColors.fondo,
                  foregroundColor: Colors.black87,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                ),
                child: const Text('Editar producto', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
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