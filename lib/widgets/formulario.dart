import 'package:flutter/material.dart';

class TarjetaFoto extends StatelessWidget {
  const TarjetaFoto({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Colors.white,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(22),
        side: const BorderSide(color: Color(0xFFDDE3EC)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Row(
          children: [
            const CircleAvatar(
              radius: 36,
              backgroundColor: Color(0xFFEEF1F6),
              child: Icon(
                Icons.cloud_outlined,
                color: Color(0xFF2F5FE3),
                size: 28,
              ),
            ),
            const SizedBox(width: 16),
            const Expanded(
              child: Text(
                'Fotografía del\nproducto',
                style: TextStyle(fontSize: 15, color: Color(0xFF5B6577)),
              ),
            ),
            const CircleAvatar(
              radius: 20,
              backgroundColor: Color(0xFFEEF1F6),
              child: Icon(Icons.photo_camera_outlined, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}

class CampoTexto extends StatelessWidget {
  final String etiqueta;
  final String textoGuia;
  final TextEditingController? controlador;
  final TextInputType? teclado;

  const CampoTexto({
    super.key,
    required this.etiqueta,
    required this.textoGuia,
    this.controlador,
    this.teclado,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            etiqueta,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF5B6577),
            ),
          ),
          const SizedBox(height: 6),
          Card(
            elevation: 0,
            color: const Color(0xFFEEF1F6),
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextField(
                controller: controlador,
                keyboardType: teclado,
                style: const TextStyle(fontSize: 17),
                decoration: InputDecoration(
                  hintText: textoGuia,
                  hintStyle: const TextStyle(color: Color(0xFF8A94A6)),
                  border: InputBorder.none,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CampoDesplegable extends StatefulWidget {
  final String etiqueta;
  final String textoGuia;
  final List<String> opciones;
  final ValueChanged<String?>? alCambiar;

  const CampoDesplegable({
    super.key,
    required this.etiqueta,
    required this.textoGuia,
    required this.opciones,
    this.alCambiar,
  });

  @override
  State<CampoDesplegable> createState() => _CampoDesplegableState();
}

class _CampoDesplegableState extends State<CampoDesplegable> {
  String? seleccion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.etiqueta,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
              color: Color(0xFF5B6577),
            ),
          ),
          const SizedBox(height: 6),
          Card(
            elevation: 0,
            color: const Color(0xFFEEF1F6),
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: DropdownButton<String>(
                value: seleccion,
                isExpanded: true,
                underline: const SizedBox(),
                icon: const Icon(Icons.keyboard_arrow_down),
                borderRadius: BorderRadius.circular(16),
                style: const TextStyle(fontSize: 17, color: Colors.black87),
                hint: Text(
                  widget.textoGuia,
                  style: const TextStyle(
                    fontSize: 17,
                    color: Color(0xFF8A94A6),
                  ),
                ),
                items: widget.opciones
                    .map(
                      (String opcion) => DropdownMenuItem<String>(
                        value: opcion,
                        child: Text(opcion, overflow: TextOverflow.ellipsis),
                      ),
                    )
                    .toList(),
                onChanged: (String? nueva) {
                  setState(() => seleccion = nueva);
                  widget.alCambiar?.call(nueva);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}