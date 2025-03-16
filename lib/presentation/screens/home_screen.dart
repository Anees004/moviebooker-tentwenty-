import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebooker/presentation/screens/movie_detail_screen.dart';
import 'package:moviebooker/presentation/widgets/category_grid.dart';
import 'package:moviebooker/presentation/widgets/search_bar.dart';
import 'package:moviebooker/presentation/widgets/search_movie_card.dart';
import '../blocs/movie_bloc/movie_bloc.dart';
import '../blocs/movie_bloc/movie_event.dart';
import '../blocs/movie_bloc/movie_state.dart';
import '../blocs/search_bloc/search_bloc.dart';
import '../blocs/search_bloc/search_state.dart';
import '../widgets/movie_card.dart';
import '../widgets/bottom_navigation_bar.dart';
import '../../core/colors.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0; // Default to 'Watch' tab
  bool _isSearching = false; // State variable to track search bar visibility
  bool _textNotEmpty = false;

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  void _toggleSearch() {
    setState(() {
      _isSearching = !_isSearching; // Toggle search state
    });
  }

  void toggleTextNotEmpty(bool isNotEmpty) {
    setState(() {
      _textNotEmpty = isNotEmpty;
    });
  }

  @override
  Widget build(BuildContext context) {
    context.read<MovieBloc>().add(FetchMovies());

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Watch',
          style: TextStyle(fontSize: 22, color: Colors.black).copyWith(
            fontWeight: FontWeight.w500, // Use thin weight
          ),
        ),
        elevation: 0,
        centerTitle: false,
        actions: [
          SearchBarWidget(
            onSearchToggle: (isSearching) {
              _toggleSearch();
            },
            onTextNotEmpty: (textNotEmpty) {
              toggleTextNotEmpty(textNotEmpty);
            },
          ),
        ],
      ),
      body:
          _isSearching
              ? (!_textNotEmpty
                  ? CategoryGridWidget()
                  : BlocBuilder<SearchBloc, SearchState>(
                    builder: (context, state) {
                      if (state is SearchLoading) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is SearchLoaded) {
                        return ListView.builder(
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return SearchMovieCard(
                              movie: state.movies[index],
                              onTap: () {
                                // Navigate to the detail screen and pass the movie data
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => MovieDetailScreen(
                                          movieId: state.movies[index].id,
                                        ),
                                  ),
                                );
                              },
                            );
                          },
                        );
                      } else if (state is SearchError)
                        print(state.message);
                      return Center(child: Text("No movies found."));
                    },
                  ))
              : BlocBuilder<MovieBloc, MovieState>(
                builder: (context, state) {
                  if (state is MovieLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is MovieLoaded) {
                    if (_isSearching) {
                      return CategoryGridWidget();
                    } else {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemCount: state.movies.length,
                          itemBuilder: (context, index) {
                            return MovieCard(
                              movie: state.movies[index],
                              onTap: () {
                                // Navigate to the detail screen and pass the movie data
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder:
                                        (context) => MovieDetailScreen(
                                          movieId: state.movies[index].id,
                                        ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      );
                    }
                  } else if (state is MovieError) {
                    return Center(child: Text(state.message));
                  }
                  return const Center(child: Text('No movies found.'));
                },
              ),
      bottomNavigationBar: BottomNavigationBarWidget(
        currentIndex: _currentIndex,
        onTap: _onTap,
      ),
    );
  }
}
