import 'package:flutter/material.dart';
import 'package:zapcontrol/screens/pantalla_detalle_usuario.dart';

class TarjetaListaUsuario extends StatelessWidget {
  final String nombre;
  final String usuario;
  final String correo;
  final String rol;
  final bool activo;
  final int ventasRegistradas;
  final ValueChanged<bool>? onEstadoChanged;

  const TarjetaListaUsuario({
    super.key,
    required this.nombre,
    required this.usuario,
    required this.correo,
    required this.rol,
    required this.activo,
    required this.ventasRegistradas,
    this.onEstadoChanged,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PantallaDetalleUsuario(
              nombre: nombre,
              usuario: usuario,
              correo: correo,
              rol: rol,
              activo: activo,
              ventasRegistradas: ventasRegistradas,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          border: Border.all(color: const Color(0xFFFDCE5F2)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: [
              Container(
                width: 42,
                height: 42,
                decoration: BoxDecoration(
                  color: const Color(0xFFFEDF2F8),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.person_outlined,
                  color: Color(0xFF243955),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      nombre,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                        color: Color(0xFF172B4D),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      correo,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Color(0xFF60718A),
                      ),
                    ),
                  ],
                ),
              ),
              // 👇 AQUÍ ESTÁ DE NUEVO TU BOTÓN (SWITCH)
              Switch(
                value: activo,
                onChanged: onEstadoChanged,
                activeColor: const Color(0xFF2196F3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
