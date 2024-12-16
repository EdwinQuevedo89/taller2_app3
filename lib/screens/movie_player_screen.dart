
import 'package:flutter/material.dart';
import 'package:taller_uno/screens/movie_catalog_screen.dart';

class MoviePlayerScreen extends StatefulWidget {
  final Movie movie; // Película recibida

  // Constructor para recibir la película
  const MoviePlayerScreen({super.key, required this.movie});

  @override
  // ignore: library_private_types_in_public_api
  _MoviePlayerScreenState createState() => _MoviePlayerScreenState();
}

class _MoviePlayerScreenState extends State<MoviePlayerScreen> {
  bool isPlaying = false; // Estado para controlar si la película está en reproducción
  bool showSubtitles = false; // Estado para los subtítulos
  String videoQuality = "HD"; // Calidad de video por defecto
  double volume = 0.5; // Valor inicial del volumen

  // Funciones para los controles
  void playPause() {
    setState(() {
      isPlaying = !isPlaying;
    });
  }

  void seekBackward() {
    // Lógica para retroceder 30 segundos
  }

  void seekForward() {
    // Lógica para adelantar 30 segundos
  }

  void adjustVolume(double newVolume) {
    setState(() {
      volume = newVolume;
    });
  }

  void toggleSubtitles() {
    setState(() {
      showSubtitles = !showSubtitles;
    });
  }

  @override
  Widget build(BuildContext context) {
    var dropdownButton7 = DropdownButton<String>(
      value: videoQuality,
      onChanged: (String? newValue) {
        setState(() {
          videoQuality = newValue!; // Establecer el nuevo valor de calidad
        });
      },
      items: const [
        DropdownMenuItem<String>(
          value: "HD",
          child: Text("HD"),
        ),
        DropdownMenuItem<String>(
          value: "SD",
          child: Text("SD"),
        ),
        DropdownMenuItem<String>(
          value: "4K",
          child: Text("4K"),
        ),
      ],
      dropdownColor: Colors.black87,
      style: const TextStyle(color: Colors.white),
      iconEnabledColor: Colors.white,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movie.title),
        backgroundColor: Colors.black87,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.deepPurple, Colors.purpleAccent],
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Mostrar la imagen de la película (simulación del reproductor)
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  widget.movie.imageUrl,
                  height: 250,
                  width: 150,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              // Título de la película
              Text(
                widget.movie.title,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 10),
              // Descripción de la película
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.movie.description,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Controles de reproducción
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(
                      isPlaying ? Icons.pause_circle_filled : Icons.play_circle_filled,
                      color: Colors.white,
                      size: 40,
                    ),
                    onPressed: playPause,
                  ),
                  IconButton(
                    icon: const Icon(Icons.replay_30, color: Colors.white),
                    onPressed: seekBackward,
                  ),
                  IconButton(
                    icon: const Icon(Icons.forward_30, color: Colors.white),
                    onPressed: seekForward,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              // Controles de volumen
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.volume_down, color: Colors.white),
                  Slider(
                    value: volume,
                    onChanged: adjustVolume,
                    min: 0.0,
                    max: 1.0,
                    activeColor: Colors.white,
                  ),
                  const Icon(Icons.volume_up, color: Colors.white),
                ],
              ),
              const SizedBox(height: 20),
              // Opciones adicionales
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Subtítulos
                  TextButton(
                    onPressed: toggleSubtitles,
                    child: Text(
                      showSubtitles ? "Ocultar Subtítulos" : "Mostrar Subtítulos",
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // Calidad de video
                  dropdownButton7, // Usar el DropdownButton aquí
                ],
              ),
              const SizedBox(height: 20),
              // Botón para regresar al catálogo
              ElevatedButton.icon(
                onPressed: () {
                  Navigator.pop(context); // Volver a la pantalla del catálogo
                },
                icon: const Icon(Icons.arrow_back),
                label: const Text('Volver al Catálogo'),
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.deepPurple,
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  textStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
