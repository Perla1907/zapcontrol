import 'package:flutter/material.dart';
import 'package:zapcontrol/models/usuarios.dart';
import 'package:zapcontrol/screens/pantalla_de_inicio.dart';
import 'package:zapcontrol/screens/pantalla_mas_opciones.dart';
import 'package:zapcontrol/screens/productos_screen.dart';
import 'package:zapcontrol/screens/venta_screen.dart';
import 'package:zapcontrol/services/servicio_auth.dart';

class PantallaPrincipalZap extends StatefulWidget {

  const PantallaPrincipalZap({
    super.key,
  });

  @override
  State<PantallaPrincipalZap> createState() => _PantallaPrincipalZapState();
}

class _PantallaPrincipalZapState extends State<PantallaPrincipalZap> {
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

    return Scaffold(
      
      body: IndexedStack(index: _indiceActual, children: _paguinas),


      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, 
        currentIndex: _indiceActual,
        selectedItemColor: const Color(0xFF2D6FE0), 
        unselectedItemColor: Colors.grey, 
        onTap: (indice) {
          
          setState(() {
            _indiceActual = indice; 
          });
        },
        items: [
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
            icon: Icon(Icons.shopping_cart),
            activeIcon: Icon(Icons.shopping_cart_outlined),
            label: 'Ventas',
          ),
          if(esAdministrador) 
            BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'Más')
        ],
      ),
    );
  }
}
