class Usuarios {
  final String usuario;
  final String correo;
  final String password;
  final String nombre;
  final String rol;
  final bool activo;
  final int? ventasRegistradas;

  const Usuarios({
    required this.usuario,
    required this.correo,
    required this.password,
    required this.nombre,
    required this.rol,
    required this.activo,
    this.ventasRegistradas,
  });
}
