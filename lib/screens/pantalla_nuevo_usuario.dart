import 'package:flutter/material.dart';
import 'package:zapcontrol/screens/pantalla_nuevo_usuario_confirmacion.dart';
import 'package:zapcontrol/widgets/tarjeta_nuevo_usuario.dart';

class PantallaNuevoUsuario extends StatefulWidget {
  const PantallaNuevoUsuario({super.key});

  @override
  State<PantallaNuevoUsuario> createState() => _PantallaNuevoUsuarioState();
}

class _PantallaNuevoUsuarioState extends State<PantallaNuevoUsuario> {
  final _nombreCompleto = TextEditingController();
  final _usuario = TextEditingController();
  final _correo = TextEditingController();
  final _password = TextEditingController();

  String? _rolSeleccionado = 'Empleado';
  final List<String> _roles = ['Administrador', 'Empleado'];
  bool _usuarioActivo = true;

  @override
  void dispose() {
    _nombreCompleto.dispose();
    _usuario.dispose();
    _correo.dispose();
    _password.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const azul = Color(0xFF2875FF);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Nuevo usuario',
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
          TarjetaNuevoUsuario(
            label: 'Nombre completo',
            hintText: 'Ej. Perla Joceline Martínez Meza',
            controller: _nombreCompleto,
          ),
          const SizedBox(height: 16),
          TarjetaNuevoUsuario(
            label: 'Nombre de usuario',
            hintText: 'Perla.Martínez',
            controller: _usuario,
          ),
          const SizedBox(height: 16),
          TarjetaNuevoUsuario(
            label: 'Correo electrónico',
            hintText: '1225100343.pjmm@correo.com',
            controller: _correo,
          ),
          const SizedBox(height: 16),
          const Text(
            'Rol',
            style: TextStyle(
              color: Color(0xFF60718A),
              fontWeight: FontWeight.w600,
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 6),
          DropdownButtonFormField<String>(
            value: _rolSeleccionado,
            decoration: InputDecoration(
              filled: true,
              fillColor: const Color(0xFFEDF2F8),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: BorderSide.none,
              ),
            ),
            items: _roles.map((String rol) {
              return DropdownMenuItem(value: rol, child: Text(rol));
            }).toList(),
            onChanged: (String? nuevoRol) {
              setState(() {
                _rolSeleccionado = nuevoRol;
              });
            },
          ),
          const SizedBox(height: 16),

          TarjetaNuevoUsuario(
            label: 'Contraseña',
            hintText: 'Pepito2025',
            controller: _password,
          ),
          const SizedBox(height: 16),
          const SizedBox(height: 20),

          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              border: Border.all(color: const Color(0xFFDCE5F2)),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Material(
                color: Colors.transparent,
                child: Column(
                  children: [
                    const Divider(height: 1, color: Color(0xFFDCE5F2)),
                    SwitchListTile(
                      title: const Text(
                        'Usuario activo',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF172B4D),
                        ),
                      ),
                      value: _usuarioActivo,
                      activeColor: azul,
                      onChanged: (val) {
                        setState(() {
                          _usuarioActivo = val;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => PantallaNuevoUsuarioConfirmacion(
                      nombre: _nombreCompleto.text,
                      usuario: _usuario.text,
                      rol: _rolSeleccionado ?? 'Empleado',
                      correo: _correo.text,
                      password: _password.text,
                    ),
                  ),
                );
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
                'Dar de alta',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
