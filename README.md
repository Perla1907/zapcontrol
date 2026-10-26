# 👟 ZapControl

## 1. Descripción breve
ZapControl es una aplicación móvil diseñada específicamente para modernizar y optimizar 
la gestión interna de las pequeñas y medianas zapaterías 
Funciones Principales:
Control de Inventario: Permite registrar, buscar y organizar el calzado detallando modelo, talla y color,
emitiendo alertas automáticas de stock bajo.
Escaneo con Cámara: Utiliza la cámara del teléfono celular para leer códigos de barras y códigos QR,
facilitando la consulta rápida dce productos y existencias.
Gestión de Ventas: Agiliza el proceso de venta en tienda física y genera tickets digitales en tiempo real.

 
## 2. Los 3 tipos de usuario y sus dashboards

Cuenta con tres usuarios:
1. Administrador: Tinene acceso a todo el sistema
2. Gerente: No puede agregar usuarios ni categorías solo puede agregar productos 
3. Empleado: No puede agregar productos ni usuarios, solo puede hacer ventas

<br><br>

<table>
  <thead>
    <tr>
      <th align="center">Administrador</th>
      <th align="center">Gerente</th>
      <th>Empleado</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Acceso a todas las funciones</td>
      <td>Puede agregar productos</td>
      <td>No puede agregar productos</td>
    </tr>
    <tr>
      <td><img width="357" height="796" alt="image" src="https://github.com/user-attachments/assets/b303f4c3-4262-4214-8684-69713208f0ab" /></td>
      <td><img width="357" height="797" alt="image" src="https://github.com/user-attachments/assets/d9860d89-84f6-4977-a3ca-d608a261a7f1" /></td>
      <td><img width="357" height="800" alt="image" src="https://github.com/user-attachments/assets/01a35ee0-66f1-4ee4-ba13-9502d5cb2c74" /></td>
    </tr>
  </tbody>
</table>
  

## 3. Manejo de estado elegido (y por qué)
Para el desarrollo de *ZapControl* en Flutter, se utilizó una estrategia de manejo de estado híbrida: *Provider* (gestión global) y *setState* (gestión local).

#### ¿Por qué se eligió?
* *Sincronización en tiempo real:* Al registrar una venta, *Provider* actualiza al instante el stock del inventario y las métricas en los tableros del Administrador y Gerente sin necesidad de recargar la app.
* *Código limpio y mantenible:* Ofrece una arquitectura ligera y fácil de escalar sin añadir complejidad innecesaria al proyecto.
* *Optimización de recursos:* Se combina con setState para la lógica local e interacciones sencillas de una sola pantalla (validación de campos, filtros de busqueda), garantizando un rendimiento fluido en dispositivos móviles.


## 4. Cómo ejecutar la app
Para ejecutarlo se conecta el dispositivo móvil a la computadora mediante un cable USB.
Para la configuracion del telefono se activa el modo depuracion USB desntro de las opciones de desarrollador del telefono
para permitir la instalación de aplicaciones en prueba.
Dentro del entorno de desarrollo de visual studio code se selecciona el telefono detectado como dispositivo destino y se ejecuta.
La aplicacion se instala automaticamente en el telefono y queda lista para ser usada por el usuario.

## 6. Screenshots

### 1. Splashscreen 
<table>
  <thead>
    <tr>
      <th align="center">Pantalla de carga inicial visible</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img width="356" height="792" alt="image" src="https://github.com/user-attachments/assets/3945bb90-bf2d-4836-8d1f-bcc16072fc0f" /></td>
    </tr>
  </tbody>
</table>
<br><br>

### 2. Autenticación 

<table>
  <thead>
    <tr>
      <th align="center">Login</th>
      <th align="center">Login validación</th>
      <th align="center">Registro</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img width="362" height="795" alt="image" src="https://github.com/user-attachments/assets/3ba1f559-6fa6-44a8-b980-6ee4da750df9" /></td>
      <td><img width="358" height="792" alt="image" src="https://github.com/user-attachments/assets/9fc89bea-4552-4028-95db-c211b48dedc7" /></td>
      <td><img width="357" height="796" alt="image" src="https://github.com/user-attachments/assets/028869e4-a2b1-4211-8452-903b01567850" /></td>
    </tr>
  </tbody>
