
import 'package:flutter/material.dart';
import 'package:zapcontrol/data/nueva_categoria_data.dart';
import 'package:zapcontrol/screens/pantalla_nueva_categoria.dart';
import 'package:zapcontrol/widgets/tarjeta_categoria.dart';


class PantallaCategorias extends StatefulWidget {
  const PantallaCategorias({super.key});

  @override
  State<PantallaCategorias> createState() =>
      _PantallaCategoriasState();
}

class _PantallaCategoriasState extends State<PantallaCategorias> {
  int seleccionado = 4;

  void mostrarNuevaCategoria() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const NuevaCategoria(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFD),

      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF243247),
        elevation: 0,
        title: const Text(
          'Categorías',
          style: TextStyle(
            color: Color(0xFF243247),
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            tooltip: 'Nueva categoría',
            icon: const Icon(
              Icons.add_circle_outline,
              color: Color(0xFF3478E5),
              size: 28,
            ),
            onPressed: mostrarNuevaCategoria,
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Administra tus categorías',
              style: TextStyle(
                color: Color(0xFF68758A),
                fontSize: 14,
              ),
            ),

            const SizedBox(height: 18),

            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFFE5EAF1),
                  ),
                ),
                child: ListView.separated(
                  itemCount: categorias.length,
                  separatorBuilder: (context, index) {
                    return const Divider(
                      color: Color(0xFFEDF0F5),
                      height: 22,
                    );
                  },
                  itemBuilder: (context, index) {
                    return TarjetaCategoria(
                      categoria: categorias[index],
                      cambiarEstado: () {
                        setState(() {
                          categorias[index].activa =
                              !categorias[index].activa;
                        });
                      },
                    );
                  },
                ),
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: mostrarNuevaCategoria,
                icon: const Icon(Icons.add),
                label: const Text('Nueva categoría'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF3478E5),
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                  ),
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: MenuInferior(
        seleccionado: seleccionado,
        cambiarPagina: (indice) {
          setState(() {
            seleccionado = indice;
          });
        },
      ),
    );
  }
}
