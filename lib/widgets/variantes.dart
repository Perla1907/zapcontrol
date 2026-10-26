import 'package:flutter/material.dart';
import 'package:zapcontrol/data/nuevo_producto_data.dart';
import 'package:zapcontrol/models/nuevo_producto.dart';

const Color _azul = Color(0xFF2F5FE3);
const Color _gris = Color(0xFFEEF1F6);
const Color _borde = Color(0xFFDDE3EC);
const Color _textoSuave = Color(0xFF5B6577);
const Color _verde = Color(0xFF2E9E5B);
const Color _rojo = Color(0xFFD93025);
const Color _neutro = Color(0xFFBDBDBD);

/// Nombres de color que la app reconoce al escribir (sin acentos, en minúsculas).
const Map<String, Color> _tonos = {
  'naranja': Color(0xFFF57C00),
  'violeta': Color(0xFF8A00D4),
  'morado': Color(0xFF6A1B9A),
  'lila': Color(0xFFC8A2E8),
  'rosa': Color(0xFFE91E63),
  'fucsia': Color(0xFFD81B8F),
  'turquesa': Color(0xFF00A8A8),
  'celeste': Color(0xFF6EC6F0),
  'amarillo': Color(0xFFF2D100),
  'mostaza': Color(0xFFC9A100),
  'vino': Color(0xFF7A1F3D),
  'guinda': Color(0xFF7A1F3D),
  'marino': Color(0xFF0D2A5C),
  'azul marino': Color(0xFF0D2A5C),
  'cafe': Color(0xFF7B5333),
  'blanco': Color(0xFFFFFFFF),
  'negro': Color(0xFF111111),
  'gris': Color(0xFF8A94A6),
  'azul': Color(0xFF2F5FE3),
  'rojo': Color(0xFFE53935),
  'verde': Color(0xFF2E9E5B),
};

/// Tonos para el cuadro cuando el nombre no se reconoce.
const List<Color> _paleta = [
  Color(0xFFE0A21B),
  Color(0xFF8A00D4),
  Color(0xFFE91E63),
  Color(0xFF00A8A8),
  Color(0xFFF2D100),
  Color(0xFF7A1F3D),
  Color(0xFF0D2A5C),
  Color(0xFF9ACD32),
];

String _sinAcentos(String t) => t
    .replaceAll('á', 'a')
    .replaceAll('é', 'e')
    .replaceAll('í', 'i')
    .replaceAll('ó', 'o')
    .replaceAll('ú', 'u')
    .replaceAll('ü', 'u')
    .replaceAll('ñ', 'n');

/// Busca un tono según lo que escribió la persona. Gana la clave más larga
/// (así "azul marino" no se confunde con "azul").
Color? _tonoDeNombre(String texto) {
  final t = _sinAcentos(texto.toLowerCase().trim());
  if (t.isEmpty) return null;
  final claves = _tonos.keys.toList()
    ..sort((a, b) => b.length.compareTo(a.length));
  for (final k in claves) {
    if (t.contains(k)) return _tonos[k];
  }
  return null;
}

/// Sección "Agregar variante de color" + lista "Variantes del producto".
class SeccionVariantes extends StatefulWidget {
  const SeccionVariantes({super.key});

  @override
  State<SeccionVariantes> createState() => SeccionVariantesState();
}

class SeccionVariantesState extends State<SeccionVariantes> {
  final List<OpcionColor> _colores = List.of(colores);
  final List<Variante> _variantes = [];

  late OpcionColor _colorSel = _colores.first;
  String _tallaSel = tallas.first;
  final _existencias = TextEditingController();

  bool _creandoColor = false;
  final _nombreColor = TextEditingController();
  Color _muestra = _neutro;

  String? _mensaje;
  bool _mensajeEsError = false;

  List<Variante> get variantes => List.unmodifiable(_variantes);

  @override
  void dispose() {
    _existencias.dispose();
    _nombreColor.dispose();
    super.dispose();
  }

  void _decir(String texto, {bool error = false}) {
    setState(() {
      _mensaje = texto;
      _mensajeEsError = error;
    });
  }

  bool _yaExiste(String texto) {
    final t = _sinAcentos(texto.toLowerCase().trim());
    return t.isNotEmpty &&
        _colores.any((c) => _sinAcentos(c.nombre.toLowerCase()) == t);
  }

  String _capitalizar(String t) =>
      t.isEmpty ? t : t[0].toUpperCase() + t.substring(1);

