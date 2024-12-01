import 'package:flutter/material.dart'; // Imports the Flutter Material package for UI components
import 'package:flutter_slidable/flutter_slidable.dart'; // Imports the Flutter Slidable package for swipeable list items

// Defines a stateless widget named ToDolist
class ToDolist extends StatelessWidget {
  // Constructor for ToDolist, requiring taskName, taskCompleted, onChanged, and deleteFunction parameters
  const ToDolist({
    super.key,
    required this.taskName, // The name of the task
    required this.taskCompleted, // The completion status of the task
    required this.onChanged, // Callback function for when the checkbox is changed
    required this.deleteFunction, // Callback function for when the delete action is triggered
  });

  // Declares the properties of the ToDolist widget
  final String taskName; // The name of the task
  final bool taskCompleted; // Indicates whether the task is completed
  final Function(bool?)? onChanged; // Function to be called when the checkbox state changes
  final Function(BuildContext)? deleteFunction; // Function to be called when the delete action is triggered

  @override
  Widget build(BuildContext context) {
    // Builds the UI for the ToDolist widget
    return Padding(
      // Adds padding around the widget
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Slidable(
        // Wraps the content in a Slidable widget to allow swipe actions
        endActionPane: ActionPane(
          // Defines the action pane that appears when the item is swiped
          motion: const StretchMotion(), // Sets the motion effect of the sliding action
          children: [
            SlidableAction(
              // Defines the action that can be performed (in this case, delete)
              onPressed: deleteFunction, // Calls the delete function when the action is triggered
              icon: Icons.delete,// Icon to represent the delete action
              backgroundColor: Colors.red,
              borderRadius: BorderRadius.circular(15), // Sets the border radius for the action button
            )
          ],
        ),
        child: Container(
          // Container to hold the task item
          padding: const EdgeInsets.all(20), // Adds padding inside the container
          decoration: BoxDecoration(
            // Sets the decoration for the container
            color: Colors.grey[800], // Background color of the container
            borderRadius: BorderRadius.circular(15), // Rounds the corners of the container
          ),
          child: Row(
            // Arranges the checkbox and task name in a horizontal row
            children: [
              Checkbox(
                // Checkbox widget to indicate task completion
                value: taskCompleted, // Sets the current state of the checkbox
                onChanged: onChanged, // Calls the onChanged function when the checkbox is toggled
                checkColor: Colors.black, // Color of the check mark
                activeColor: Color(0xFF4CAF50), // Color of the checkbox when active
                side: const BorderSide(
                  color: Color(0xFF00796B), // Border color of the checkbox
                ),
              ),
              Text(
                // Displays the task name
                taskName, // The name of the task
                style: TextStyle(
                  color: Colors.white, // Text color
                  fontSize: 18, // Font size
                  decoration: taskCompleted ? TextDecoration.lineThrough : TextDecoration.none, // Strikethrough if the task is completed
                  decorationColor: Colors.grey, // Color of the strikethrough line
                  decorationThickness: 2, // Thickness of the strikethrough line
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}