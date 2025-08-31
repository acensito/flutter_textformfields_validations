import 'package:flutter/material.dart';

/// ========================
/// VALIDADORES GENERALES
/// ========================

/// Campo obligatorio
FormFieldValidator<String> requiredValidator([String message = 'Campo requerido']) {
  return (value) => (value == null || value.trim().isEmpty) ? message : null;
}

/// Email válido
FormFieldValidator<String> emailValidator([String message = 'Email no válido']) {
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return emailRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// Número entero válido
FormFieldValidator<String> numberValidator([String message = 'Debe ser un número válido']) {
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return int.tryParse(value.trim()) != null ? null : message;
  };
}

/// Longitud mínima
FormFieldValidator<String> minLengthValidator(int minLength, [String? message]) {
  return (value) {
    if (value == null || value.trim().isEmpty) {
      return message ?? 'Mínimo $minLength caracteres';
    }
    return value.trim().length < minLength ? (message ?? 'Mínimo $minLength caracteres') : null;
  };
}

/// Coincidencia entre dos campos (ej: contraseñas)
FormFieldValidator<String> matchValidator(
  TextEditingController controller, [
  String message = 'Los valores no coinciden',
]) {
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return value.trim() == controller.text.trim() ? null : message;
  };
}

/// ========================
/// VALIDADORES ESPAÑA
/// ========================

/// Teléfono español (9 dígitos, empieza en 6, 7 o 9)
FormFieldValidator<String> phoneValidator([String message = 'Teléfono no válido']) {
  final phoneRegex = RegExp(r'^[679]\d{8}$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return phoneRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// DNI español (8 números + letra)
FormFieldValidator<String> dniValidator([String message = 'DNI no válido']) {
  final dniRegex = RegExp(r'^\d{8}[A-Za-z]$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return dniRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// NIE español (empieza por X, Y o Z + 7 dígitos + letra)
FormFieldValidator<String> nieValidator([String message = 'NIE no válido']) {
  final nieRegex = RegExp(r'^[XYZ]\d{7}[A-Za-z]$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return nieRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// CIF español (Letra inicial + 7 números + letra/dígito)
FormFieldValidator<String> cifValidator([String message = 'CIF no válido']) {
  final cifRegex = RegExp(r'^[ABCDEFGHJKLMNPQRSUVW]\d{7}[0-9A-J]$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return cifRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// Código Postal español (5 dígitos válidos, 01xxx - 52xxx)
FormFieldValidator<String> postalCodeValidator([String message = 'Código postal no válido']) {
  final postalRegex = RegExp(r'^(0[1-9]|[1-4][0-9]|5[0-2])\d{3}$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return postalRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// IBAN España (24 caracteres, empieza por ES y 22 dígitos)
FormFieldValidator<String> ibanEsValidator([String message = 'IBAN no válido']) {
  final ibanRegex = RegExp(r'^ES\d{22}$');
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return ibanRegex.hasMatch(value.trim()) ? null : message;
  };
}

/// Contraseña segura (8+ caracteres, mayúscula, minúscula, número, símbolo)
FormFieldValidator<String> strongPasswordValidator([String message = 'Contraseña no segura']) {
  final strongPassRegex = RegExp(
    r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[!@#\$&*~]).{8,}$',
  );
  return (value) {
    if (value == null || value.trim().isEmpty) return message;
    return strongPassRegex.hasMatch(value.trim()) ? null : message;
  };
}
