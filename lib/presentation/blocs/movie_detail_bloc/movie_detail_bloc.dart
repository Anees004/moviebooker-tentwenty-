// lib/presentation/blocs/movie_detail_bloc/movie_detail_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../data/repositories/movie_repository_impl.dart';
import 'movie_detail_event.dart';
import 'movie_detail_state.dart';

class MovieDetailBloc extends Bloc<MovieDetailEvent, MovieDetailState> {
  final MovieRepositoryImpl repository;

  MovieDetailBloc(this.repository) : super(MovieDetailInitial()) {
    on<FetchMovieDetail>((event, emit) async {
      emit(MovieDetailLoading());
      try {
        final movie = await repository.getMovieDetail(event.movieId);
        emit(MovieDetailLoaded(movie));
      } catch (e) {
        emit(MovieDetailError(e.toString()));
      }
    });
  }
}