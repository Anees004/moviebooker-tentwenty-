import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebooker/presentation/screens/movie_detail_screen.dart';
import '../blocs/movie_bloc/movie_bloc.dart';
import '../blocs/movie_bloc/movie_event.dart';
import '../blocs/movie_bloc/movie_state.dart';
import '../widgets/movie_card.dart';
import '../../core/colors.dart';

class MovieListScreen extends StatelessWidget {
  const MovieListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(FetchMovies());

    return Scaffold(
      appBar: AppBar(
        title: const Text('Upcoming Movies'),
        backgroundColor: AppColors.darkPurple,
      ),
      body: BlocBuilder<MovieBloc, MovieState>(
        builder: (context, state) {
          if (state is MovieLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is MovieLoaded) {
            return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                return MovieCard(
                  movie: state.movies[index],
                  onTap: () {
                    // Navigate to the detail screen and pass the movie data
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder:
                            (context) =>
                                MovieDetailScreen(movieId: state.movies[index].id),
                      ),
                    );
                  },
                );
              },
            );
          } else if (state is MovieError) {
            return Center(child: Text(state.message));
          }
          return const Center(child: Text('No movies found.'));
        },
      ),
    );
  }
}
