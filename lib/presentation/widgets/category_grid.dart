import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moviebooker/presentation/blocs/search_bloc/search_bloc.dart';
import '../blocs/search_bloc/search_state.dart';

class CategoryGridWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBloc, SearchState>(
      builder: (context, state) {
        print("I am $state");
        if (state is SearchLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is SearchLoaded) {
          return GridView.builder(
            itemCount: state.categories.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              return Card(
                child: Center(child: Text(state.categories[index].id.toString())),
              );
            },
          );
        } else {
          return Center(child: Text("No Categories Found"));
        }
      },
    );
  }
}
