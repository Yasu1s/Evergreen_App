import 'package:flutter/material.dart'; // Import the Flutter Material library for UI elements.
import 'signup_screen.dart'; // Import the SignupScreen widget.
import 'home_screen.dart'; // Import the HomeScreen widget.

class LoginScreen extends StatefulWidget {
  // Define a stateful widget called LoginScreen.
  @override
  _LoginScreenState createState() =>
      _LoginScreenState(); // Create the state object for the widget.
}

class _LoginScreenState extends State<LoginScreen> {
  // Define the state class for the LoginScreen widget.
  bool _rememberMe =
      false; // Define a boolean variable to store the state of the "Remember Me" checkbox.

  @override
  Widget build(BuildContext context) {
    // Build method to construct the UI.
    return Scaffold(
      // Create a Scaffold widget to provide basic app structure.
      appBar: AppBar(
        // Create an AppBar widget.
        backgroundColor:
            Color(0xFFCCEECC), // Set the background color of the AppBar.
        elevation: 0, // Set the elevation of the AppBar to 0 (no shadow).
        iconTheme: IconThemeData(
            color:
                Colors.green[800]), // Set the color of the icons in the AppBar.
      ),
      backgroundColor:
          Color(0xFFCCEECC), // Set the background color of the Scaffold.
      body: Padding(
        // Add padding around the child widget.
        padding: const EdgeInsets.all(
            20.0), // Set the padding value to 20 pixels on all sides.
        child: Column(
          // Create a Column widget to arrange its children vertically.
          mainAxisAlignment: MainAxisAlignment
              .center, // Center the children of the Column vertically.
          children: [
            // Define the children of the Column widget.
            Text(
              // Create a Text widget to display the app name.
              'Evergreen',
              style: TextStyle(
                // Style the text.
                fontSize: 32, // Set the font size.
                fontWeight: FontWeight.bold, // Set the font weight to bold.
                color: Colors.green[800], // Set the color of the text.
              ),
            ),
            SizedBox(
                height:
                    30), // Create a SizedBox widget with a height of 30 pixels.
            Text(
              // Create a Text widget to display the welcome message.
              'Welcome Back!',
              style: TextStyle(
                // Style the text.
                fontSize: 24, // Set the font size.
                fontWeight: FontWeight.bold, // Set the font weight to bold.
                color: Colors.green[800], // Set the color of the text.
              ),
            ),
            SizedBox(
                height:
                    20), // Create a SizedBox widget with a height of 20 pixels.
            Icon(
              // Create an Icon widget to display an icon.
              Icons.eco, // Set the icon to display.
              size: 60, // Set the size of the icon.
              color: Colors.green[800], // Set the color of the icon.
            ),
            SizedBox(
                height:
                    30), // Create a SizedBox widget with a height of 30 pixels.
            TextField(
              // Create a TextField widget for username input.
              decoration: InputDecoration(
                // Style the TextField.
                hintText: 'Username', // Set the hint text.
                filled: true, // Fill the TextField with a background color.
                fillColor: Colors.white, // Set the fill color of the TextField.
                border: OutlineInputBorder(
                  // Set the border of the TextField.
                  borderRadius:
                      BorderRadius.circular(10.0), // Set the border radius.
                  borderSide: BorderSide.none, // Remove the border side.
                ),
              ),
            ),
            SizedBox(
                height:
                    15), // Create a SizedBox widget with a height of 15 pixels.
            TextField(
              // Create a TextField widget for password input.
              obscureText: true, // Hide the password input.
              decoration: InputDecoration(
                // Style the TextField.
                hintText: 'Password', // Set the hint text.
                filled: true, // Fill the TextField with a background color.
                fillColor: Colors.white, // Set the fill color of the TextField.
                border: OutlineInputBorder(
                  // Set the border of the TextField.
                  borderRadius:
                      BorderRadius.circular(10.0), // Set the border radius.
                  borderSide: BorderSide.none, // Remove the border side.
                ),
              ),
            ),
            SizedBox(
                height:
                    15), // Create a SizedBox widget with a height of 15 pixels.
            Row(
              // Create a Row widget to arrange its children horizontally.
              children: [
                // Define the children of the Row widget.
                Checkbox(
                  // Create a Checkbox widget.
                  value: _rememberMe, // Set the initial value of the checkbox.
                  onChanged: (value) {
                    // Define the onChanged callback for the checkbox.
                    setState(() {
                      // Update the state of the widget when the checkbox value changes.
                      _rememberMe =
                          value!; // Update the value of _rememberMe with the new value of the checkbox.
                    });
                  },
                  activeColor: Colors.green[
                      800], // Set the color of the checkbox when it is checked.
                ),
                Text(
                    'Remember me'), // Create a Text widget to display the "Remember me" text.
                Spacer(), // Create a Spacer widget to push the remaining children to the right.
                TextButton(
                  // Create a TextButton widget.
                  onPressed:
                      () {}, // Define the onPressed callback for the button.
                  child: Text(
                    // Set the text of the button.
                    'Forgot password?',
                    style: TextStyle(
                        color: Colors.green[800]), // Style the button text.
                  ),
                ),
              ],
            ),
            SizedBox(
                height:
                    30), // Create a SizedBox widget with a height of 30 pixels.
            ElevatedButton(
              // Create an ElevatedButton widget for the login button.
              onPressed: () {
                // Define the onPressed callback for the button.
                Navigator.push(
                  // Navigate to the HomeScreen when the button is pressed.
                  context,
                  MaterialPageRoute(builder: (context) => HomeScreen()),
                );
              },
              style: ElevatedButton.styleFrom(
                // Style the button.
                backgroundColor: Colors
                    .green[600], // Set the background color of the button.
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
              child: Text('Login'), // Set the text of the button to "Login".
            ),
            SizedBox(
                height:
                    15), // Create a SizedBox widget with a height of 15 pixels.
            TextButton(
              // Create a TextButton widget for the signup link.
              onPressed: () {
                // Define the onPressed callback for the button.
                Navigator.push(
                  // Navigate to the SignupScreen when the button is pressed.
                  context,
                  MaterialPageRoute(builder: (context) => SignupScreen()),
                );
              },
              child: Text(
                // Set the text of the button.
                "Don't have an account? Sign up",
                style: TextStyle(
                    color: Colors.green[800]), // Style the button text.
              ),
            ),
          ],
        ),
      ),
    );
  }
}
