import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:moviebooker/data/models/category_model.dart';
import '../models/movie_model.dart';
import '../../core/constants.dart';

class MovieRemoteDataSource {
  
  Future<List<MovieModel>> getUpcomingMovies() async {
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}',
      ),
    );
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load movies');
    }
  }

  Future<List<MovieModel>> searchMovies(String query) async {
    print("Searching");
    final response = await http.get(
      Uri.parse(
        'https://api.themoviedb.org/3/search/movie?api_key=${Constants.apiKey}&query=$query',
      ),
    );

    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['results'];
      print(jsonResponse);
      return jsonResponse.map((json) => MovieModel.fromJson(json)).toList();
    } else {
      throw Exception('Failed to search movies');
    }
  }

  Future<MovieModel> getMovieDetail(int movieId) async {
    final response = await http.get(
      Uri.parse(
        "${Constants.baseUrl}3/movie/$movieId?api_key=${Constants.apiKey}",
      ),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return MovieModel.fromJson(data);
    } else {
      throw Exception("Failed to load movie details");
    }
  }

  //............categories
  Future<List<Category>> getCategories() async {
    final response = await http.get( Uri.parse('https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.apiKey}'));
    
    if (response.statusCode == 200) {
      final List<dynamic> jsonResponse = json.decode(response.body)['results'];
      return jsonResponse.map((json) => Category.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
