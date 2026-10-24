import 'package:flutter/material.dart';

class TarjetaEstadistica extends StatelessWidget {
  final String valor;
  final String etiqueta;
  final Color colorValor;

  const TarjetaEstadistica({
    super.key,
    required this.valor,
    required this.etiqueta,
    this.colorValor = const Color(0xFF122036),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFFEEF2F7),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            valor,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: colorValor,
            ),
          ),
          const SizedBox(height: 2),
          Text(
            etiqueta,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w600,
              color: Color(0xFF6B7A90),
            ),
          ),
        ],
      ),
    );
  }
}
