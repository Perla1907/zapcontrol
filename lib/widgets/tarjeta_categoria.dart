
import 'package:flutter/material.dart';
import 'package:zapcontrol/models/categorias.dart';

class TarjetaCategoria extends StatelessWidget {
  final Categoria categoria;
  final VoidCallback cambiarEstado;

  const TarjetaCategoria({
    super.key,
    required this.categoria,
    required this.cambiarEstado,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
            color: categoria.color.withOpacity(0.12),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              categoria.iniciales,
              style: TextStyle(
                color: categoria.color,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                categoria.nombre,
                style: const TextStyle(
                  color: Color(0xFF243247),
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                categoria.descripcion,
                style: const TextStyle(
                  color: Color(0xFF7A8699),
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
        Switch(
          value: categoria.activa,
          activeThumbColor: Colors.white,
          activeTrackColor: const Color(0xFF3478E5),
          inactiveThumbColor: Colors.white,
          inactiveTrackColor: const Color(0xFFD5DCE6),
          onChanged: (valor) {
            cambiarEstado();
          },
        ),
      ],
    );
  }
}

class MenuInferior extends StatelessWidget {
  final int seleccionado;
  final Function(int) cambiarPagina;

  const MenuInferior({
    super.key,
    required this.seleccionado,
    required this.cambiarPagina,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        border: Border(
          top: BorderSide(
            color: Color(0xFFE8ECF2),
            width: 1,
          ),
        ),
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.white,
        elevation: 0,
        selectedItemColor: const Color(0xFF3478E5),
        unselectedItemColor: const Color(0xFF8A94A6),
        selectedLabelStyle: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 11,
        ),
        type: BottomNavigationBarType.fixed,
        currentIndex: seleccionado,
        onTap: cambiarPagina,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inventory_2_outlined),
            activeIcon: Icon(Icons.inventory_2),
            label: 'Productos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            activeIcon: Icon(Icons.shopping_cart),
            label: 'Ventas',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart_outlined),
            activeIcon: Icon(Icons.bar_chart),
            label: 'Reportes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            activeIcon: Icon(Icons.settings),
            label: 'Más',
          ),
        ],
      ),
    );
  }
}
