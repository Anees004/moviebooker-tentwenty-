import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebooker/core/theme.dart';
import 'package:moviebooker/presentation/blocs/movie_detail_bloc/movie_detail_bloc.dart';
import 'package:moviebooker/presentation/blocs/search_bloc/search_bloc.dart';
import 'package:provider/provider.dart';
import 'data/datasources/movie_remote_data_source.dart';
import 'data/repositories/movie_repository_impl.dart';
import 'domain/usecases/get_upcoming_movies.dart';
import 'presentation/blocs/movie_bloc/movie_bloc.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        BlocProvider(
          create: (context) => MovieBloc(GetUpcomingMovies(MovieRepositoryImpl(MovieRemoteDataSource()))),
        ),
        BlocProvider(
          create: (context) => SearchBloc(MovieRepositoryImpl(MovieRemoteDataSource())),
        ),
          BlocProvider(
          create: (context) => MovieDetailBloc(MovieRepositoryImpl(MovieRemoteDataSource())), // Add this line
        ),
        
      ],
      child: MaterialApp(
        title: 'Movie Booker',
        theme: appTheme,
        debugShowCheckedModeBanner: false,
        home: HomeScreen(), // Start with HomeScreen
        routes: {
          // '/movieDetail': (context) => MovieDetailScreen(movieTitle: 'Sample Movie'), // Pass movie details
        },
      ),
    );
  }
}
