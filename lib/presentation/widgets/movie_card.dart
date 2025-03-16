// lib/presentation/widgets/movie_card.dart
import 'package:flutter/material.dart';
import 'package:moviebooker/core/colors.dart';
import 'package:shimmer/shimmer.dart'; // Import the shimmer package
import '../../domain/entities/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;
  final Function onTap; // Add a callback for navigation

  const MovieCard({Key? key, required this.movie, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 5.0),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: Stack(
            alignment: Alignment.bottomLeft,
            children: [
              // Use a FutureBuilder to handle image loading
              Image.network(
                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) return child; // Image loaded
                  return Shimmer.fromColors(
                    baseColor: const Color.fromARGB(255, 144, 142, 142)!,
                    highlightColor: Colors.grey[100]!,
                    child: Container(
                      width: double.infinity,
                      height: 200,
                      color: Colors.white, // Placeholder color
                    ),
                  );
                },
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    width: double.infinity,
                    height: 200,
                    color: Colors.grey, // Placeholder color for error
                    child: Center(child: Icon(Icons.error)),
                  );
                },
              ),
              Container(
                width: double.infinity,
                height: 100,
                padding: const EdgeInsets.all(8.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [AppColors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        movie.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 22,
                          color: AppColors.white,
                        ).copyWith(
                          fontWeight: FontWeight.w500, // Use thin weight
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}