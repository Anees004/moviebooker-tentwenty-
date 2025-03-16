// lib/presentation/blocs/search_bloc/search_state.dart
import 'package:moviebooker/data/models/category_model.dart';

import '../../../domain/entities/movie.dart';

abstract class SearchState {}

class SearchInitial extends SearchState {}

class SearchLoading extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movies;
  final List<Category> categories;

  SearchLoaded(this.movies, this.categories);
}

class SearchError extends SearchState {
  final String message; // Add this line

  SearchError(this.message); // Ensure the constructor initializes the message
}