import 'package:flutter/material.dart';

class CustomNavigationBar extends StatefulWidget {
  const CustomNavigationBar({super.key});
  @override
  State<CustomNavigationBar> createState() => _CustomNavigationBarState();
}

class _CustomNavigationBarState extends State<CustomNavigationBar> {
  int currentPageIndex = 1;
  
  @override
  Widget build(BuildContext context) {
    return NavigationBar(
      onDestinationSelected: (int index) {
        setState(() {
          currentPageIndex = index;
        });
      },

      indicatorColor: Colors.blue.shade100,
      selectedIndex: currentPageIndex,

      destinations: const [
        NavigationDestination(
          selectedIcon: Icon(Icons.home),
          icon: Icon(Icons.home_outlined),
          label: 'Inicio',
        ),

        NavigationDestination(
          selectedIcon: Icon(Icons.inventory_2),
          icon: Icon(Icons.inventory_2_outlined),
          label: 'Productos',
        ),

        NavigationDestination(
          selectedIcon: Icon(Icons.shopping_cart),
          icon: Icon(Icons.shopping_cart_outlined),
          label: 'Ventas',
        ),

        NavigationDestination(
          selectedIcon: Icon(Icons.warehouse),
          icon: Icon(Icons.warehouse_outlined),
          label: 'Inventario',
        ),

        NavigationDestination(
          selectedIcon: Icon(Icons.more_horiz),
          icon: Icon(Icons.more_horiz),
          label: 'Más',
        ),
      ],
    );
  }
}