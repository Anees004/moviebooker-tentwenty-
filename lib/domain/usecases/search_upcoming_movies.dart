import 'package:moviebooker/core/usecases/usecase.dart';

import '../repositories/movie_repository.dart';
import '../entities/movie.dart';

class SerachUpcomingMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  SerachUpcomingMovies(this.repository);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repository.searchMovies(params.toString());
  }
}

class NoParams {} 