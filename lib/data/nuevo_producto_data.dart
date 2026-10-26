import 'package:flutter/material.dart';
import 'package:zapcontrol/models/nuevo_producto.dart';

const List<String> marcas = [
  'Nike',
  'Adidas',
  'Puma',
  'Reebok',
  'New Balance',
];

const List<String> tallas = [
  '22',
  '23',
  '24',
  '25',
  '26',
  '27',
  '28',
  '29',
  '30',
];

const List<OpcionColor> colores = [
  OpcionColor('Blanco', Color(0xFFFFFFFF)),
  OpcionColor('Negro', Color(0xFF111111)),
  OpcionColor('Gris', Color(0xFF8A94A6)),
  OpcionColor('Azul', Color(0xFF2F5FE3)),
  OpcionColor('Rojo', Color(0xFFE53935)),
  OpcionColor('Café', Color(0xFF7B5333)),
  OpcionColor('Verde', Color(0xFF2E9E5B)),
  OpcionColor('Beige', Color(0xFFD9C3A0)),
];

const List<String> ubicaciones = [
  'Estante A1',
  'Estante A2',
  'Estante A3',
  'Estante B1',
  'Bodega',
];

const List<String> categorias = [
  'Deportivo',
  'Casual',
  'Botin',
  'Sandalias',
  'Outdoor',
];

/// Consecutivo para generar SKU y código de barras (sustituir por backend).
int _consecutivo = 5;

int siguienteConsecutivo() => ++_consecutivo;
