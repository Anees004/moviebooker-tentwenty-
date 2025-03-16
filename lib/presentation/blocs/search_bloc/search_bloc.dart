// lib/presentation/blocs/search_bloc/search_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebooker/data/repositories/movie_repository_impl.dart';
import 'search_event.dart';
import 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  final MovieRepositoryImpl repository;

  SearchBloc(this.repository) : super(SearchInitial()) {
    on<FetchCategories>(_onFetchCategories);
    on<SearchMovies>(_onSearchMovies);
  }

  void _onFetchCategories(FetchCategories event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
       final categories = await repository.fetchCategories();
      // final categories = ['Action', 'Comedy', 'Drama']; // Example categories
      emit(SearchLoaded([], categories)); // Emit with categories
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }

  void _onSearchMovies(SearchMovies event, Emitter<SearchState> emit) async {
    emit(SearchLoading());
    try {
      final movies = await repository.searchMovies(event.query);
      // final categories = ['Action', 'Comedy', 'Drama']; // Example categories
      emit(SearchLoaded(movies, [])); // Emit with movies and categories
    } catch (e) {
      emit(SearchError(e.toString()));
    }
  }
}