  void _alEscribirColor(String texto) {
    final tono = _tonoDeNombre(texto);
    setState(() {
      if (tono != null) _muestra = tono;
    });
  }

  void _cerrarNuevoColor() {
    setState(() {
      _creandoColor = false;
      _nombreColor.clear();
      _muestra = _neutro;
    });
  }

  void _guardarColor() {
    final nombre = _capitalizar(_nombreColor.text.trim());
    if (nombre.isEmpty) {
      _decir('Escribe el nombre del color.', error: true);
      return;
    }
    if (_yaExiste(nombre)) {
      _decir('El color «$nombre» ya existe. Elígelo en la lista.',
          error: true);
      return;
    }
    final nuevo = OpcionColor(nombre, _muestra);
    setState(() {
      _colores.add(nuevo);
      _colorSel = nuevo;
    });
    _cerrarNuevoColor();
    _decir('Color «$nombre» agregado y seleccionado.');
  }

  void _agregarVariante() {
    final pares = int.tryParse(_existencias.text.trim());
    if (pares == null || pares <= 0) {
      _decir('Ingresa las existencias (mínimo 1).', error: true);
      return;
    }
    final repetida = _variantes.any(
      (v) => v.color.nombre == _colorSel.nombre && v.talla == _tallaSel,
    );
    if (repetida) {
      _decir('Esa combinación de color y talla ya está en la lista.',
          error: true);
      return;
    }
    setState(() {
      _variantes.add(
        Variante(color: _colorSel, talla: _tallaSel, existencias: pares),
      );
      _existencias.clear();
    });
    _decir('Variante agregada.');
  }

