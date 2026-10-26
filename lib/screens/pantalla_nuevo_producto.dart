import 'package:flutter/material.dart';
import 'package:zapcontrol/data/nuevo_producto_data.dart';
import 'package:zapcontrol/models/nuevo_producto.dart';
import 'package:zapcontrol/screens/pantalla_producto_guardado.dart';
import 'package:zapcontrol/widgets/codigo_barras.dart';
import 'package:zapcontrol/widgets/formulario.dart';
import 'package:zapcontrol/widgets/variantes.dart';

class PantallaNuevoProducto extends StatefulWidget {
  const PantallaNuevoProducto({super.key});

  @override
  State<PantallaNuevoProducto> createState() => _PantallaNuevoProductoState();
}

class _PantallaNuevoProductoState extends State<PantallaNuevoProducto> {
  final _modelo = TextEditingController();
  final _precio = TextEditingController();
  final _variantesKey = GlobalKey<SeccionVariantesState>();
  String? _marca;
  String? _categoria;
  String? _ubicacion;

  @override
  void dispose() {
    _modelo.dispose();
    _precio.dispose();
    super.dispose();
  }

  void _aviso(String texto) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text(texto)));
  }

  void _guardar() {
    final precio =
        double.tryParse(_precio.text.replaceAll(RegExp(r'[\$,\s]'), ''));
    final variantes = _variantesKey.currentState!.variantes;

    if (_marca == null ||
        _modelo.text.trim().isEmpty ||
        _categoria == null ||
        precio == null ||
        _ubicacion == null) {
      _aviso('Completa marca, modelo, categoría, precio y ubicación');
      return;
    }
    if (variantes.isEmpty) {
      _aviso('Agrega al menos una variante');
      return;
    }

    final n = siguienteConsecutivo();
    final producto = Producto(
      marca: _marca!,
      modelo: _modelo.text.trim(),
      categoria: _categoria!,
      precio: precio,
      ubicacion: _ubicacion!,
      variantes: variantes,
      sku: 'ZP${n.toString().padLeft(4, '0')}',
      codigoBarras: generarEan13('750123${n.toString().padLeft(6, '0')}'),
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => PantallaProductoGuardado(producto: producto),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        leading: Center(
          child: SizedBox(
            width: 40,
            height: 40,
            child: Card(
              elevation: 0,
              color: const Color(0xFFEEF1F6),
              margin: EdgeInsets.zero,
              clipBehavior: Clip.antiAlias,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: InkWell(
                onTap: () => Navigator.maybePop(context),
                child: const Icon(Icons.arrow_back_ios_new, size: 18),
              ),
            ),
          ),
        ),
        title: const Text(
          'Nuevo producto',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          const TarjetaFoto(),
          const SizedBox(height: 18),
          CampoDesplegable(
            etiqueta: 'Marca',
            textoGuia: 'Selecciona una marca',
            opciones: marcas,
            alCambiar: (v) => _marca = v,
          ),
          CampoTexto(
            etiqueta: 'Modelo',
            textoGuia: 'Escribe el modelo',
            controlador: _modelo,
          ),
          CampoDesplegable(
            etiqueta: 'Categoría',
            textoGuia: 'Selecciona una categoría',
            opciones: categorias,
            alCambiar: (v) => _categoria = v,
          ),
          CampoTexto(
            etiqueta: 'Precio',
            textoGuia: '\$0.00',
            controlador: _precio,
            teclado: const TextInputType.numberWithOptions(decimal: true),
          ),
          CampoDesplegable(
            etiqueta: 'Ubicación',
            textoGuia: 'Selecciona una ubicación',
            opciones: ubicaciones,
            alCambiar: (v) => _ubicacion = v,
          ),
          SeccionVariantes(key: _variantesKey),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton(
              onPressed: _guardar,
              style: OutlinedButton.styleFrom(
                backgroundColor: const Color(0xFF2F5FE3),
                foregroundColor: Colors.white,
                side: BorderSide.none,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: const Text(
                'Guardar producto',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
