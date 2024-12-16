
import 'package:flutter/material.dart';
import 'login_screen.dart'; // Importa la pantalla de login
import 'register_screen.dart'; // Importa la pantalla de registro

// ignore: use_key_in_widget_constructors
class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo degradado
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.purpleAccent, Colors.blueAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Título con estilo
              Text(
                '¡Bienvenido a Peliculeando con Edwin!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 2,
                  shadows: [
                    Shadow(
                      blurRadius: 10.0,
                      // ignore: deprecated_member_use
                      color: Colors.black.withOpacity(0.5),
                      offset: const Offset(4.0, 4.0),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              

              const SizedBox(height: 40),
              
              // Botón de inicio de sesión con estilo
              _buildStyledButton(context, 'Iniciar sesión', LoginScreen()),

              const SizedBox(height: 20),
              
              // Botón de registro con estilo
              _buildStyledButton(context, 'Registrarse', RegisterScreen()),
            ],
          ),
        ),
      ),
    );
  }

  // Función para crear un botón estilizado
  Widget _buildStyledButton(BuildContext context, String text, Widget nextScreen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white, backgroundColor: Colors.orangeAccent, // Color del texto
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 40),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30), // Bordes redondeados
        ),
        elevation: 5, // Sombra
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => nextScreen),
        );
      },
      child: Text(
        text,
        style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
    );
  }
}
