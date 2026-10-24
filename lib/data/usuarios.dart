import 'package:zapcontrol/models/usuarios.dart';

const List<Usuarios> usuariosData = [
  Usuarios(
    usuario: 'Admin Perla',
    correo: '1225100343.pjmm@gmail.com',
    password: 'perlitaCrabs',
    nombre: 'Perla Joceline Martinez Meza',
    rol: 'Administrador',
    activo: true,
    ventasRegistradas: 12,
  ),

  Usuarios(
    usuario: 'Empleado David',
    correo: '1225100340.dimb@gmail.com',
    password: 'Dimb19082006',
    nombre: 'David Isaac Mata Buenrostro',
    rol: 'Empleado',
    activo: true,
    ventasRegistradas: 0,
  ),

  Usuarios(
    usuario: 'admin',
    correo: '123456@gmail.com',
    password: '1234',
    nombre: 'admin',
    rol: 'admin',
    activo: true,
    ventasRegistradas: 4,
  ),
];
