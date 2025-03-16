import 'package:flutter_bloc/flutter_bloc.dart';
import 'movie_event.dart';
import 'movie_state.dart';
import '../../../domain/usecases/get_upcoming_movies.dart';
import '../../../domain/entities/movie.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetUpcomingMovies getUpcomingMovies;

  MovieBloc(this.getUpcomingMovies) : super(MovieInitial()) {
    on<FetchMovies>((event, emit) async {
      emit(MovieLoading());
      try {
        final movies = await getUpcomingMovies(NoParams());
        emit(MovieLoaded(movies));
      } catch (e) {
        emit(MovieError(e.toString()));
      }
    });
  }
} 