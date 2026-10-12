import 'package:zapcontrol/models/producto.dart';

List<Producto> productos = [

    Producto(
      idProducto: 1,
      marca: 'Adidas',
      modelo: 'Tennis Deportivo',
      imagen: 'adidas.png',
      sku: 'ADD-001',
      talla: '27',
      color: 'Blanco/Negro',
      precio: 1299.00,
      stock: 25,
      ubicacion: 'Estante A1',
      categoria: 'Deportivo',
      tallas: [
        {'talla': '25', 'stock': 5},
        {'talla': '26', 'stock': 10},
        {'talla': '27', 'stock': 15},
      ],
    ),
    
    Producto(
      idProducto: 2,
      marca: 'Nike',
      modelo: 'Sneaker Casual',
      imagen: 'nike.png',
      sku: 'NIK-002',
      talla: '26',
      color: 'Negro',
      precio: 1499.00,
      stock: 18,
      ubicacion: 'Estante B2',
      categoria: 'Casual',
      tallas: [
        {'talla': '22', 'stock': 2},
        {'talla': '23', 'stock': 1},
        {'talla': '24', 'stock': 8},
      ],
    ),

    Producto(
      idProducto: 3,
      marca: 'Pirma',
      modelo: 'Tenis Escolar',
      imagen: 'pirma.png',
      sku: 'PIR-003',
      talla: '25',
      color: 'Blanco',
      precio: 999.00,
      stock: 32,
      ubicacion: 'Estante C1',
      categoria: 'Escolar',
      tallas: [
        {'talla': '24', 'stock': 8},
        {'talla': '25', 'stock': 6},
        {'talla': '26', 'stock': 2},
      ],
    ),
  ];