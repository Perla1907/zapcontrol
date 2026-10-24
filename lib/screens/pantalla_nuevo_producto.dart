import 'package:flutter/material.dart';
import 'package:zapcontrol/data/nuevo_producto_data.dart';
import 'package:zapcontrol/widgets/formulario.dart';

class PantallaNuevoProducto extends StatelessWidget {
  const PantallaNuevoProducto({super.key});

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
          const CampoDesplegable(
            etiqueta: 'Marca',
            textoGuia: 'Selecciona una marca',
            opciones: marcas,
          ),
          const CampoDesplegable(
            etiqueta: 'Categorias',
            textoGuia: 'Selecciona una categoria',
            opciones: categorias,
          ),
          const CampoTexto(etiqueta: 'Modelo', textoGuia: 'Escribe el modelo'),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CampoDesplegable(
                  etiqueta: 'Talla',
                  textoGuia: 'Talla',
                  opciones: tallas,
                ),
              ),
              SizedBox(width: 14),
              Expanded(
                child: CampoDesplegable(
                  etiqueta: 'Color',
                  textoGuia: 'Color',
                  opciones: colores,
                ),
              ),
            ],
          ),
          const Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: CampoTexto(etiqueta: 'Precio', textoGuia: '\$0.00'),
              ),
              SizedBox(width: 14),
              Expanded(
                child: CampoTexto(etiqueta: 'Existencias', textoGuia: '0'),
              ),
            ],
          ),
          const SizedBox(height: 6),
          SizedBox(
            width: double.infinity,
            height: 56,
            child: OutlinedButton(
              onPressed: () {},
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
