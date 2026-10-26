import 'package:flutter/material.dart';

const _l = ['0001101', '0011001', '0010011', '0111101', '0100011', '0110001', '0101111', '0111011', '0110111', '0001011'];
const _g = ['0100111', '0110011', '0011011', '0100001', '0011101', '0111001', '0000101', '0010001', '0001001', '0010111'];
const _r = ['1110010', '1100110', '1101100', '1000010', '1011100', '1001110', '1010000', '1000100', '1001000', '1110100'];
const _paridad = ['LLLLLL', 'LLGLGG', 'LLGGLG', 'LLGGGL', 'LGLLGG', 'LGGLLG', 'LGGGLL', 'LGLGLG', 'LGLGGL', 'LGGLGL'];

/// Recibe 12 dígitos y devuelve el EAN-13 completo (con dígito verificador).
String generarEan13(String doce) {
  var suma = 0;
  for (int i = 0; i < 12; i++) {
    final d = int.parse(doce[i]);
    suma += i.isEven ? d : d * 3;
  }
  return '$doce${(10 - suma % 10) % 10}';
}

String _bits(String ean) {
  final d = ean.split('').map(int.parse).toList();
  final p = _paridad[d[0]];
  final sb = StringBuffer('101');
  for (int i = 0; i < 6; i++) {
    sb.write(p[i] == 'L' ? _l[d[i + 1]] : _g[d[i + 1]]);
  }
  sb.write('01010');
  for (int i = 7; i < 13; i++) {
    sb.write(_r[d[i]]);
  }
  sb.write('101');
  return sb.toString();
}

class CodigoBarras extends StatelessWidget {
  final String ean13;
  final double alto;

  const CodigoBarras({super.key, required this.ean13, this.alto = 70});

  @override
  Widget build(BuildContext context) => CustomPaint(
        size: Size(double.infinity, alto),
        painter: _PintorBarras(_bits(ean13)),
      );
}

class _PintorBarras extends CustomPainter {
  final String bits;

  _PintorBarras(this.bits);

  @override
  void paint(Canvas canvas, Size size) {
    final ancho = size.width / bits.length;
    final pincel = Paint()..color = Colors.black;
    for (int i = 0; i < bits.length; i++) {
      if (bits[i] == '1') {
        canvas.drawRect(
          Rect.fromLTWH(i * ancho, 0, ancho + 0.5, size.height),
          pincel,
        );
      }
    }
  }

  @override
  bool shouldRepaint(_PintorBarras viejo) => viejo.bits != bits;
}