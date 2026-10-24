import 'package:flutter/material.dart';
import 'package:zapcontrol/data/usuarios.dart';
import 'package:zapcontrol/models/usuarios.dart';
import 'package:zapcontrol/screens/pantalla_nuevo_usuario.dart';
import 'package:zapcontrol/widgets/tarjeta_lista_usuario.dart';


class PantallaListaUsuario extends StatefulWidget {
  const PantallaListaUsuario({super.key});

  @override
  State<PantallaListaUsuario> createState() => _PantallaListaUsuarioState();
}

class _PantallaListaUsuarioState extends State<PantallaListaUsuario> {
  int _filtroSeleccionado = 0;

  final Map<String, bool> _estadoUsuario = {};
  final TextEditingController _searchController = TextEditingController();
  String _textoBusqueda = '';

  late List<Usuarios> _listaUsuarios;

  @override
  void initState() {
    super.initState();
    _listaUsuarios = List.from(usuariosData);
    _searchController.addListener(() {
      setState(() {
        _textoBusqueda = _searchController.text.toLowerCase();
      });
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<Usuarios> usuariosFiltrados = _listaUsuarios.where((usuario) {
      bool coincideBusqueda =
          usuario.nombre.toLowerCase().contains(_textoBusqueda) ||
          usuario.usuario.toLowerCase().contains(_textoBusqueda) ||
          usuario.correo.toLowerCase().contains(_textoBusqueda);
      bool coincideFiltro = true;

      final activo = _estadoUsuario.putIfAbsent(usuario.correo, () => true);

      if (_filtroSeleccionado == 1) {
        coincideFiltro = activo; // Activos
      } else if (_filtroSeleccionado == 2) {
        coincideFiltro = !activo; // Inactivos
      }
      return coincideBusqueda && coincideFiltro;
    }).toList();

    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Empleados',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
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
          ),
          IconButton(
            icon: const Icon(Icons.add, color: Colors.black),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PantallaNuevoUsuario()),
              );
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Barra de búsqueda estilizada
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Buscar por nombre o usuario...',
                hintStyle: const TextStyle(
                  color: Color(0xFF8290A5),
                  fontSize: 14,
                ),
                prefixIcon: const Icon(Icons.search, color: Color(0xFF8290A5)),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFFDCE5F2)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: const BorderSide(color: Color(0xFFDCE5F2)),
                ),
              ),
            ),
            const SizedBox(height: 16),


            Row(
              children: [
                _buildFiltroBoton('Todos', 0),
                const SizedBox(width: 8),
                _buildFiltroBoton('Activos', 1),
                const SizedBox(width: 8),
                _buildFiltroBoton('Inactivos', 2),
              ],
            ),
            const SizedBox(height: 16),

            Text(
              '${usuariosFiltrados.length} usuarios',
              style: const TextStyle(
                color: Color(0xFF60718A),
                fontWeight: FontWeight.bold,
                fontSize: 13,
              ),
            ),
            const SizedBox(height: 12),


            Expanded(
              child: ListView.builder(
                itemCount: usuariosFiltrados.length,
                itemBuilder: (context, index) {
                  final usuario = usuariosFiltrados[index];

                  return TarjetaListaUsuario(
                    nombre: usuario.nombre,
                    usuario: usuario.usuario,
                    correo: usuario.correo,
                    rol: usuario.rol,
                    activo: _estadoUsuario.putIfAbsent(
                      usuario.correo,
                      () => true,
                    ),
                    ventasRegistradas: usuario.ventasRegistradas ?? 0,
                    onEstadoChanged: (valor) {
                      setState(() {
                        _estadoUsuario[usuario.correo] = valor;
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFiltroBoton(String texto, int index) {
    final seleccionado = _filtroSeleccionado == index;
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _filtroSeleccionado = index;
          });
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: seleccionado ? Colors.white : const Color(0xFFEDF2F8),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: seleccionado
                  ? const Color(0xFF2875FF)
                  : Colors.transparent,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            texto,
            style: TextStyle(
              color: seleccionado
                  ? const Color(0xFF2875FF)
                  : const Color(0xFF60718A),
              fontWeight: FontWeight.bold,
              fontSize: 13,
            ),
          ),
        ),
      ),
    );
  }
}
