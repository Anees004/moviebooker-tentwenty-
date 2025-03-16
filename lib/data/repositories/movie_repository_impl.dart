import 'package:moviebooker/data/models/category_model.dart';
import 'package:moviebooker/data/models/movie_model.dart';
import 'package:moviebooker/domain/entities/movie.dart';

import '../../domain/repositories/movie_repository.dart';
import '../datasources/movie_remote_data_source.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieRemoteDataSource remoteDataSource;

  MovieRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Movie>> getUpcomingMovies() async {
    final movieModels = await remoteDataSource.getUpcomingMovies();
    return movieModels
        .map(
          (model) => Movie(
            id: model.id,
            title: model.title,
            overview: model.overview ?? '',
            posterPath: model.posterPath ?? '',
          ),
        )
        .toList();
  }

  @override
  Future<List<Movie>> searchMovies(String query) async {
    final movieModels = await remoteDataSource.searchMovies(query);
    return movieModels
        .map(
          (model) => Movie(
            id: model.id,
            title: model.title,
            overview: model.overview ?? '',
            posterPath: model.posterPath ?? '',
          ),
        )
        .toList();
  }
@override
Future<List<Category>> fetchCategories() async {
  final categoryModels = await remoteDataSource.getCategories();
  return categoryModels
      .map(
        (model) => Category(
          id: model.id,
          name: model.name,
        ),
      )
      .toList();
}

  Future<MovieModel> getMovieDetail(int movieId) async {
    return await remoteDataSource.getMovieDetail(movieId);
  }
}
