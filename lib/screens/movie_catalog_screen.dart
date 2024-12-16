
import 'package:flutter/material.dart';
import 'movie_player_screen.dart'; // Importa la pantalla de reproducción de películas

class Movie {
  final String title;
  final String description;
  final String imageUrl;

  Movie({required this.title, required this.description, required this.imageUrl});
}

// ignore: use_key_in_widget_constructors
class MovieCatalogScreen extends StatelessWidget {
  // Lista de películas en diferentes categorías
  final List<Movie> popularMovies = [
    Movie(
      title: 'Inception',
      description: 'Un ladrón experto manipula los sueños para robar secretos.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQICSRPd2YfmVRcwt23xoQnkwZiNcSyxOLeDw&s',
    ),
    Movie(
      title: 'The Dark Knight',
      description: 'El caballero oscuro enfrenta al caos que amenaza Gotham.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BMTMxNTMwODM0NF5BMl5BanBnXkFtZTcwODAyMTk2Mw@@._V1_.jpg',
    ),
  ];

  final List<Movie> trendingMovies = [
    Movie(
      title: 'The Big Short',
      description: 'Un grupo de inversores apuesta contra el colapso del mercado hipotecario.',
      imageUrl: 'https://m.media-amazon.com/images/M/MV5BZDg3MjY1MjQtMzFmYS00NzUwLWExYjctYzc3ZGIwZjAxZjczXkEyXkFqcGc@._V1_QL75_UY207_CR13,0,140,207_.jpg',
    ),
    Movie(
      title: 'Interstellar',
      description: 'Un grupo de astronautas viaja a través de un agujero de gusano en busca de un nuevo hogar para la humanidad.',
      imageUrl: 'https://www.rogerebert.com/wp-content/uploads/2024/08/Interstellar-scaled.webp',
    ),
  ];

  final List<Movie> newArrivals = [
    Movie(
      title: 'Tenet',
      description: 'Un espía debe manipular el flujo del tiempo para evitar una catástrofe mundial.',
      imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9b06StaQ-y4T6SvX4bkxi9anc9kbsLgMPzQ&s',
    ),
    Movie(
      title: 'Dune',
      description: 'La historia épica de un joven luchador por salvar su casa y su planeta.',
      imageUrl: 'https://www.mrbooks.com/mrbooks/portadas/9788467943603.webp',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple, // Fondo del AppBar con color profundo
        title: const Text('Catálogo de Películas', style: TextStyle(color: Colors.white)),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xFFB3E5FC), Color(0xFFE1BEE7)], // Colores pastel para el fondo
          ),
        ),
        child: ListView(
          children: [
            // Categoría "Populares"
            _buildMovieCategory('Populares', popularMovies, context),
            
            // Categoría "Tendencias"
            _buildMovieCategory('Tendencias', trendingMovies, context),
            
            // Categoría "Nuevas Llegadas"
            _buildMovieCategory('Nuevas Llegadas', newArrivals, context),
          ],
        ),
      ),
    );
  }

  // Widget para construir cada categoría de películas
  Widget _buildMovieCategory(String category, List<Movie> movies, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Título de la categoría con estilo
          Text(
            category,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple, // Color del título
            ),
          ),
          const SizedBox(height: 10),
          // Listado de películas en la categoría
          SizedBox(
            height: 250, // Altura fija para las películas
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: movies.length,
              itemBuilder: (context, index) {
                return _buildMovieCard(movies[index], context);
              },
            ),
          ),
        ],
      ),
    );
  }

  // Widget para construir una tarjeta de película
  Widget _buildMovieCard(Movie movie, BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navegar a la pantalla de detalles de la película, pasando la película seleccionada
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MoviePlayerScreen(
              movie: movie, // Pasa el objeto de película seleccionado
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        width: 150,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15), // Bordes redondeados para la tarjeta
          image: DecorationImage(
            image: NetworkImage(movie.imageUrl), // Imagen de portada de la película
            fit: BoxFit.cover,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2), // Sombra ligera
              blurRadius: 5,
              offset: const Offset(0, 4), // Sombra hacia abajo
            ),
          ],
        ),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Container(
            padding: const EdgeInsets.all(8),
            color: Colors.black.withOpacity(0.6), // Fondo oscuro en la parte inferior
            child: Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
