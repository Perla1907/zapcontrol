
import 'package:zapcontrol/models/producto.dart';
import 'package:zapcontrol/models/producto_color.dart';
import 'package:zapcontrol/models/producto_talla.dart';

List<Producto> productos = [
  Producto(
    idProducto: 1,
    marca: 'Nike',
    modelo: 'Dunk',
    sku: 'NIK-001',
    precio: 1899,
    categoria: 'Casual',
    colores: [
      ProductoColor(
        color: 'Azul',
        imagen: 'nikeAzul.png',
        tallas: [
          ProductoTalla(talla: '25', stock: 0, codigoBarras: 'NIK-001-AZ-25'),
          ProductoTalla(talla: '26', stock: 10, codigoBarras: 'NIK-001-AZ-26'),
          ProductoTalla(talla: '27', stock: 15, codigoBarras: 'NIK-001-AZ-27'),
        ],
      ),
      ProductoColor(
        color: 'Verde',
        imagen: 'nikeVerde.png',
        tallas: [
          ProductoTalla(talla: '25', stock: 8, codigoBarras: 'NIK-001-VD-25'),
          ProductoTalla(talla: '26', stock: 7, codigoBarras: 'NIK-001-VD-26'),
        ],
      ),
      ProductoColor(
        color: 'Negro',
        imagen: 'nikeNegro.png',
        tallas: [
          ProductoTalla(talla: '26', stock: 8, codigoBarras: 'NIK-001-NG-26'),
          ProductoTalla(talla: '27', stock: 12, codigoBarras: 'NIK-001-NG-27'),
        ],
      ),
      ProductoColor(
        color: 'Café',
        imagen: 'nikeCafe.png',
        tallas: [
          ProductoTalla(talla: '25', stock: 6, codigoBarras: 'NIK-001-CF-25'),
          ProductoTalla(talla: '26', stock: 9, codigoBarras: 'NIK-001-CF-26'),
        ],
      ),
    ],
  ),

  Producto(
    idProducto: 2,
    marca: 'Pirma',
    modelo: 'RS-X',
    sku: 'PIR-002',
    precio: 1599,
    categoria: 'Deportivo',
    colores: [
      ProductoColor(
        color: 'Gris',
        imagen: 'pirma.png',
        tallas: [
          ProductoTalla(talla: '24', stock: 4, codigoBarras: 'PIR-002-GR-24'),
          ProductoTalla(talla: '25', stock: 7, codigoBarras: 'PIR-002-GR-25'),
        ],
      ),
    ],
  ),

  Producto(
    idProducto: 3,
    marca: 'Adidas',
    modelo: 'SuperStar',
    sku: 'ADD-003',
    precio: 1299,
    categoria: 'Deportivo',
    colores: [
      ProductoColor(
        color: 'Negro',
        imagen: 'adidas.png',
        tallas: [
          ProductoTalla(talla: '25', stock: 6, codigoBarras: 'ADD-003-NG-25'),
          ProductoTalla(talla: '26', stock: 5, codigoBarras: 'ADD-003-NG-26'),
        ],
      ),
    ],
  ),
];
