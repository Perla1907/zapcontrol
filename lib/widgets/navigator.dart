import 'package:flutter/material.dart';
import 'package:zapcontrol/screens/pantalla_de_inicio.dart';
import 'package:zapcontrol/screens/pantalla_mas_opciones.dart';
import 'package:zapcontrol/screens/productos_screen.dart';
import 'package:zapcontrol/screens/venta_screen.dart';
import 'package:zapcontrol/services/servicio_auth.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {

  int _indiceActual = 0;
  final bool esAdministrador = ServicioAuth.usuarioActual?.rol == "Administrador";
  
  @override
  Widget build(BuildContext context) {

    final List<Widget> _paguinas = [
      const PantallaInicio(),
      ProductosScreen(),
      const VentaScreen(),
      if(esAdministrador) const PantallaMasOpciones(),
    ];
    
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          _indiceActual = index;
        });
      },

      indicatorColor: Colors.blue.shade100,
      selectedIndex: _indiceActual,

      destinations: [
        const NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),

        const NavigationDestination(
          selectedIcon: Icon(Icons.inventory_2),
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Productos',
        ),

        const NavigationDestination(
          selectedIcon: Icon(Icons.shopping_cart),
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Ventas',
        ),

        if(esAdministrador) 
          const NavigationDestination(
          selectedIcon: Icon(Icons.more_horiz),
          icon: Icon(Icons.more_horiz),
          label: 'Más',
        ),
      ],
    );
  }
}