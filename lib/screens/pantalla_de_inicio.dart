import 'package:flutter/material.dart';
import 'package:zapcontrol/widgets/grafica_semanal.dart';
import 'package:zapcontrol/widgets/tarjeta_estadistica.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    // Permite hacer scroll si el contenido no cabe en la pantalla
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16), // Margen alrededor de todo
      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Todo alineado a la izquierda
        children: [
          // ----- Saludo -----
          const Text(
            'Hola, Ana (Administradora)',
            style: TextStyle(fontSize: 13, color: Color(0xFF6B7A90)),
          ),
          const SizedBox(height: 2),
          const Text(
            'Vista general del negocio',
            style: TextStyle(fontSize: 13, color: Color(0xFF6B7A90)),
          ),
          const SizedBox(height: 12),

          // ----- Los 4 recuadros en cuadrícula de 2 columnas -----
          GridView.count(
            crossAxisCount: 2, // 2 columnas
            crossAxisSpacing: 10, // Espacio horizontal entre recuadros
            mainAxisSpacing: 10, // Espacio vertical entre recuadros
            childAspectRatio:
                1.5, // Ancho = 1.5 veces el alto (más bajo = más altos)
            shrinkWrap: true, // Ocupa solo el alto que necesita
            physics: const NeverScrollableScrollPhysics(), // Sin scroll propio
            children: const [
              TarjetaEstadistica(valor: '152', etiqueta: 'Productos'),
              TarjetaEstadistica(valor: '0', etiqueta: 'Ventas de la sesión'),
              TarjetaEstadistica(
                valor: '3',
                etiqueta: 'Alertas de stock',
                colorValor: Color(0xFFE3971C), // Ámbar
              ),
              TarjetaEstadistica(
                valor: '\$0', // La \ es para que Dart muestre el signo $ normal
                etiqueta: 'Total vendido',
                colorValor: Color(0xFF1E9E63), // Verde
              ),
            ],
          ),
          const SizedBox(height: 12),

          // ----- Gráfica de barras -----
          const GraficaSemanal(
            titulo: 'Ventas de la semana (todo el equipo)',
            // Una altura por día, de 0 a 1
            valores: [0.35, 0.55, 0.40, 0.70, 0.50, 0.30, 0.20],
          ),
          const SizedBox(height: 16),

          // ----- Ventas por empleado -----
          const Text(
            'Ventas por empleado',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF122036),
            ),
          ),
          const SizedBox(height: 8),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE1E7EF)),
            ),
            child: const Text(
              'Aún no hay ventas registradas en esta sesión.',
              style: TextStyle(fontSize: 13, color: Color(0xFF6B7A90)),
            ),
          ),
        ],
      ),
    );
  }
}