</table>
<br><br>

### 3. Dashboards

<table>
  <thead>
    <tr>
      <th align="center">Administrador</th>
      <th align="center">Gerente</th>
      <th>Empleado</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>Acceso a todas las funciones</td>
      <td>Puede agregar productos</td>
      <td>No puede agregar productos</td>
    </tr>
    <tr>
      <td><img width="357" height="796" alt="image" src="https://github.com/user-attachments/assets/b303f4c3-4262-4214-8684-69713208f0ab" /></td>
      <td><img width="357" height="797" alt="image" src="https://github.com/user-attachments/assets/d9860d89-84f6-4977-a3ca-d608a261a7f1" /></td>
      <td><img width="357" height="800" alt="image" src="https://github.com/user-attachments/assets/01a35ee0-66f1-4ee4-ba13-9502d5cb2c74" /></td>
    </tr>
  </tbody>
</table>
<br><br>

### 4. Listas

<table>
  <thead>
    <tr>
      <th align="center">Productos</th>
      <th align="center">Detalle Producto con stock</th>
      <th align="center">Detalle Producto sin stock</th>
      <th align="center">Lista de Empleados</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img width="357" height="797" alt="image" src="https://github.com/user-attachments/assets/7505bb7f-4f47-4baa-b1e6-62eda71e8e18" /></td>
      <td><img width="356" height="795" alt="image" src="https://github.com/user-attachments/assets/991cb1de-7f9b-422a-807d-bb37d81b218e" /></td>
      <td><img width="357" height="800" alt="image" src="https://github.com/user-attachments/assets/27176a40-96b5-47d1-b162-5048ef8ee3f8" /></td>
      <td><img width="361" height="798" alt="image" src="https://github.com/user-attachments/assets/f6edd350-ae20-40f3-91b4-f1ff9c52ce64" /></td>
    </tr>
  </tbody>
</table>
<br><br>

### 5. Formularios específicos del dominio

<table>
  <thead>
    <tr>
      <th align="center">Agregar Producto</th>
      <th align="center">Agregar Categoria</th>
      <th align="center">Agregar Usuario</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img width="357" height="677" alt="image" src="https://github.com/user-attachments/assets/8d37560a-0454-4954-b090-007e961ce99c" />
      </td>
      <td><img width="357" height="798" alt="image" src="https://github.com/user-attachments/assets/0b19b90f-d3a2-4a42-96ad-4c97712a1cae" /></td>
      <td><img width="357" height="796" alt="image" src="https://github.com/user-attachments/assets/ebb1af1c-3654-4149-8a3d-dd3108c2cd5d" /></td>
    </tr>
  </tbody>
</table>
<br><br>

### 6. Usuario Activo

<table>
  <thead>
   <tr>
      <th align="center">Usuario</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>
        <img width="362" height="793" alt="image" src="https://github.com/user-attachments/assets/c9b61420-8558-4923-958a-260b27a975e3" />
      </td>
    </tr>
  </tbody>
</table>
<br><br>

### Navegación para realizar una venta
<table>
  <thead>
    <tr>
      <th align="center">Elegir el producto</th>
      <th align="center">Agregar a una venta</th>
      <th align="center">Click en el carrito</th>
      <th align="center">Procesar venta</th>
      <th align="center">Confirmación de venta</th>
      <th align="center">Ver ticket</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td><img width="357" height="796" alt="image" src="https://github.com/user-attachments/assets/0ae7258b-82a3-490b-b364-a17cf47a9ea0" /</td>
      <td><img width="361" height="797" alt="image" src="https://github.com/user-attachments/assets/d4d5ae42-d35e-4315-a3f6-2b684fda925f" /></td>
      <td><img width="357" height="797" alt="image" src="https://github.com/user-attachments/assets/6d07a14a-0360-4884-a0a0-f098f536b4fe" /></td>
      <td><img width="357" height="797" alt="image" src="https://github.com/user-attachments/assets/e1787832-03ed-4fc9-aeeb-8e27201173f3" /></td>
      <td><img width="358" height="796" alt="image" src="https://github.com/user-attachments/assets/2a5a8311-8999-4a91-88f8-fba1c7d03e7d" /></td>
      <td><img width="357" height="798" alt="image" src="https://github.com/user-attachments/assets/648dc92d-cea2-4cb2-85cf-828cdc50e456" /></td>
    </tr>
  </tbody>
