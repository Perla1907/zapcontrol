import 'package:flutter/material.dart';
import 'package:zapcontrol/models/nuevo_producto.dart';
import 'package:zapcontrol/widgets/codigo_barras.dart';

const Color _azul = Color(0xFF2F5FE3);
const Color _gris = Color(0xFFEEF1F6);
const Color _borde = Color(0xFFDDE3EC);
const Color _textoSuave = Color(0xFF5B6577);

class PantallaProductoGuardado extends StatelessWidget {
  final Producto producto;

  const PantallaProductoGuardado({super.key, required this.producto});

  @override
  Widget build(BuildContext context) {
    final n = producto.variantes.length;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        automaticallyImplyLeading: false,
        title: const Text(
          'Producto guardado',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 22,
                backgroundColor: Color(0xFFE3F5EA),
                child: Icon(Icons.check, color: Color(0xFF2E9E5B)),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${producto.marca} ${producto.modelo}',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Text(
                      '$n ${n == 1 ? 'variante' : 'variantes'} · '
                      '${producto.totalPares} pares · ${producto.ubicacion}',
                      style: const TextStyle(color: _textoSuave, fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: _borde),
            ),
            child: Column(
              children: [
                const Text(
                  'Código de barras',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 14),
                CodigoBarras(ean13: producto.codigoBarras),
                const SizedBox(height: 8),
                Text(
                  producto.codigoBarras,
                  style: const TextStyle(letterSpacing: 2, color: _textoSuave),
                ),
                const SizedBox(height: 10),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  decoration: BoxDecoration(
                    color: const Color(0xFFE6ECFD),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    'SKU ${producto.sku}',
                    style: const TextStyle(
                      color: _azul,
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 14),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: _gris,
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              children: [
                Icon(Icons.qr_code_2, size: 56),
                SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Código QR',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                      Text(
                        'Identificador adicional',
                        style: TextStyle(color: _textoSuave, fontSize: 13),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 56,
            child: FilledButton(
              onPressed: () {
                ScaffoldMessenger.of(context)
                  ..hideCurrentSnackBar()
                  ..showSnackBar(
                    SnackBar(content: Text('Enviando $n etiquetas a imprimir')),
                  );
              },
              style: FilledButton.styleFrom(
                backgroundColor: _azul,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Text(
                'Imprimir $n ${n == 1 ? 'etiqueta' : 'etiquetas'} '
                '(una por variante)',
                textAlign: TextAlign.center,
                style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 10),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Registrar otro producto'),
          ),
        ],
      ),
    );
  }
}