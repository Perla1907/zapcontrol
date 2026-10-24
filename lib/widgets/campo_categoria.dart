import 'package:flutter/material.dart';

class CampoCategoria extends StatelessWidget {
  final String etiqueta;
  final String ejemplo;
  final TextEditingController controlador;
  final bool obligatorio;
  final int maxLineas;
  final int? maxCaracteres;
  final Function(String)? alCambiar;

  const CampoCategoria({
    super.key,
    required this.etiqueta,
    required this.ejemplo,
    required this.controlador,
    this.obligatorio = false,
    this.maxLineas = 1,
    this.maxCaracteres,
    this.alCambiar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          obligatorio ? '$etiqueta *' : etiqueta,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),

        const SizedBox(height: 7),

        TextField(
          controller: controlador,
          maxLines: maxLineas,
          maxLength: maxCaracteres,
          onChanged: alCambiar,
          style: const TextStyle(
            color: Colors.black87,
            fontSize: 14,
          ),
          decoration: InputDecoration(
            hintText: ejemplo,
            hintStyle: const TextStyle(
              color: Colors.black45,
              fontSize: 13,
            ),
            filled: true,
            fillColor: const Color(0xFFF3F6FA),
            contentPadding: const EdgeInsets.all(14),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFD6DEE8),
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFFD6DEE8),
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Color(0xFF3478E5),
                width: 1.5,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
