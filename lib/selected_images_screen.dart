import 'dart:io'; // Import the dart:io library for working with files.
import 'package:flutter/material.dart'; // Import the Flutter Material library for UI elements.

class SelectedImagesScreen extends StatelessWidget {
  // Define a stateless widget called SelectedImagesScreen.
  final List<String> images; // A list to store the paths of selected images.

  SelectedImagesScreen(
      {required this.images}); // Constructor to receive the list of images.

  @override
  Widget build(BuildContext context) {
    // Build method to construct the UI.
    return Scaffold(
      // Create a Scaffold widget to provide basic app structure.
      appBar: AppBar(
        // Create an AppBar widget.
        title: Text('Selected Images'), // Set the title of the AppBar.
        backgroundColor:
            Color(0xFFCCEECC), // Set the background color of the AppBar.
      ),
      backgroundColor:
          Color(0xFFCCEECC), // Set the background color of the Scaffold.
      body: GridView.builder(
        // Create a GridView using a builder to dynamically create items.
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          // Define the grid delegate for the GridView.
          crossAxisCount: 2, // Set the number of columns to 2.
        ),
        itemCount: images
            .length, // Set the number of items in the GridView to the length of the images list.
        itemBuilder: (context, index) {
          // Define the itemBuilder function to build each item in the GridView.
          return GestureDetector(
            // Wrap the image with a GestureDetector to detect taps.
            onTap: () {
              // Define the onTap callback for the GestureDetector.
              print(
                  'Image ${index + 1} clicked!'); // Print the index of the tapped image.
              _showImageDialog(
                  context,
                  images[
                      index]); // Show the image dialog when an image is tapped.
            },
            child: Image.file(
                File(images[index])), // Display the image from the file path.
          );
        },
      ),
    );
  }

  void _showImageDialog(BuildContext context, String imagePath) {
    // A helper method to show the selected image in a dialog.
    showDialog(
      // Show a dialog.
      context: context, // Provide the current BuildContext.
      builder: (BuildContext context) {
        // Define the builder function for the dialog.
        return Dialog(
          // Create a Dialog widget.
          child: Container(
            // Use a Container to hold the image.
            width: MediaQuery.of(context).size.width *
                0.8, // Set the width of the image container to 80% of the screen width.
            height: MediaQuery.of(context).size.height *
                0.8, // Set the height of the image container to 80% of the screen height.
            child: Image.file(
                File(imagePath)), // Display the image from the file path.
          ),
        );
      },
    );
  }
}
