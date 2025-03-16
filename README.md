# Movie Booker

Movie Booker is a Flutter application that allows users to browse and search for movies. It utilizes the TMDB (The Movie Database) API to fetch movie data, including upcoming movies and categories.

## Features

- Browse upcoming movies
- Search for movies in real-time
- View movie details
- Display categories of movies
- Responsive design with a clean user interface

## Technologies Used

- Flutter
- Dart
- Bloc for state management
- HTTP for API requests
- Shimmer for loading effects
- Provider for dependency injection

## Installation

1. **Clone the repository:**

   ```bash
   git clone https://github.com/yourusername/moviebooker.git
   ```

2. **Navigate to the project directory:**

   ```bash
   cd moviebooker
   ```

3. **Install dependencies:**

   Make sure you have Flutter installed on your machine. Then run:

   ```bash
   flutter pub get
   ```

4. **Run the application:**

   You can run the app on an emulator or a physical device:

   ```bash
   flutter run
   ```

## Configuration

1. **API Key:**

   You need to obtain an API key from TMDB. Once you have the key, replace the placeholder in `lib/core/constants.dart`:

   ```dart
   class Constants {
     static const String apiKey = 'YOUR_API_KEY_HERE';
     static const String baseUrl = 'https://api.themoviedb.org/';
   }
   ```

## Usage

- **Home Screen:** Displays a list of upcoming movies and a search bar.
- **Search Functionality:** As you type in the search bar, the app fetches and displays matching movies in real-time.
- **Movie Details:** Tap on a movie card to view more details about the selected movie.

## Project Structure
