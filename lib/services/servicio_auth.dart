import 'package:zapcontrol/data/usuarios.dart';
import 'package:zapcontrol/models/usuarios.dart';

class ServicioAuth {
  static Usuarios? usuarioActual; 

  Usuarios? iniciarSesion(String identificador, String password) {

    final id = identificador.trim().toLowerCase();

    for (final u in usuariosData) {
      final coincideId =
          u.usuario.toLowerCase() == id || u.correo.toLowerCase() == id;

      if (coincideId && u.password == password) {
        usuarioActual = u;
        return u;
      }
    }
    return null;
  }

  void cerrarSesion() {
    usuarioActual = null;
  }
}
