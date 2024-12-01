import 'package:flutter/material.dart'; // Imports the Flutter Material package for UI components
import 'ToDoList.dart'; // Imports the ToDoList widget from the ToDoList file

// Defines a stateful widget named Homepage
class Homepage extends StatefulWidget {
  const Homepage({super.key}); // Constructor for Homepage, allowing for an optional key parameter

  @override
  State<Homepage> createState() => _HomepageState(); // Creates the state for the Homepage widget
}

// Defines the state class for Homepage
class _HomepageState extends State<Homepage> {
  final _controller = TextEditingController(); // Creates a TextEditingController to manage input from the text field
  List toDoList = [ // Initializes a list to hold the tasks, with each task represented as a list containing a name and completion status
    ["hello", false],
    ["hello world", true],
    ["hey", false]
  ];

  // Method to toggle the completion status of a task
  void checkBoxChanged(int index) {
    setState(() { // Calls setState to update the UI
      toDoList[index][1] = !toDoList[index][1]; // Toggles the completion status of the task at the given index
    });
  }

  // Method to delete a task from the list
  void deleteTask(int index) {
    setState(() { // Calls setState to update the UI
      toDoList.removeAt(index); // Removes the task at the specified index from the toDoList
    });
  }

  // Method to save a new task entered in the text field
  void saveNewTask() {
    setState(() { // Calls setState to update the UI
      toDoList.add([_controller.text, false]); // Adds a new task to the toDoList with the text from the controller and sets its status to false
      _controller.clear(); // Clears the text field after saving the task
    });
  }

  @override
  Widget build(BuildContext context) {
    // Builds the UI for the Homepage widget
    return Scaffold(
      backgroundColor: Colors.black, // Sets the background color of the scaffold
      appBar: AppBar(
        title: const Text("MY TO DO LIST"), // Sets the title of the app bar
        backgroundColor: Color(0xFF00796B), // Sets the background color of the app bar
        foregroundColor: Colors.white, // Sets the color of the title text
      ),
      body: ListView.builder(
        itemCount: toDoList.length, // Sets the number of items in the list
        itemBuilder: (BuildContext context, index) { // Builds each item in the list
          return ToDolist(
            taskName: toDoList[index][0], // Passes the task name to the ToDolist widget
            taskCompleted: toDoList[index][1], // Passes the task completion status to the ToDolist widget
            onChanged: (p0) => checkBoxChanged(index), // Calls checkBoxChanged when the checkbox is toggled
            deleteFunction: (p0) => deleteTask(index), // Calls deleteTask when the delete action is triggered
          );
        },
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20), // Adds horizontal padding around the row
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20), // Adds horizontal padding around the text field
                child: TextField(
                  controller: _controller, // Sets the controller for the text field
                  decoration: InputDecoration(
                    hintText: "NEW TASK", // Sets the hint text for the text field
                    filled: true, // Indicates that the text field should be filled
                    fillColor: Colors.cyanAccent, // Sets the fill color of the text field
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white), // Sets the border color when the text field is enabled
                      borderRadius: BorderRadius.circular(15), // Sets the border radius of the text field
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.white), // Sets the border color when the text field is focused
                      borderRadius: BorderRadius.circular(15), // Sets the border radius of the text field
                    ),
                  ),
                ),
              ),
            ),
            FloatingActionButton(
              onPressed: saveNewTask, // Calls saveNewTask when the button is pressed
              child: const Icon(Icons.add), // Displays an add icon on the button
            )
          ],
        ),
      ),
    );
  }
}