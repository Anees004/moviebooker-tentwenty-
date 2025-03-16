// lib/presentation/blocs/movie_detail_bloc/movie_detail_event.dart
abstract class MovieDetailEvent {}

class FetchMovieDetail extends MovieDetailEvent {
  final int movieId;

  FetchMovieDetail(this.movieId);
}