</table>
<br><br>




## Preguntas

### 1. ¿Qué propiedad del widget `Scaffold` se utiliza comúnmente para colocar una barra de navegación superior que contiene un título y botones de acción?

La propiedad **`appBar`**.

---

### 2. ¿Cuál es el propósito principal de la propiedad `elevation` en el widget `Card` de Flutter?

Permite **controlar la sombra y la profundidad visual** del `Card`.

---

### 3. ¿Qué widget utilizarías para recortar de forma limpia los bordes de una imagen rectangular (`Image.asset`) de manera que adquiera esquinas redondeadas exactas?

El widget **`ClipRRect`**.

---

### 4. Si deseas utilizar imágenes locales (`Image.asset`) en tu interfaz, ¿qué paso previo y obligatorio debes realizar en la estructura del proyecto para que la imagen se cargue sin errores?

Se debe **declarar la carpeta de imágenes o assets en el archivo `pubspec.yaml`**.

Ejemplo:

```yaml
flutter:
  assets:
    - assets/images/
```

---

### 5. ¿Cómo puedes modificar de manera directa el tamaño y el color de un widget `Icon`?

Utilizando las propiedades **`size`** y **`color`**.

Ejemplo:

```dart
Icon(
  Icons.home,
  size: 30,
  color: Colors.blue,
)
```

---

### 6. ¿Cuál es la diferencia clave entre usar `InkWell` y `GestureDetector` para gestionar toques en Flutter?

- **`InkWell`** incluye un efecto visual de onda (*ripple*) al tocar el elemento.
- **`GestureDetector`** no proporciona efectos visuales por sí mismo y permite detectar una gama más amplia de gestos, como arrastrar, pellizcar o mantener presionado.

---

### 7. En un widget `Row`, ¿qué propiedad se encarga específicamente de alinear y distribuir los widgets hijos a lo largo de su eje principal (el eje horizontal)?

La propiedad **`mainAxisAlignment`**.

---

### 8. Si dentro de un `Row` añades textos muy largos que provocan un error de desbordamiento gráfico horizontal (`RenderFlex overflow`), ¿qué widget puedes utilizar para obligar al texto a ajustarse y ocupar únicamente el espacio libre restante?

El widget **`Expanded`**.

Ejemplo:

```dart
Row(
  children: [
    const Icon(Icons.info),
    Expanded(
      child: Text(
        'Este es un texto muy largo que debe ajustarse al espacio disponible.',
      ),
    ),
  ],
)
```

---

### 9. ¿Cuál es la forma más común y directa de enviar datos al navegar hacia una nueva pantalla utilizando `Navigator`?

Pasar los datos **como parámetros al constructor de la nueva pantalla** dentro de `MaterialPageRoute`.

Ejemplo:

```dart
Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => DetalleProducto(
      producto: producto,
    ),
  ),
);
```

---

### 10. ¿Cómo se puede obtener de forma asíncrona el valor o resultado que una segunda pantalla devuelve al cerrarse mediante `Navigator.pop(context, resultado)`?

Utilizando **`async` y `await`** al realizar la navegación. El resultado de `Navigator.push` se guarda en una variable.

Ejemplo:

```dart
final resultado = await Navigator.push(
  context,
  MaterialPageRoute(
    builder: (context) => const SegundaPantalla(),
  ),
);
```

Desde la segunda pantalla se puede devolver el resultado de la siguiente manera:

```dart
Navigator.pop(context, resultado);
```

De esta forma, la primera pantalla puede recibir y utilizar el valor devuelto.
