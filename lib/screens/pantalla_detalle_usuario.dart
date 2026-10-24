import 'package:flutter/material.dart';

class PantallaDetalleUsuario extends StatelessWidget {
  final String nombre;
  final String usuario;
  final String correo;
  final String rol;
  final bool activo;
  final int ventasRegistradas;

  const PantallaDetalleUsuario({
    super.key,
    required this.nombre ,
    required this.usuario,
    required this.correo,
    required this.rol,
    required this.activo,
    required this.ventasRegistradas,
  });

  void _mostrarAlertaEliminar(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: const Color(0xFFCBD5E1),
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              
              Text(
                '¿Eliminar a $nombre?',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF172B4D),
                ),
              ),
              const SizedBox(height: 12),
              
              Text(
                'Se borrará su cuenta ($usuario) y ya no podrá iniciar sesión. Sus ventas y movimientos se conservan en el historial. Esta acción no se puede deshacer.',
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF60718A),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 24),
              
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); 
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFFFEEED),
                    foregroundColor: const Color(0xFFD32F2F),
                    elevation: 0,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Sí, eliminar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 12),
              SizedBox(
                width: double.infinity,
                child: TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: const Color(0xFFF1F5F9),
                    foregroundColor: const Color(0xFF172B4D),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                  ),
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const azul = Color(0xFF2875FF);
    final iniciales = nombre.isNotEmpty
        ? nombre.trim().split(' ').map((e) => e[0]).take(2).join().toUpperCase()
        : 'US';

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Usuario',
          style: TextStyle(
            color: Color(0xFF172B4D),
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Color(0xFF172B4D)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: BoxDecoration(
                color: const Color(0xFFE2E8F0),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  iniciales,
                  style: const TextStyle(
                    color: Color(0xFF2875FF),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),


          Center(
            child: Text(
              nombre,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF172B4D),
              ),
            ),
          ),
          const SizedBox(height: 6),

          Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                color: const Color(0xFFDCFCE7),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                activo ? 'Activo' : 'Inactivo',
                style: const TextStyle(
                  color: Color(0xFF16A34A),
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFE2E8F0)),
            ),
            child: Column(
              children: [
                _buildFilaDetalle('Usuario', usuario, esDestacado: true),
                const Divider(height: 24, color: Color(0xFFF1F5F9)),
                _buildFilaDetalle('Correo', correo),
                const Divider(height: 24, color: Color(0xFFF1F5F9)),
                _buildFilaDetalle('Rol', rol),
                const Divider(height: 24, color: Color(0xFFF1F5F9)),
                _buildFilaDetalle('Contraseña', 'Definitiva'),
                const Divider(height: 24, color: Color(0xFFF1F5F9)),
                _buildFilaDetalle('Ventas registradas', '$ventasRegistradas'),
              ],
            ),
          ),
          const SizedBox(height: 24),


          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: azul,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Editar usuario',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Botón: Cambiar contraseña
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () {
              },
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFF1F5F9),
                foregroundColor: const Color(0xFF172B4D),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Cambiar contraseña',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          // Botón: Eliminar usuario
          SizedBox(
            width: double.infinity,
            child: TextButton(
              onPressed: () => _mostrarAlertaEliminar(context),
              style: TextButton.styleFrom(
                backgroundColor: const Color(0xFFFFEEED),
                foregroundColor: const Color(0xFFD32F2F),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: const Text(
                'Eliminar usuario',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilaDetalle(String label, String valor, {bool esDestacado = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF94A3B8),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          valor,
          style: TextStyle(
            fontSize: 14,
            color: const Color(0xFF172B4D),
            fontWeight: esDestacado ? FontWeight.bold : FontWeight.w600,
          ),
        ),
      ],
    );
  }
}