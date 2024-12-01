import 'package:flutter/material.dart'; // Imports the Flutter Material package for UI components
import 'package:todol/screens/HomePage.dart'; // Imports the HomePage widget from the screens directory

void main() {
  runApp(const MyApp()); // The main function serves as the entry point of the application, executing the MyApp widget
}

class MyApp extends StatelessWidget { // Defines a stateless widget named MyApp
  const MyApp({super.key}); // Constructor for MyApp, allowing for an optional key parameter

  // This widget serves as the root of the application.
  @override
  Widget build(BuildContext context) {
    // The build method describes the part of the user interface represented by this widget
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // Disables the debug banner in the top right corner
      home: Homepage(), // Sets the Homepage widget as the default home screen of the application
    );
  }
}