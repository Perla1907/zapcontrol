import 'package:flutter/material.dart';

class PantallaNuevoUsuarioConfirmacion extends StatelessWidget {
  final String nombre;
  final String usuario;
  final String rol;
  final String correo;
  final String password;

  const PantallaNuevoUsuarioConfirmacion({
    super.key,
    required this.nombre,
    required this.usuario,
    required this.rol,
    required this.correo,
    required this.password,
  });

  @override
  Widget build(BuildContext context) {
    const azul = Color(0xFF2875FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Color(0xFF172B4D)),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: [

          Center(
            child: Container(
              width: 72,
              height: 72,
              decoration: const BoxDecoration(
                color: Color(0xFFE2F4E8), 
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.check,
                color: Color(0xFF238636),
                size: 36,
              ),
            ),
          ),
          const SizedBox(height: 16),

          const Center(
            child: Text(
              'Usuario dado de alta',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF172B4D),
              ),
            ),
          ),
          const SizedBox(height: 24),

          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xFFDCE5F2)),
            ),
            child: Column(
              children: [
                _filaDetalle('Nombre', nombre),
                const Divider(height: 24, color: Color(0xFFEDF2F8)),
                _filaDetalle('Usuario', usuario),
                const Divider(height: 24, color: Color(0xFFEDF2F8)),
                _filaDetalle('Rol', rol),
                const Divider(height: 24, color: Color(0xFFEDF2F8)),
                _filaDetalle('Correo', correo),
                const Divider(height: 24, color: Color(0xFFEDF2F8)),
                _filaDetalle('Contraseña temporal', password),
              ],
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: azul,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Enviar credenciales por correo',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDF2F8),
                foregroundColor: const Color(0xFF172B4D),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Dar de alta a otra persona',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 12),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFEDF2F8),
                foregroundColor: const Color(0xFF172B4D),
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Ver empleados',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _filaDetalle(String etiqueta, String valor) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          etiqueta,
          style: const TextStyle(
            fontSize: 13,
            color: Color(0xFF8290A5),
            fontWeight: FontWeight.w500,
          ),
        ),
        Text(
          valor,
          style: const TextStyle(
            fontSize: 14,
            color: Color(0xFF172B4D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
