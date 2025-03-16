abstract class SearchEvent {}

class FetchCategories extends SearchEvent {}

class SearchMovies extends SearchEvent {
  final String query;

  SearchMovies(this.query);
}
