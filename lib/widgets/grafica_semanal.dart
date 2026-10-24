import 'package:flutter/material.dart';

class GraficaSemanal extends StatelessWidget {
  final String titulo;
  final List<double> valores;
  final int indiceDestacado;

  const GraficaSemanal({
    super.key,
    required this.titulo,
    required this.valores,
    this.indiceDestacado = 4,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFE1E7EF)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titulo,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF122036),
            ),
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 70,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                for (int i = 0; i < valores.length; i++)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 3),
                      child: Container(
                        height: 70 * valores[i],
                        decoration: BoxDecoration(
                          color: i == indiceDestacado
                              ? const Color(0xFF2D6FE0)
                              : const Color(0xFF7FB8F5),
                          borderRadius: BorderRadius.circular(4),
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
