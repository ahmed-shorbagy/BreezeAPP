# Breeze Weather Forecast App

## Project Description

Breeze Weather Forecast is a cross-platform weather application built using Flutter. The app fetches weather data from the Open-Meteo API and provides real-time weather information, including temperature, humidity, and wind speed. Users can authenticate via Firebase, store their favorite locations, and view the weather forecast for multiple saved locations. The app supports both RTL and LTR interfaces and offers light and dark themes for a better user experience.

## Assumptions

- Users will have a stable internet connection to fetch weather data from the API.
- Users will have a valid email address to register and log in using Firebase Authentication.
- The app will be used on devices that support Flutter, including iOS, Android, and web browsers.
- Location services will be enabled and permissions granted by the user to fetch their current location.

## Design Decisions

- **Design Pattern**: MVVM was used to manage the structure of the app
- **State Management**: GetX was chosen for its simplicity and powerful features for managing state and dependencies in the app.
- **API**: Open-Meteo API was selected for its comprehensive weather data and ease of integration.
- **Authentication**: Firebase Authentication was implemented for secure and easy user authentication.
- **Database**: Firestore was used to store user location history for its real-time capabilities and seamless integration with Firebase Authentication.
- **Localization**: The app supports both RTL and LTR interfaces using the `intl` package, ensuring a wider audience can use the app in their preferred language.
- **Theming**: Light and dark themes were implemented to enhance user experience and provide flexibility in different lighting conditions.
- **Web Compatibility**: The app is designed to be fully functional on web platforms, leveraging Flutter's web support and ensuring a consistent experience across all devices.
- **Reverse Geocoding**: Instead of using the Flutter Geocoding package to convert coordinates to a city name, the Nominatim API was used due to issues with the Flutter Geocoding package on web platforms.

## Build and Run Commands

### Prerequisites

Ensure you have Flutter installed on your machine. You can follow the installation guide [here](https://flutter.dev/docs/get-started/install).

### Building the App

For iOS:
```sh
flutter build ios
```

For Android:
```sh
flutter build apk
```

For Web:
```sh
flutter build web
```

### Running the App

To run the app on a connected device or emulator:

```sh
flutter run
```

To run the app on a specific platform:

For iOS:
```sh
flutter run -d ios
```

For Android:
```sh
flutter run -d android
```

For Web:
```sh
flutter run -d chrome
```

### Additional Commands

To clean the project and remove build artifacts:
```sh
flutter clean
```

To get all the dependencies:
```sh
flutter pub get
```

To run tests:
```sh
flutter test
```

## Deployment

For iOS:
1. Open the Xcode project in the `ios` folder.
2. Configure signing and capabilities.
3. Archive and upload to the App Store.

For Android:
1. Generate a keystore and key.properties file.
2. Build a release APK: `flutter build apk --release`
3. Upload the APK to the Google Play Console.

For Web:
1. Build the web version: `flutter build web`
2. Deploy the contents of the `build/web` directory to your web hosting service.

## Troubleshooting

If you encounter any issues while building or running the app, try the following steps:

1. Ensure all dependencies are up to date: `flutter pub upgrade`
2. Clean the project: `flutter clean`
3. Rebuild the app: `flutter pub get` followed by `flutter run`

If problems persist, check the [Flutter documentation](https://flutter.dev/docs) or open an issue in the project repository.