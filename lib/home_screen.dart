import 'package:flutter/material.dart'; // Import the Flutter Material library for UI elements.
import 'package:image_picker/image_picker.dart'; // Import the image_picker package to access device camera and gallery.
import 'selected_images_screen.dart'; // Import the SelectedImagesScreen widget.

class HomeScreen extends StatefulWidget {
  // Define a stateful widget called HomeScreen.
  @override
  _HomeScreenState createState() =>
      _HomeScreenState(); // Create the state object for the widget.
}

class _HomeScreenState extends State<HomeScreen> {
  // Define the state class for the HomeScreen widget.
  List<String> selectedImages =
      []; // A list to store the paths of selected images.

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
        leading: Icon(Icons.eco,
            color: Colors.green[800]), // Set the leading icon of the AppBar.
        actions: [
          // Define the actions to be displayed on the right side of the AppBar.
          Icon(Icons.notifications_none,
              color:
                  Colors.green[800]), // Add a notification icon to the AppBar.
          Icon(Icons.settings,
              color: Colors.green[800]), // Add a settings icon to the AppBar.
        ],
      ),
      backgroundColor:
          Color(0xFFCCEECC), // Set the background color of the Scaffold.
      body: Padding(
        // Add padding around the child widget.
        padding: const EdgeInsets.all(
            20.0), // Set the padding value to 20 pixels on all sides.
        child: Column(
          // Create a Column widget to arrange its children vertically.
          crossAxisAlignment: CrossAxisAlignment
              .start, // Align children to the start of the cross axis.
          children: [
            // Define the children of the Column widget.
            Text(
              // Create a Text widget to display the "Crops" title.
              'Crops',
              style: TextStyle(
                // Style the text.
                fontSize: 24, // Set the font size.
                fontWeight: FontWeight.bold, // Set the font weight to bold.
                color: Colors.green[800], // Set the color of the text.
              ),
            ),
            SizedBox(
                height:
                    15), // Create a SizedBox widget with a height of 15 pixels.
            Center(
              // Center its child horizontally.
              child:
                  _buildScanButton(), // Build and display the Scan Now button.
            ),
            SizedBox(
                height:
                    20), // Create a SizedBox widget with a height of 20 pixels.
            Expanded(
              // Expand to fill the available space in the Column.
              child: GridView.count(
                // Create a GridView with a fixed number of columns.
                crossAxisCount: 2, // Set the number of columns to 2.
                crossAxisSpacing: 20, // Set the spacing between columns.
                mainAxisSpacing: 20, // Set the spacing between rows.
                children: [
                  // Define the children of the GridView.
                  _buildGridItem('Apple Leaves',
                      'images/apple_leaves.jpg'), // Build a grid item for Apple Leaves.
                  _buildGridItem('Oranges Leaves',
                      'images/orange_leaves.jpg'), // Build a grid item for Oranges Leaves.
                  _buildGridItem('Cherry Leaves',
                      'images/cherry_leaves.jpg'), // Build a grid item for Cherry Leaves.
                  _buildGridItem('Lemon Leaves',
                      'images/lemon_leaves.jpg'), // Build a grid item for Lemon Leaves.
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        // Add a BottomNavigationBar to the Scaffold.
        backgroundColor: Color(
            0xFFCCEECC), // Set the background color of the BottomNavigationBar.
        selectedItemColor:
            Colors.green[800], // Set the color of the selected item.
        unselectedItemColor:
            Colors.green[800], // Set the color of unselected items.
        showSelectedLabels: false, // Hide the labels of selected items.
        showUnselectedLabels: false, // Hide the labels of unselected items.
        type: BottomNavigationBarType
            .fixed, // Display all items in the BottomNavigationBar without shifting.
        items: [
          // Define the items of the BottomNavigationBar.
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home'), // Add a Home item to the BottomNavigationBar.
          BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: 'Search'), // Add a Search item to the BottomNavigationBar.
          BottomNavigationBarItem(
            // Add a Scan item to the BottomNavigationBar.
            icon: Container(
              // Wrap the icon in a Container to add padding and background.
              padding: EdgeInsets.all(10), // Add padding around the icon.
              decoration: BoxDecoration(
                // Add a BoxDecoration to the Container.
                color: Colors
                    .green[100], // Set the background color of the Container.
                borderRadius: BorderRadius.circular(
                    20), // Add rounded corners to the Container.
              ),
              child: IconButton(
                // Use IconButton for tap functionality.
                icon: Icon(Icons.camera_alt,
                    color: Colors.green[800]), // Set the icon for the button.
                onPressed: () {
                  // Define the onPressed callback for the button.
                  _takePicture(ImageSource
                      .camera); // Take a picture using the device camera.
                },
              ),
            ),
            label: 'Scan',
          ),
          BottomNavigationBarItem(
            // Add a Stats item to the BottomNavigationBar.
            icon: IconButton(
              // Use IconButton for tap functionality.
              icon: Icon(Icons.bar_chart), // Set the icon for the button.
              onPressed: () {
                // Define the onPressed callback for the button.
                Navigator.push(
                  // Navigate to SelectedImagesScreen when the button is pressed.
                  context,
                  MaterialPageRoute(
                    builder: (context) => SelectedImagesScreen(
                        images:
                            selectedImages), // Pass the selected images to the next screen.
                  ),
                );
              },
            ),
            label: 'Stats',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label:
                  'Profile'), // Add a Profile item to the BottomNavigationBar.
        ],
      ),
    );
  }

  Widget _buildScanButton() {
    // A helper method to build the "Scan Now" button.
    return ElevatedButton(
      onPressed: () async {
        // Define the onPressed callback for the button.
        final ImagePicker picker =
            ImagePicker(); // Create an ImagePicker instance.
        final XFile? image = await picker.pickImage(
            source:
                ImageSource.gallery); // Pick an image from the device gallery.

        if (image != null) {
          // Check if an image was selected.
          setState(() {
            // Update the state of the widget.
            selectedImages.add(
                image.path); // Add the path of the selected image to the list.
          });
          print(
              'Image path: ${image.path}'); // Print the image path to the console.
        } else {
          print(
              'No image selected.'); // Print a message to the console if no image was selected.
        }
      },
      style: ElevatedButton.styleFrom(
        // Style the button.
        foregroundColor:
            Colors.green[800], // Set the foreground color (text) of the button.
        backgroundColor:
            Colors.green[100], // Set the background color of the button.
        textStyle: TextStyle(
            fontWeight: FontWeight.bold), // Set the text style of the button.
        padding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 10), // Set the padding of the button.
        shape: RoundedRectangleBorder(
          // Set the shape of the button.
          borderRadius:
              BorderRadius.circular(20), // Add rounded corners to the button.
        ),
      ),
      child: Text('Scan Now'), // Set the text of the button to "Scan Now".
    );
  }

  Widget _buildGridItem(String title, String imagePath) {
    // A helper method to build grid items.
    return Card(
      // Create a Card widget to display each grid item.
      elevation: 0, // Set the elevation of the card to 0 (no shadow).
      color: Colors.white, // Set the background color of the card.
      shape: RoundedRectangleBorder(
        // Set the shape of the card.
        borderRadius:
            BorderRadius.circular(20), // Add rounded corners to the card.
      ),
      child: Column(
        // Use a Column to arrange the image and text vertically.
        mainAxisAlignment: MainAxisAlignment
            .center, // Center the children of the Column vertically.
        children: [
          // Define the children of the Column widget.
          Expanded(
            // Expand to fill the available space in the Column.
            child: ClipRRect(
              // Clip the child widget to a rounded rectangle.
              borderRadius: BorderRadius.only(
                // Define the rounded corners.
                topLeft: Radius.circular(
                    20), // Add a rounded corner to the top-left of the image.
                topRight: Radius.circular(
                    20), // Add a rounded corner to the top-right of the image.
              ),
              child: Image.asset(
                // Display the image from assets.
                imagePath,
                fit: BoxFit.cover, // Cover the entire widget with the image.
              ),
            ),
          ),
          Padding(
            // Add padding around the text widget.
            padding: const EdgeInsets.all(
                10.0), // Set the padding value to 10 pixels on all sides.
            child: Row(
              // Use a Row to arrange the title and circle indicator horizontally.
              mainAxisAlignment: MainAxisAlignment
                  .spaceBetween, // Align children to the start and end of the main axis.
              children: [
                // Define the children of the Row widget.
                Text(
                  // Display the title of the grid item.
                  title,
                  style: TextStyle(
                    // Style the text.
                    fontWeight: FontWeight.bold, // Set the font weight to bold.
                    color: Colors.green[800], // Set the color of the text.
                  ),
                ),
                Container(
                  // Create a circular indicator.
                  width: 25, // Set the width of the circle.
                  height: 25, // Set the height of the circle.
                  decoration: BoxDecoration(
                    // Add a BoxDecoration to the Container.
                    color: Colors
                        .green[200], // Set the background color of the circle.
                    borderRadius: BorderRadius.circular(
                        12.5), // Make the container circular.
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _takePicture(ImageSource source) async {
    // A helper method to take a picture using the device camera or gallery.
    final ImagePicker picker = ImagePicker(); // Create an ImagePicker instance.
    final XFile? image = await picker.pickImage(
        source: source); // Pick an image from the specified source.

    if (image != null) {
      // Check if an image was selected.
      setState(() {
        // Update the state of the widget.
        selectedImages
            .add(image.path); // Add the path of the selected image to the list.
      });
      print(
          'Image path: ${image.path}'); // Print the image path to the console.
    } else {
      print(
          'No image selected.'); // Print a message to the console if no image was selected.
    }
  }
}
