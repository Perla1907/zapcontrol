import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/carrito_data.dart';
import 'package:zapcontrol/screens/pantalla_venta_registrada.dart';
import 'package:zapcontrol/screens/ticket_venta.dart';
import 'package:zapcontrol/widgets/carrito_card.dart';
import 'package:zapcontrol/widgets/navigator.dart';

class VentaScreen extends StatefulWidget {

  const VentaScreen({
    super.key,
  });

  @override
  State<VentaScreen> createState() => _VentaScreenState();
}

class _VentaScreenState extends State<VentaScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        title: const Text('Nueva venta', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          onPressed: () => Navigator.pop(context), 
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        actions: [
          IconButton
          (onPressed: () {}, 
          icon: Icon(Icons.qr_code_scanner))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            
            // Buscador
            TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: StyleColors.fondo,
                prefixIcon: const Icon(Icons.search),
                hintText: "Buscar producto...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 16),

            CarritoData.carrito.isNotEmpty ? 
            Expanded(
              child: ListView.builder(
                itemCount: CarritoData.carrito.length,
                itemBuilder: (BuildContext context, int index) {
                  
                  final item = CarritoData.carrito[index];
                
                  return CarritoCard(
                    venta: item, 
                  );
                }
              ),
            ) :
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Text("Aún no hay productos en el carrito. Buscalos arriba o usa el scanner", style: TextStyle(color: Colors.grey),),
            ),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade400),
              ),
              child: Column(
                children: [
                 _buildDetailRow('Subtotal', '\$${CarritoData.total.toStringAsFixed(2)}'),
                  const Divider(height: 24, color: Colors.grey),
                  _buildDetailRow('Descuento', '\$0.00'),
                  const Divider(height: 24, color: Colors.grey),
                  _buildDetailRow('Total', '\$${CarritoData.total.toStringAsFixed(2)}'),
                  const Divider(height: 24, color: Colors.grey),
                ],
              ),
            ),

            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PantallaVentaRegistrada(),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: StyleColors.resaltado,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  elevation: 0,
                  
                ),
                child: const Text('Procesar venta', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
            ),
          ],
        ),
      ),
    );
  }

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