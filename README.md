# Movie Booker

## Project Overview

- **Technologies Used**: Flutter, Dart, Bloc, HTTP, Shimmer
- **Features**:
  - Browse upcoming movies
  - Search for movies in real-time
  - View movie details
  - Display categories of movies
  - Select seats and buy tickets

## Installation

1. **Clone the repository**:

   ```bash
   git clone https://github.com/yourusername/moviebooker.git
   ```

2. **Navigate to the project directory**:

   ```bash
   cd moviebooker
   ```

3. **Install dependencies**:

   Make sure you have Flutter installed on your machine. Then run:

   ```bash
   flutter pub get
   ```

4. **Run the application**:

   You can run the app on an emulator or a physical device:

   ```bash
   flutter run
   ```

## Configuration

1. **API Key**:

   You need to obtain an API key from TMDB. Once you have the key, replace the placeholder in `lib/core/constants.dart`:

   ```dart
   class Constants {
     static const String apiKey = 'YOUR_API_KEY_HERE';
     static const String baseUrl = 'https://api.themoviedb.org/';
   }
   ```

## Demo

- **APK and Video**: You can find the APK and demo video in the APK_DEMO folder of this repository.
- **Demo Video**: [[Watch the demo video here](https://github.com/Anees004/moviebooker-tentwenty-/blob/main/APK_DEMO/video/Screen%20Recording%202025-03-17%20at%2012.12.39%E2%80%AFAM.mov)](link_to_your_demo_video).

## Usage

- **Home Screen**: Displays a list of upcoming movies and a search bar.
- **Search Functionality**: As you type in the search bar, the app fetches and displays matching movies in real-time.
- **Movie Details**: Tap on a movie card to view more details about the selected movie.
- **Seat Selection**: Choose available seats for a movie and proceed with ticket booking.

## Project Structure

```
lib/
├── core/
│   ├── errors/
│   ├── usecases/
│   ├── colors.dart
│   ├── constants.dart
│   ├── icons.dart
│   ├── theme.dart
│
├── data/
│   ├── datasources/
│   │   └── movie_remote_data_source.dart
│   ├── models/
│   │   ├── category_model.dart
│   │   ├── movie_model.dart
│   │   ├── show_time.dart
│   ├── repositories/
│       └── movie_repository_impl.dart
│
├── domain/
│   ├── entities/
│   │   └── movie.dart
│   ├── repositories/
│   │   └── movie_repository.dart
│   ├── usecases/
│       ├── get_upcoming_movies.dart
│       ├── search_upcoming_movies.dart
│
├── presentation/
│   ├── blocs/
│   │   ├── movie_bloc/
│   │   │   ├── movie_bloc.dart
│   │   │   ├── movie_event.dart
│   │   │   ├── movie_state.dart
│   │   ├── movie_detail_bloc/
│   │   │   ├── movie_detail_bloc.dart
│   │   │   ├── movie_detail_event.dart
│   │   │   ├── movie_detail_state.dart
│   │   ├── search_bloc/
│   │   │   ├── search_bloc.dart
│   │   │   ├── search_event.dart
│   │   │   ├── search_state.dart
│   ├── screens/
│   │   ├── buy_ticket.dart
│   │   ├── home_screen.dart
│   │   ├── movie_detail_screen.dart
│   │   ├── movie_list_screen.dart
│   │   ├── select_seat_screen.dart
│   ├── widgets/
│   │   ├── bottom_navigation_bar.dart
│   │   ├── category_grid.dart
│   │   ├── movie_card.dart
│   │   ├── screen_widget.dart
│   │   ├── search_bar.dart
│   │   ├── search_movie_card.dart
│   │   ├── seat_available_grid.dart
│   │   ├── seat_widget.dart
│   ├── utils/
│       └── date_formatter.dart
└── main.dart
```

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [TMDB API](https://www.themoviedb.org/documentation/api) for providing movie data.
- [Flutter](https://flutter.dev/) for the framework.
- [Bloc](https://bloclibrary.dev/#/) for state management.
