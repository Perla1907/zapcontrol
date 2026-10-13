# 👟 ZapControl

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
