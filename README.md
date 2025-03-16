# Movie Booker

## Project Overview

- **Technologies Used**: Flutter, Dart, BLoC, HTTP, Shimmer
- **Features**:
  - Browse upcoming movies
  - Search for movies in real-time
  - View movie details
  - Display categories of movies
  - Book tickets with seat selection

## Demo

- **APK and Video**: You can find the APK and demo video in the APK_DEMO folder of this repository.
- **Demo Video**: [[Watch the demo video here](https://github.com/Anees004/moviebooker-tentwenty-/blob/main/APK_DEMO/video/Screen%20Recording%202025-03-17%20at%2012.12.39%E2%80%AFAM.mov)](link_to_your_demo_video).

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

   Ensure Flutter is installed, then run:

   ```bash
   flutter pub get
   ```

4. **Run the application**:

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

- **APK and Video**: Find the APK and demo video in the `APK_DEMO` folder.
- **Demo Video**: [[Watch here](link_to_your_demo_video)].

---

## Project Structure

```plaintext
lib/
├── core/                          # Core utilities and constants
│   ├── colors.dart                # Defines app-wide color scheme
│   ├── constants.dart              # Holds API keys, URLs, and other constants
│   ├── icons.dart                  # Icon assets reference
│   ├── theme.dart                  # Defines app theme settings
│   ├── errors/                     # Error handling classes
│   ├── usecases/                   # Use cases implementing business logic
├── data/                           # Data layer
│   ├── datasources/                # API calls and data fetching
│   │   ├── movie_remote_data_source.dart # Fetches movie data from API
│   ├── models/                      # Data models for API response
│   │   ├── category_model.dart       # Model for movie categories
│   │   ├── movie_model.dart          # Model for movie details
│   │   ├── show_time.dart            # Model for movie show times
│   ├── repositories/                 # Implementation of domain repositories
│       ├── movie_repository_impl.dart # Handles API response conversion
├── domain/                          # Business logic layer
│   ├── entities/                     # Defines core business entities
│   │   ├── movie.dart                 # Movie entity model
│   ├── repositories/                  # Abstract repository layer
│   │   ├── movie_repository.dart       # Abstract movie repository
│   ├── usecases/                      # Application-specific use cases
│   │   ├── get_upcoming_movies.dart    # Fetches upcoming movies
│   │   ├── search_upcoming_movies.dart # Handles movie search logic
├── presentation/                      # UI layer
│   ├── blocs/                         # State management (BLoC)
│   │   ├── movie_bloc/                 # Manages movie list state
│   │   │   ├── movie_bloc.dart
│   │   │   ├── movie_event.dart
│   │   │   ├── movie_state.dart
│   │   ├── movie_detail_bloc/          # Manages movie detail state
│   │   │   ├── movie_detail_bloc.dart
│   │   │   ├── movie_detail_event.dart
│   │   │   ├── movie_detail_state.dart
│   │   ├── search_bloc/                # Manages search state
│   │       ├── search_bloc.dart
│   │       ├── search_event.dart
│   │       ├── search_state.dart
│   ├── screens/                         # UI screens
│   │   ├── buy_ticket.dart              # Screen to purchase movie tickets
│   │   ├── home_screen.dart             # Main home screen with movie listings
│   │   ├── movie_detail_screen.dart     # Shows details of a selected movie
│   │   ├── movie_list_screen.dart       # Displays a list of all movies
│   │   ├── select_seat_screen.dart      # Seat selection screen
│   ├── widgets/                         # Reusable UI components
│   │   ├── bottom_navigation_bar.dart   # Bottom navigation bar widget
│   │   ├── category_grid.dart           # Displays movie categories
│   │   ├── movie_card.dart              # Movie preview card
│   │   ├── screen_widget.dart           # Generic screen layout helper
│   │   ├── search_bar.dart              # Animated search bar widget
│   │   ├── search_movie_card.dart       # Search result movie card
│   │   ├── seat_available_grid.dart     # Grid layout for available seats
│   │   ├── seat_widget.dart             # Individual seat selection widget
│   ├── utils/                           # Utility classes
│   │   ├── date_formatter.dart          # Handles date formatting
└── main.dart                            # Application entry point
```

---

## Screen & Class Descriptions

### **Screens**
- **`home_screen.dart`**  
  - Displays a list of upcoming movies with a search bar.
  - Uses `MovieBloc` to fetch and display movies.
  - Search Movies in real time. Also that is used here.
  
- **`movie_detail_screen.dart`**  
  - Shows details of a selected movie.
  - Fetches movie details using `MovieDetailBloc`.

- **`movie_list_screen.dart`**  
  - Displays a full list of movies.
  - Allows users to filter by categories.

- **`buy_ticket.dart`**  
  - Allows users to purchase tickets.
  - Displays available showtimes.

- **`select_seat_screen.dart`**  
  - Shows a grid of available seats.
  - Allows users to select and confirm seats.

### **Blocs (State Management)**
- **`movie_bloc.dart`**  
  - Handles fetching and displaying a list of upcoming movies.
  - Listens to `MovieEvent` and updates `MovieState`.

- **`movie_detail_bloc.dart`**  
  - Fetches details of a selected movie.
  - Updates the UI state with movie information.

- **`search_bloc.dart`**  
  - Handles search queries and updates the UI with results.
  - Filters movie results based on user input.

---

## Contributing

Contributions are welcome! If you have suggestions for improvements or new features, feel free to open an issue or submit a pull request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.

## Acknowledgments

- [TMDB API](https://www.themoviedb.org/documentation/api) for providing movie data.
- [Flutter](https://flutter.dev/) for the framework.
- [BLoC](https://bloclibrary.dev/#/) for state management.
