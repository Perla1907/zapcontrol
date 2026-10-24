import 'package:flutter/material.dart';
import 'package:zapcontrol/models/venta_registrada.dart';
import 'package:zapcontrol/screens/ticket_venta.dart';

class PantallaVentaRegistrada extends StatelessWidget {
  const PantallaVentaRegistrada({super.key});

  @override
  Widget build(BuildContext context) {
    const venta = VentaRegistrada(
      mensaje: '¡Venta registrada exitosamente!',
      folio: 'V-00125',
    );

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: Color(0xFFE3F4EA),
              child: Icon(
                Icons.check,
                color: Color(0xFF2E9E5B),
                size: 38,
              ),
            ),
            const SizedBox(height: 24),
            Text(
              venta.mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Color(0xFF111827),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              'Folio: ${venta.folio}',
              style: const TextStyle(
                fontSize: 14,
                color: Color(0xFF5B6577),
              ),
            ),
            const SizedBox(height: 28),
            
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TicketVenta(),
                    ),
                  );
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFF2F5FE3),
                  foregroundColor: Colors.white,
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'Ver ticket',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            
            const SizedBox(height: 14),
            
            SizedBox(
              width: double.infinity,
              height: 52,
              child: OutlinedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: const Color(0xFFEEF1F6),
                  foregroundColor: const Color(0xFF111827),
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.arrow_back_ios_new, size: 18),
                    SizedBox(width: 8),
                    Text(
                      'Nueva venta',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}