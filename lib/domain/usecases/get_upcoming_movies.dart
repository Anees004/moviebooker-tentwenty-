import 'package:moviebooker/core/usecases/usecase.dart';

import '../repositories/movie_repository.dart';
import '../entities/movie.dart';

class GetUpcomingMovies implements UseCase<List<Movie>, NoParams> {
  final MovieRepository repository;

  GetUpcomingMovies(this.repository);

  @override
  Future<List<Movie>> call(NoParams params) async {
    return await repository.getUpcomingMovies();
  }
}

class NoParams {} 