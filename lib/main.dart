import 'package:flutter/material.dart'; // Import the Flutter Material library for UI elements.
import 'start_screen.dart'; // Import the StartScreen widget.

void main() {
  runApp(MyApp()); // Run the Flutter application with MyApp as the root widget.
}

class MyApp extends StatelessWidget {
  // Define a stateless widget called MyApp.
  @override
  Widget build(BuildContext context) {
    // Build method to construct the UI.
    return MaterialApp(
      // Create a MaterialApp for a Material Design app.
      debugShowCheckedModeBanner:
          false, // Hide the debug banner in the top-right corner.
      title: 'Evergreen', // Set the title of the app.
      theme: ThemeData(
        primarySwatch:
            Colors.green, // Set the primary color of the app to green.
      ),
      home: StartScreen(), // Set the StartScreen widget as the home screen.
    );
  }
}
