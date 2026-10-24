
import 'package:flutter/material.dart';
import 'package:zapcontrol/data/nueva_categoria_data.dart';
import 'package:zapcontrol/models/categorias.dart';
import 'package:zapcontrol/widgets/campo_categoria.dart';

class NuevaCategoria extends StatefulWidget {
  const NuevaCategoria({super.key});

  @override
  State<NuevaCategoria> createState() => _NuevaCategoriaState();
}

class _NuevaCategoriaState extends State<NuevaCategoria> {
  final TextEditingController txtNombre = TextEditingController();
  final TextEditingController txtClave = TextEditingController();
  final TextEditingController txtDescripcion = TextEditingController();

  final List<Color> colores = const [
    Color(0xFF3478E5),
    Color(0xFF159B70),
    Color(0xFFF2A51A),
    Color(0xFFE64141),
    Color(0xFF8250D8),
    Color(0xFF102E4B),
    Color(0xFF79502B),
    Color(0xFFE34B9B),
  ];

  int colorSeleccionado = 0;

  @override
  void dispose() {
    txtNombre.dispose();
    txtClave.dispose();
    txtDescripcion.dispose();
    super.dispose();
  }

  void guardarCategoria() {
    final String nombre = txtNombre.text.trim();
    final String clave = txtClave.text.trim().toUpperCase();
    final String descripcion = txtDescripcion.text.trim();

    if (nombre.isEmpty || clave.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Escribe el nombre y la clave corta.'),
        ),
      );
      return;
    }

    final Categoria nueva = Categoria(
      nombre: nombre,
      iniciales: clave,
      descripcion: descripcion.isEmpty
          ? 'Sin descripción'
          : descripcion,
      color: colores[colorSeleccionado],
      activa: true,
    );

    setState(() {
      categorias.add(nueva);
    });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: const Color(0xFF243247),
        elevation: 0,
        title: const Text(
          'Nueva categoría',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.fromLTRB(20, 8, 20, 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CampoCategoria(
                      etiqueta: 'Nombre',
                      ejemplo: 'Ej. Escolar',
                      controlador: txtNombre,
                      obligatorio: true,
                    ),

                    const SizedBox(height: 18),

                    CampoCategoria(
                      etiqueta: 'Clave corta',
                      ejemplo: 'ESC',
                      controlador: txtClave,
                      obligatorio: true,
                    ),

                    const SizedBox(height: 18),

                    CampoCategoria(
                      etiqueta: 'Descripción',
                      ejemplo: 'Descripción de la categoría',
                      controlador: txtDescripcion,
                      maxLineas: 3,
                      maxCaracteres: 120,
                    ),

                    const SizedBox(height: 20),

                    const Text(
                      'Color de identificación',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: List.generate(colores.length, (indice) {
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              colorSeleccionado = indice;
                            });
                          },
                          child: Container(
                            width: 34,
                            height: 34,
                            decoration: BoxDecoration(
                              color: colores[indice],
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: colorSeleccionado == indice
                                    ? Colors.black87
                                    : Colors.transparent,
                                width: 2,
                              ),
                            ),
                            child: colorSeleccionado == indice
                                ? const Icon(
                                    Icons.check,
                                    color: Colors.white,
                                    size: 18,
                                  )
                                : null,
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.white,
                border: Border(
                  top: BorderSide(
                    color: Color(0xFFD6DEE8),
                  ),
                ),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        side: const BorderSide(
                          color: Color(0xFFD6DEE8),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text('Cancelar'),
                    ),
                  ),

                  const SizedBox(width: 12),

                  Expanded(
                    child: ElevatedButton(
                      onPressed: guardarCategoria,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3478E5),
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        'Guardar categoría',
                        textAlign: TextAlign.center,
                      ),
                    ),
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
