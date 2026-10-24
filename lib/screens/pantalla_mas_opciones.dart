import 'package:flutter/material.dart';
import 'package:zapcontrol/screens/pantalla_categoria.dart';
import 'package:zapcontrol/screens/pantalla_lista_usuario.dart';

class PantallaMasOpciones extends StatefulWidget {
  const PantallaMasOpciones({Key? key}) : super(key: key);

  @override
  State<PantallaMasOpciones> createState() => _PantallaMasOpcionesState();
}

class _PantallaMasOpcionesState extends State<PantallaMasOpciones> {
  bool _notificacionesEnabled = true;
  bool _modoOscuroEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Configuración',
          style: TextStyle(
            color: Color(0xFF0F172A),
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  _buildConfigItem(
                    icon: Icons.person_outlined,
                    title: 'Perfil de usuario',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildConfigItem(
                    icon: Icons.inventory_2_outlined,
                    title: 'Usuarios',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PantallaListaUsuario(),
                        ),
                      );
                    },
                  ),
                  _buildDivider(),
                  _buildConfigItem(
                    icon: Icons.local_offer_outlined,
                    title: 'Sucursales',
                    onTap: () {},
                  ),
                  _buildDivider(),
                  _buildConfigItem(
                    icon: Icons.settings_outlined,
                    title: 'Categorias',
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => PantallaCategorias(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey.shade200),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.05),
                    blurRadius: 10,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Notificaciones',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Switch(
                          value: _notificacionesEnabled,
                          activeThumbColor: const Color(0xFF2196F3),
                          onChanged: (value) {
                            setState(() {
                              _notificacionesEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                  _buildDivider(),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 12.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Modo Oscuro',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF0F172A),
                          ),
                        ),
                        Switch(
                          value: _modoOscuroEnabled,
                          activeThumbColor: Colors.blue,
                          onChanged: (value) {
                            setState(() {
                              _modoOscuroEnabled = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildConfigItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: const Color(0xFFF1F5F9),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(icon, color: const Color(0xFF0F172A)),
      ),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Color(0xFF0F172A),
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
        color: Colors.grey,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider() {
    return Divider(
      height: 1,
      thickness: 1,
      color: Colors.grey.shade100,
      indent: 16,
      endIndent: 16,
    );
  }
}
