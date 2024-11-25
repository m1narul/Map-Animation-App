#Map Animation App
Description
This Flutter application demonstrates map integration, animations, and state management using GetX. It provides an interactive map with categorized markers (cycling, shopping, restaurants), animations for markers, and smooth transitions. The app is designed with clean UI and supports light and dark map themes.

Features
Interactive Map: View and interact with categorized markers.
Animations: Marker bounce effects and smooth transitions.
Dark Mode: Toggle between light and dark map styles.
Custom Icons: Unique icons for cycling, shopping, and restaurants.
User Location: Display user's current location on the map.
State Management: Efficiently managed with GetX.
Prerequisites
Flutter SDK: 3.5.4 or higher.
Google Maps API key (Need to included in strings.xml).
Getting Started
1. Clone the Repository
   bash
   Copy code
   git clone <repository_url>
   cd map_animation_app
2. Install Dependencies
   bash
   Copy code
   flutter pub get
3. Add Google Maps API Key
   Ensure your Google Maps API key is set in the following file:

Create a file on this android/app/src/main/res/values/strings.xml:
xml
Copy code
<?xml version="1.0" encoding="utf-8"?>
<resources>
    <string name="google_maps_api_key">Your API Key</string>
</resources>
4. Run the App
bash
Copy code
flutter run
Folder Structure
bash
Copy code
assets/
  icons/
    app_icon.png          # App launcher icon
    cycle.png             # Marker for cycling
    shopping.png          # Marker for shopping
    restaurant.png        # Marker for restaurants
  map_styles/
    light_mode.json       # Light map style
    dark_mode.json        # Dark map style
lib/
  controllers/            # GetX controllers
  views/                  # UI views
  widgets/                # Reusable widgets
  main.dart               # Main entry point
Tools and Libraries
GetX: State management.
Google Maps Flutter: Map integration.
Animate Do: Marker animations.
Geolocator: User location tracking.
Screenshots
Include relevant screenshots of the app UI.
# Map Animation App

## Description
A Flutter application showcasing interactive map features, animations, and categorized marker filtering.

## Features
- Map with categorized markers (cycle, shopping, restaurant).
- Marker animations and smooth transitions.
- Dark mode support.
- User location display.

## Installation
1. Clone the repository:
   ```bash
   git clone https://github.com/m1narul/Map-Animation-App.git
   cd Map-Animation-App

License
This project is licensed under the MIT License.