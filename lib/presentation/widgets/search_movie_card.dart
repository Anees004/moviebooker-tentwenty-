import 'package:flutter/material.dart';
import 'package:moviebooker/domain/entities/movie.dart';

class SearchMovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap; // Add a callback for navigation
  SearchMovieCard({required this.movie, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(color: Colors.black12, blurRadius: 4, spreadRadius: 1),
          ],
        ),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                movie.posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    : 'https://via.placeholder.com/500x750?text=No+Image', // Fallback image

                width: 150,
                height: 120,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/no_image.png',
                    width: 150,
                    height: 120,
                    fit: BoxFit.cover,
                  ); // Local fallback
                },
              ),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.title,
                    maxLines: 1,
                    style: TextStyle(
                      fontSize: 16,

                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    maxLines: 1,
                    movie.title ?? "Unknown Genre",
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            Icon(Icons.more_horiz, color: Colors.blueAccent), // Dots Indicator
          ],
        ),
      ),
    );
  }
}
