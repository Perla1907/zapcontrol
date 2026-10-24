import 'package:flutter/material.dart';
import 'package:zapcontrol/core/style_colors.dart';
import 'package:zapcontrol/data/carrito_data.dart';
import 'package:zapcontrol/data/productos_data.dart';
import 'package:zapcontrol/models/producto.dart';
import 'package:zapcontrol/models/producto_color.dart';
import 'package:zapcontrol/models/usuarios.dart';
import 'package:zapcontrol/screens/pantalla_nuevo_producto.dart';
import 'package:zapcontrol/screens/venta_screen.dart';
import 'package:zapcontrol/services/servicio_auth.dart';
import 'package:zapcontrol/widgets/producto_card.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({
    super.key,
  });

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {

  final bool esAdministrador = ServicioAuth.usuarioActual?.rol == "Administrador";

  String _categoriaSeleccionada = "Todos";

  final List<String> _categorias = ["Todos", "Deportivo", "Casual", "Escolar"];
  String _busqueda = '';

  @override
  Widget build(BuildContext context) {
    
    // 1. Expande los productos por sus colores
    final productosExpandidos = productos.expand((producto) {
      return producto.colores.map((colorObj) => {
        'producto': producto,
        'colorObj': colorObj,
      });
    });

    // 2. Filtra la lista expandida
    final productosFiltrados = productosExpandidos.where((item) {
      final producto = item['producto'] as Producto;
      final bool coincideNombre = producto.marca.toLowerCase().contains(_busqueda.toLowerCase());
      final bool coincideCategoria = _categoriaSeleccionada == 'Todos' || producto.categoria == _categoriaSeleccionada;
      return coincideNombre && coincideCategoria;
    }).toList();

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
          if (esAdministrador)
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaNuevoProducto(),
                  ),
                );
              },
            ),
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
              onChanged: (valor) {
                setState(() {
                  _busqueda = valor;
                });
              },
            ),

            const SizedBox(height: 16),

            // Categorías horizontales
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: _categorias.map((cat) {
                  // Evaluamos si este botón en particular es el seleccionado
                  final bool esSeleccionado = _categoriaSeleccionada == cat;

                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          // Al presionar, este botón pasa a ser el activo
                          _categoriaSeleccionada = cat;
                        });
                      }, 
                      style: ElevatedButton.styleFrom(
                        backgroundColor: esSeleccionado ? StyleColors.resaltado : StyleColors.fondo,
                        foregroundColor: esSeleccionado ? Colors.white : Colors.black87,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20), 
                        ),
                      ),
                      child: Text(cat),
                    ),
                  );
                }).toList(),
              ),
            ),

            const SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: productosFiltrados.length, // <-- Aquí le decimos cuántas tarjetas dibujar (ej. 6 tarjetas)
                itemBuilder: (BuildContext context, int index) {
                  
                  // Sacamos el elemento actual de la lista plana
                  final item = productosFiltrados[index];
                  final producto = item['producto'] as Producto;
                  final colorObj = item['colorObj'] as ProductoColor;

                  // Dibujamos la tarjeta pasándole su producto y su color específico
                  return ProductoCard(
                    producto: producto, 
                    productoColor: colorObj,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}