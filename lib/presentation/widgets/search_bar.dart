import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/search_bloc/search_bloc.dart';
import '../blocs/search_bloc/search_event.dart';
import '../blocs/search_bloc/search_state.dart';
import '../widgets/movie_card.dart';

class SearchBarWidget extends StatefulWidget {
  final Function(bool) onTextNotEmpty;
  final Function(bool) onSearchToggle;

  SearchBarWidget({required this.onSearchToggle, required this.onTextNotEmpty});

  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;
  TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // widget.onTextNotEmpty(true);
  }

  void _toggleSearch() {
    setState(() {
      if (_isExpanded) widget.onTextNotEmpty(true);
      _isExpanded = !_isExpanded;
    });
    widget.onSearchToggle(_isExpanded);

    if (!_isExpanded) {
      _controller.clear();
      context.read<SearchBloc>().add(SearchMovies("")); // Clear search results
    }
  }

  void _onSearchChanged(String query) {
    widget.onTextNotEmpty(query.trim().isNotEmpty);
    context.read<SearchBloc>().add(SearchMovies(query));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AnimatedContainer(
          duration: Duration(milliseconds: 300),
          width: _isExpanded ? MediaQuery.of(context).size.width - 35 : 48,
          height: 55,
          padding: EdgeInsets.only(left: 10),
          margin: EdgeInsets.only(right: _isExpanded ? 20 : 0),
          decoration: BoxDecoration(
            color: _isExpanded ? Colors.grey[200] : Colors.transparent,
            borderRadius: BorderRadius.circular(24),
          ),
          child: Row(
            children: [
              GestureDetector(onTap: _toggleSearch, child: Icon(Icons.search)),
              SizedBox(width: 5),
              if (_isExpanded)
                Expanded(
                  child: TextField(
                    controller: _controller,
                    onChanged: _onSearchChanged,
                    decoration: InputDecoration(
                      hintText: "Search movies...",
                      border: InputBorder.none,
                    ),
                  ),
                ),
              if (_isExpanded)
                IconButton(icon: Icon(Icons.close), onPressed: _toggleSearch),
            ],
          ),
        ),

        // Display search results
        // if (_isExpanded)
        //   BlocBuilder<SearchBloc, SearchState>(
        //     builder: (context, state) {
        //       if (state is SearchLoading) {
        //         return Center(child: CircularProgressIndicator());
        //       } else if (state is SearchLoaded) {
        //         // if (state.movies.isEmpty) {
        //         //   return Center(child: Text("No results found."));
        //         // }
        //         return Expanded(
        //           child: ListView.builder(
        //             shrinkWrap: true,
        //             itemCount: state.movies.length,
        //             itemBuilder: (context, index) {
        //               return MovieCard(
        //                 movie: state.movies[index],
        //                 onTap: () {},
        //               );
        //             },
        //           ),
        //         );
        //       } else if (state is SearchError) {
        //         return Center(child: Text(state.message));
        //       }
        //       return SizedBox();
        //     },
        //   ),
      ],
    );
  }
}
