import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'movie_catalog_screen.dart'; // Importa la pantalla de catálogo de películas

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  LoginScreen({super.key});

  Future<void> loginUser(BuildContext context) async {
    // ignore: unused_local_variable
    String email = emailController.text.trim();
    // ignore: unused_local_variable
    String password = passwordController.text.trim();

    try {
      // Iniciar sesión con Firebase

      // Si la autenticación es exitosa, navega al catálogo de películas
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => MovieCatalogScreen()),
      );
    } on FirebaseAuthException catch (e) {
      // Manejo de errores específicos de Firebase
      if (e.code == 'user-not-found') {
        showErrorDialog(context, 'No hay ninguna cuenta asociada a este correo electrónico.');
      } else if (e.code == 'wrong-password') {
        showErrorDialog(context, 'La contraseña es incorrecta.');
      } else {
        showErrorDialog(context, 'Error: ${e.message}');
      }
    } catch (e) {
      // Manejo de errores generales
      showErrorDialog(context, 'Ha ocurrido un error inesperado.');
    }
  }

  void showErrorDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Aceptar'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo degradado con colores pasteles
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFB3E5FC), Color(0xFFE1BEE7)], // Colores pastel
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              elevation: 10, // Sombra suave
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20), // Bordes redondeados
              ),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    // Título de la pantalla con estilo moderno
                    const Text(
                      'Iniciar sesión',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF4A148C), // Color morado suave
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Campo de texto para el correo electrónico
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: 'Correo electrónico',
                        labelStyle: TextStyle(color: Colors.purple.shade200),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Campo de texto para la contraseña
                    TextField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        labelText: 'Contraseña',
                        labelStyle: TextStyle(color: Colors.purple.shade200),
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Botón de inicio de sesión estilizado
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.white, backgroundColor: Colors.purple.shade300,
                        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 40),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                        elevation: 5, // Sombra
                      ),
                      onPressed: () {
                        loginUser(context);
                      },
                      child: const Text(
                        'Ingresar',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