  Future<void> _elegirMuestra() async {
    final elegido = await showDialog<Color>(
      context: context,
      builder: (_) => SimpleDialog(
        title: const Text('Tono del color'),
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Wrap(
              spacing: 12,
              runSpacing: 12,
              children: [
                for (final c in _paleta)
                  GestureDetector(
                    onTap: () => Navigator.pop(context, c),
                    child: CircleAvatar(backgroundColor: c, radius: 20),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
    if (elegido != null) setState(() => _muestra = elegido);
  }

  @override
  Widget build(BuildContext context) {
    final total = _variantes.fold<int>(0, (s, v) => s + v.existencias);
    final yaExiste = _yaExiste(_nombreColor.text);
    final noReconocido = _nombreColor.text.trim().isNotEmpty &&
        !yaExiste &&
        _tonoDeNombre(_nombreColor.text) == null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: _borde, height: 24),
        const Text(
          'Agregar variante de color',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const _Etiqueta('Seleccionar color'),
            InkWell(
              onTap: () {
                if (_creandoColor) {
                  _cerrarNuevoColor();
                } else {
                  setState(() => _creandoColor = true);
                }
              },
              child: const Padding(
                padding: EdgeInsets.symmetric(vertical: 4),
                child: Text(
                  '+ Nuevo color',
                  style: TextStyle(
                    color: _azul,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 6),
        _Caja(
          child: DropdownButton<OpcionColor>(
            value: _colorSel,
            isExpanded: true,
            underline: const SizedBox(),
            icon: const Icon(Icons.keyboard_arrow_down),
            borderRadius: BorderRadius.circular(16),
            style: const TextStyle(fontSize: 17, color: Colors.black87),
            items: [
              for (final c in _colores)
                DropdownMenuItem(
                  value: c,
                  child: Row(
                    children: [
                      _Punto(c.color),
                      const SizedBox(width: 10),
                      Text(c.nombre),
                    ],
                  ),
                ),
            ],
            onChanged: (c) => setState(() => _colorSel = c ?? _colorSel),
          ),
        ),
        if (_creandoColor) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _borde),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _Etiqueta('Nuevo color'),
                const SizedBox(height: 6),
                Row(
                  children: [
                    Expanded(
                      child: _Caja(
                        child: TextField(
                          controller: _nombreColor,
                          textCapitalization: TextCapitalization.sentences,
                          onChanged: _alEscribirColor,
                          onSubmitted: (_) => _guardarColor(),
                          decoration: const InputDecoration(
                            hintText: 'Ej. Naranja',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Container(
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        color: _muestra,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: _borde),
                      ),
                    ),
                  ],
                ),
                if (yaExiste)
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      'Ese color ya existe. Elígelo en la lista.',
                      style: TextStyle(fontSize: 12, color: _rojo),
                    ),
                  )
                else if (noReconocido)
                  const Padding(
                    padding: EdgeInsets.only(top: 6),
                    child: Text(
                      'No reconozco ese nombre: toca el cuadro para elegir el tono.',
                      style: TextStyle(fontSize: 12, color: _textoSuave),
                    ),
                  ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: _cerrarNuevoColor,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: Colors.black87,
                          side: const BorderSide(color: _borde),
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Cancelar'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 2,
                      child: FilledButton(
                        onPressed: yaExiste ? null : _guardarColor,
                        style: FilledButton.styleFrom(
                          backgroundColor: _azul,
                          minimumSize: const Size.fromHeight(48),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Text('Guardar color'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
        const SizedBox(height: 14),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Etiqueta('Talla'),
                  const SizedBox(height: 6),
                  _Caja(
                    child: DropdownButton<String>(
                      value: _tallaSel,
                      isExpanded: true,
                      underline: const SizedBox(),
                      icon: const Icon(Icons.keyboard_arrow_down),
                      borderRadius: BorderRadius.circular(16),
                      style:
                          const TextStyle(fontSize: 17, color: Colors.black87),
                      items: [
                        for (final t in tallas)
                          DropdownMenuItem(value: t, child: Text(t)),
                      ],
                      onChanged: (t) =>
                          setState(() => _tallaSel = t ?? _tallaSel),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _Etiqueta('Existencias'),
                  const SizedBox(height: 6),
                  _Caja(
                    child: TextField(
                      controller: _existencias,
                      keyboardType: TextInputType.number,
                      onSubmitted: (_) => _agregarVariante(),
                      style: const TextStyle(fontSize: 17),
                      decoration: const InputDecoration(
                        hintText: 'Ej. 5',
                        hintStyle: TextStyle(color: Color(0xFF8A94A6)),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        SizedBox(
          width: double.infinity,
          height: 50,
          child: OutlinedButton.icon(
            onPressed: _agregarVariante,
            icon: const Icon(Icons.add),
            label: const Text(
              'Agregar variante',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.black87,
              backgroundColor: _gris,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14),
              ),
            ),
          ),
        ),
        if (_mensaje != null)
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Text(
              _mensaje!,
              style: TextStyle(
                fontSize: 12,
                color: _mensajeEsError ? _rojo : _verde,
              ),
            ),
          ),
        const Divider(color: _borde, height: 32),
        const Text(
          'Variantes del producto',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
        ),
        const SizedBox(height: 8),
        if (_variantes.isEmpty)
          const Text(
            'Aún no hay variantes. Agrega al menos una.',
            style: TextStyle(fontSize: 13, color: _textoSuave),
          )
        else
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: _borde),
            ),
            child: Column(
              children: [
                for (int i = 0; i < _variantes.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 6),
                    child: Row(
                      children: [
                        _Punto(_variantes[i].color.color, tamano: 30),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${_variantes[i].color.nombre} · Talla ${_variantes[i].talla}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              Text(
                                '${_variantes[i].existencias} pares',
                                style: const TextStyle(
                                  fontSize: 12,
                                  color: _textoSuave,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          tooltip: 'Quitar',
                          onPressed: () =>
                              setState(() => _variantes.removeAt(i)),
                          icon: const Icon(Icons.delete_outline),
                        ),
                      ],
                    ),
                  ),
                const Divider(color: _borde),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_variantes.length} '
                      '${_variantes.length == 1 ? 'variante' : 'variantes'}',
                      style: const TextStyle(color: _textoSuave),
                    ),
                    Text(
                      '$total pares',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        const SizedBox(height: 18),
      ],
    );
  }
}

class _Etiqueta extends StatelessWidget {
  final String texto;

  const _Etiqueta(this.texto);

  @override
  Widget build(BuildContext context) => Text(
        texto,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 14,
          color: _textoSuave,
        ),
      );
}

class _Caja extends StatelessWidget {
  final Widget child;

  const _Caja({required this.child});

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        constraints: const BoxConstraints(minHeight: 52),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: _gris,
          borderRadius: BorderRadius.circular(16),
        ),
        child: child,
      );
}

class _Punto extends StatelessWidget {
  final Color color;
  final double tamano;

  const _Punto(this.color, {this.tamano = 16});

  @override
  Widget build(BuildContext context) => Container(
        width: tamano,
        height: tamano,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
          border: Border.all(color: _borde),
        ),
      );
}