class MovieModel {
  final int id;
  final String title;
  final String? overview;
  final String? posterPath;
  final String? backdropPath;
  final String? releaseDate;
  final List<Genre> genres;
  final double voteAverage;
  final int voteCount;
  final String? status;
  final String? tagline;
  final String? homepage;

  MovieModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.backdropPath,
    required this.releaseDate,
    required this.genres,
    required this.voteAverage,
    required this.voteCount,
    required this.status,
    required this.tagline,
    required this.homepage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    List<Genre> genres = [];
    if (json['genres'] != null) {
      var genreList = json['genres'] as List;
      genres =
          json['genres'] != null && json['genres'].isNotEmpty
              ? genreList.map((i) => Genre.fromJson(i)).toList()
              : [];
    }
    return MovieModel(
      id: json['id'],
      title: json['title'],
      overview: json['overview'],
      posterPath: json['poster_path'],
      backdropPath: json['backdrop_path'],
      releaseDate: json['release_date'],
      genres: json['genres'] != null ? genres : [],
      voteAverage: json['vote_average'].toDouble(),
      voteCount: json['vote_count'],
      status: json['status'],
      tagline: json['tagline'],
      homepage: json['homepage'],
    );
  }
}

class Genre {
  final int id;
  final String name;

  Genre({required this.id, required this.name});

  factory Genre.fromJson(Map<String, dynamic> json) {
    return Genre(id: json['id'], name: json['name']);
  }
}
