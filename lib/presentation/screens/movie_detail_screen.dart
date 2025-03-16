import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebooker/core/colors.dart';
import 'package:moviebooker/data/models/movie_model.dart';
import 'package:moviebooker/domain/entities/movie.dart';
import 'package:moviebooker/presentation/screens/buy_ticket.dart';
import 'package:moviebooker/utils/date_formatter.dart';
import '../blocs/movie_detail_bloc/movie_detail_bloc.dart';
import '../blocs/movie_detail_bloc/movie_detail_event.dart';
import '../blocs/movie_detail_bloc/movie_detail_state.dart';

class MovieDetailScreen extends StatelessWidget {
  final int movieId;

  const MovieDetailScreen({Key? key, required this.movieId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.read<MovieDetailBloc>().add(FetchMovieDetail(movieId));

    return Scaffold(
      body: BlocBuilder<MovieDetailBloc, MovieDetailState>(
        builder: (context, state) {
          if (state is MovieDetailLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieDetailLoaded) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _MovieBanner(movie: state.movie),
                  _MovieInfo(movie: state.movie),
                ],
              ),
            );
          } else if (state is MovieDetailError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No movie details found.'));
        },
      ),
    );
  }
}

class _MovieBanner extends StatelessWidget {
  final MovieModel movie;
  const _MovieBanner({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String formattedReleaseDate = formatDate(movie.releaseDate!);
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500${movie.posterPath}',
          width: double.infinity,
          height: 400,
          fit: BoxFit.cover,
        ),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(16.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                AppColors.black, // Start with 80% opacity
                AppColors.black.withOpacity(0.5), // 50% opacity
                AppColors.black.withOpacity(0.0), // Fully transparent
              ],
              stops: [0.0, 0.8, 1.0], // Define stops for the gradient
              begin: Alignment.bottomCenter,
              end: Alignment.topCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'In Theaters ${formattedReleaseDate}',
                style: TextStyle(
                  fontSize: 18,
                  color: AppColors.white,
                ).copyWith(fontWeight: FontWeight.w500),
              ),
              SizedBox(height: 15),
              _ActionButtons(movieName: movie.title,releaseDate: formattedReleaseDate,),
              SizedBox(height: 10),
            ],
          ),
        ),
      ],
    );
  }
}

class _ActionButtons extends StatelessWidget {
  final String movieName, releaseDate;

  const _ActionButtons({super.key, required this.movieName, required this.releaseDate});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => BuyTicketScreen(movieName: movieName, releaseDate: releaseDate,)),
            );
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.lightBlue,
            padding: EdgeInsets.symmetric(horizontal: 105, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            'Get Tickets',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
        SizedBox(height: 10),
        OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: BorderSide(color: AppColors.lightBlue),
            padding: EdgeInsets.symmetric(horizontal: 80, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: Text(
            '▶ Watch Trailer',
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ),
      ],
    );
  }
}

class _MovieInfo extends StatelessWidget {
  final MovieModel movie;
  const _MovieInfo({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Genres',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: AppColors.lightBlack,
            ),
          ),
          SizedBox(height: 10),
          Wrap(
            spacing: 8,
            children: movie.genres.map((genre) => GenreChip(genre)).toList(),
          ),
          SizedBox(height: 20),
          Container(
            height: 1, // Adjust the height as needed
            color: AppColors.lightGrey, // Set the color to black
          ),
          SizedBox(height: 20),
          Text(
            'Overview',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            movie.overview!,
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }
}

class GenreChip extends StatelessWidget {
  final Genre genre;
  const GenreChip(this.genre, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          20,
        ), // Increase the radius for more roundness
      ),
      label: Text(genre.name, style: TextStyle(color: Colors.white)),
      backgroundColor: _getGenreColor(genre),
    );
  }

  Color _getGenreColor(Genre genre) {
    print("My genere ${genre.name}");
    switch (genre.name.toLowerCase()) {
      case 'action':
        return AppColors.teal;
      case 'thriller':
        return AppColors.pink;
      case 'science':
        return AppColors.purple;
      case 'fiction':
        return AppColors.gold;
      default:
        return AppColors.black; // Default fallback
    }
  }
}
