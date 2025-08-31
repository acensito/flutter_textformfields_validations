# 📑 Validadores Reutilizables en Flutter (España)

Este proyecto incluye una librería de validadores comunes para formularios en Flutter, adaptados principalmente a **España** (DNI, Teléfono, etc.).

<img src="https://i.ibb.co/DDy448cF/Screenshot-1756644159.png" alt="Screenshot-1756644159">
<img src="https://i.ibb.co/27nn577t/Screenshot-1756644367.png" alt="Screenshot-1756644367">

---

## ✅ Validadores disponibles

### Generales
- `requiredValidator` → Campo obligatorio.  
- `emailValidator` → Email válido.  
- `numberValidator` → Número entero válido.  
- `minLengthValidator` → Mínima longitud de caracteres.  
- `matchValidator` → Coincidencia de dos campos.  
- `strongPasswordValidator` → Contraseña fuerte (8+, mayúscula, minúscula, número, símbolo).  

### España
- `phoneValidator` → Teléfono español válido (9 dígitos, empieza en 6, 7 o 9).  
- `dniValidator` → DNI español válido (8 dígitos + letra).  
- `nieValidator` → NIE español válido (X/Y/Z + 7 dígitos + letra).  
- `cifValidator` → CIF válido (Letra + 7 dígitos + letra/dígito).  
- `postalCodeValidator` → Código Postal válido (01xxx–52xxx).  
- `ibanEsValidator` → IBAN España válido (24 caracteres, `ES` + 22 dígitos).  

## 📂 Archivos del proyecto

- `lib/utils/textformfields_validations.dart` → Contiene la librería con todos los validadores.  
- `lib/screens/main.dart` → Ejemplo de uso en un formulario de registro.  

---

## 🛠 Cómo usarlo

1. Importa los validadores en tu archivo:

   ```dart
   import 'utils/textformfields_validations.dart';
   ```

2. Usa los validadores en tus `TextFormField`:

   ```dart
   TextFormField(
     decoration: InputDecoration(labelText: 'Email'),
     validator: emailValidator(), // Usando el validador de email con mensaje por defecto
   )

   TextFormField(
     decoration: InputDecoration(labelText: 'Email'),
     validator: emailValidator('El correo electronico no es correcto'), // Personalizando el mensaje de error
   )

   ```

3. Asegúrate de manejar la validación en tu formulario:

   ```dart
    final _formKey = GlobalKey<FormState>();

    if (_formKey.currentState!.validate()) {
        print("Formulario válido");
    } else {
        print("Corrige los errores");
    }
   ```
