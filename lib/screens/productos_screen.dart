import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/productos.dart';
import 'package:zapcontrol/widgets/navigator.dart';
import 'package:zapcontrol/widgets/producto_card.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 40,
        titleSpacing: 0,
        title: const Text('Productos', style: TextStyle(fontWeight: FontWeight.bold)),
        leading: IconButton(
          onPressed: () {}, 
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.add),
          ),
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

            // Categorías horizontales
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleColors.resaltado,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Todos"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleColors.fondo,
                      foregroundColor: Colors.black87,
                      elevation: 0,
                    ),
                    child: const Text("Deportivos"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleColors.fondo,
                      foregroundColor: Colors.black87,
                      elevation: 0,
                    ),
                    child: const Text("Casuales"),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton(
                    onPressed: () {}, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: StyleColors.fondo,
                      foregroundColor: Colors.black87,
                      elevation: 0,
                    ),
                    child: const Text("Escolares"),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // Lista de productos usando el widget ProductCard
            Expanded(
              child: ListView.builder(
                itemCount: productos.length,
                itemBuilder: (BuildContext context, int index) {
                  final producto = productos[index];
                  return ProductoCard(producto: producto);
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomNavigationBar(),
    );
  }
}