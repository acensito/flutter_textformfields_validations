// register_screen_extended.dart
import 'package:flutter/material.dart';
import '../utils/textformfields_validations.dart';

class TextFormFieldsValidation extends StatefulWidget {
  const TextFormFieldsValidation({super.key});

  @override
  State<TextFormFieldsValidation> createState() => _TextFormFieldsValidationState();
}

class _TextFormFieldsValidationState extends State<TextFormFieldsValidation> {
  final _formKey = GlobalKey<FormState>();

  // Controllers
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dniController = TextEditingController();
  final _nieController = TextEditingController();
  final _cifController = TextEditingController();
  final _postalController = TextEditingController();
  final _ibanController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Formulario válido'),
         duration: Duration(milliseconds: 800),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Corrige los errores'),
         duration: Duration(milliseconds: 800),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Validaciones formularios Flutter')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              // Email
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(labelText: 'Email'),
                validator: emailValidator(),
              ),
              const SizedBox(height: 16),

              // Teléfono
              TextFormField(
                controller: _phoneController,
                decoration: const InputDecoration(labelText: 'Teléfono (España)'),
                keyboardType: TextInputType.phone,
                validator: phoneValidator(),
              ),
              const SizedBox(height: 16),

              // DNI
              TextFormField(
                controller: _dniController,
                decoration: const InputDecoration(labelText: 'DNI'),
                validator: dniValidator(),
              ),
              const SizedBox(height: 16),

              // NIE
              TextFormField(
                controller: _nieController,
                decoration: const InputDecoration(labelText: 'NIE'),
                validator: nieValidator(),
              ),
              const SizedBox(height: 16),

              // CIF
              TextFormField(
                controller: _cifController,
                decoration: const InputDecoration(labelText: 'CIF'),
                validator: cifValidator(),
              ),
              const SizedBox(height: 16),

              // Código Postal
              TextFormField(
                controller: _postalController,
                decoration: const InputDecoration(labelText: 'Código Postal'),
                keyboardType: TextInputType.number,
                validator: postalCodeValidator(),
              ),
              const SizedBox(height: 16),

              // IBAN España
              TextFormField(
                controller: _ibanController,
                decoration: const InputDecoration(labelText: 'IBAN (España)'),
                validator: ibanEsValidator(),
              ),
              const SizedBox(height: 16),

              // Contraseña
              TextFormField(
                controller: _passwordController,
                decoration: const InputDecoration(labelText: 'Contraseña'),
                obscureText: true,
                validator: strongPasswordValidator(),
              ),
              const SizedBox(height: 16),

              // Confirmar contraseña
              TextFormField(
                controller: _confirmController,
                decoration: const InputDecoration(labelText: 'Confirmar contraseña'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Campo requerido';
                  }
                  if (value != _passwordController.text) {
                    return 'Las contraseñas no coinciden';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Botón enviar
              ElevatedButton(
                onPressed: _submitForm,
                child: const Text('Validar formulario'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
