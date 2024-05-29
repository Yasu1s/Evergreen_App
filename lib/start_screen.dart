import 'package:flutter/material.dart'; // Import the Flutter Material library for UI elements.
import 'login_screen.dart'; // Import the LoginScreen widget.

class StartScreen extends StatelessWidget {
  // Define a stateless widget called StartScreen.
  @override
  Widget build(BuildContext context) {
    // Build method to construct the UI.
    return Scaffold(
      // Create a Scaffold widget to provide basic app structure.
      body: Container(
        // Create a Container widget to hold the background image and button.
        decoration: BoxDecoration(
          // Add a BoxDecoration to the Container.
          image: DecorationImage(
            // Add an image decoration to the Container.
            image: AssetImage(
                'images/start_screen_tree.jpg'), // Set the image to display.
            fit: BoxFit.cover, // Set the image to cover the entire container.
          ),
        ),
        child: Align(
          // Align the child widget to the bottom center of the Container.
          alignment: Alignment.bottomCenter,
          child: Container(
            // Create another Container to hold the button.
            height: MediaQuery.of(context).size.height /
                4, // Set the height of the Container to 1/4 of the screen height.
            width: double
                .infinity, // Set the width of the Container to the full width of the screen.
            decoration: BoxDecoration(
              // Add a BoxDecoration to the Container.
              color: Color(
                  0xFFCCEECC), // Set the background color of the Container.
              borderRadius: BorderRadius.only(
                // Add rounded corners to the top-left and top-right of the Container.
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0),
              ),
            ),
            child: Center(
              // Center the child widget within the Container.
              child: ElevatedButton(
                // Create an ElevatedButton widget.
                onPressed: () {
                  // Define the onPressed callback for the button.
                  Navigator.push(
                    // Navigate to the LoginScreen when the button is pressed.
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  // Style the button.
                  backgroundColor: Colors
                      .green[400], // Set the background color of the button.
                  padding: EdgeInsets.symmetric(
                      horizontal: 50,
                      vertical: 15), // Set the padding of the button.
                  textStyle: TextStyle(
                    // Set the text style of the button.
                    fontSize: 18, // Set the font size of the button text.
                    fontWeight: FontWeight
                        .bold, // Set the font weight of the button text to bold.
                  ),
                ),
                child: Text(
                    'Get Started'), // Set the text of the button to "Get Started".
              ),
            ),
          ),
        ),
      ),
    );
  }
}
