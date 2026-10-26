import 'package:flutter/material.dart';
import 'package:zapcontrol/screens/pantalla_login.dart';
import 'package:zapcontrol/services/servicio_auth.dart';
import 'package:zapcontrol/widgets/grafica_semanal.dart';
import 'package:zapcontrol/widgets/tarjeta_estadistica.dart';

class PantallaInicio extends StatelessWidget {
  const PantallaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    // Permite hacer scroll si el contenido no cabe en la pantalla
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(80),
              child: Image.asset(
                'assets/images/logo.png',
                width: 50,
                height: 50,
              ),
            ),
            const SizedBox(width: 10),
            const Text('ZapControl'),
          ],
        ),
        titleTextStyle: const TextStyle(fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.black, fontSize: 22),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.account_circle_outlined,
              color: Colors.indigo,
              size: 32.0,
            ),
            onPressed: () {
              _mostrarModalPerfil(context);
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16), // Margen alrededor de todo
        child: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Todo alineado a la izquierda
          children: [
            // ----- Saludo -----
            Text(
              'Hola, ${ServicioAuth.usuarioActual?.usuario}',
              style: const TextStyle(fontSize: 13, color: Color(0xFF6B7A90)),
            ),
            const SizedBox(height: 2),
            Text(
              '${ServicioAuth.usuarioActual?.rol}',
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
      ),
    );
  }
}

void _mostrarModalPerfil(BuildContext context) {
  // Obtenemos los datos del usuario actual
  final usuario = ServicioAuth.usuarioActual;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min, // Se ajusta al tamaño del contenido
          children: [
            // Pequeña barra indicadora superior
            Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            const SizedBox(height: 20),
            
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFF2D6FE0),
              child: Icon(Icons.person, size: 50, color: Colors.white),
            ),
            const SizedBox(height: 12),

            Text(
              usuario?.nombre ?? 'Usuario', 
              style: const TextStyle(
                fontSize: 18, 
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 6),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.blue.shade50,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                usuario?.rol ?? 'Sin rol',
                style: TextStyle(
                  color: Colors.blue.shade700, 
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            
            const SizedBox(height: 20),
            const Divider(),

            ListTile(
              leading: const Icon(Icons.exit_to_app, color: Colors.red),
              title: const Text(
                'Cerrar sesión', 
                style: TextStyle(color: Colors.red, fontWeight: FontWeight.w500),
              ),
              onTap: () {
                Navigator.pop(context);
                
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaLogin()),
                    (route) => false
                );
              },
            ),
            const SizedBox(height: 10),
          ],
        ),
      );
    },
  );
}
