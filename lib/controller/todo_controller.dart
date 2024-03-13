import 'package:flutter/material.dart';

import '../models/todo_model.dart';

class TodoController extends ValueNotifier<List<TodoModel>> {
  TodoController(super.value);

// Adds a new to-do item to the list.
// The new to-do item's id is set to one more than the last item's id in the list,
// ensuring a unique identifier for each to-do item.
// If the list is empty, the first item's id starts at 1.
  void addTodo(String title, String subtitle) {
    // Calculate the id for the new to-do item.
    final val = value.isEmpty ? 1 : value.last.id + 1;
    // Add the new to-do item to the list and notify all the listeners about the update.
    value = [...value, TodoModel(id: val, title: title, subTitle: subtitle)];
  }

// Deletes a to-do item from the list by its id.
  void deletTodo(int id) {
    // Remove the to-do item with the matching id from the list and notify listeners.
    value = value.where((todo) => todo.id != id).toList();
  }

// Edits an existing to-do item's title and subtitle based on its id.
  void editTodo(int id, String newTitle, String newSubtitle) {
    // Find the index of the to-do item by id.
    int todoIndex = value.indexWhere((todo) => todo.id == id);
    if (todoIndex != -1) {
      // Check if the to-do item exists in the list.
      final todo = value[todoIndex];
      // Create a new TodoModel with the updated title and subtitle while preserving other fields.
      final editedTodo = TodoModel(
          id: id,
          title: newTitle,
          subTitle: newSubtitle,
          isCompleted: todo.isCompleted);
      // Replace the old to-do item with the edited one in the list.
      value[todoIndex] = editedTodo;
      // Notify all the listeners that the to-do list has been modified.
      notifyListeners();
    }
  }

// Toggles the completion status of a to-do item by its id.
  void toggleTodoStatus(int id) {
    // Iterate over the to-do list, toggling the completion status of the item with the matching id,
    // while keeping other items unchanged. Then, update the list and notify listeners.
    value = value.map((todo) {
      if (todo.id == id) {
        // Check if this is the to-do item to be toggled.
        return TodoModel(
            id: todo.id,
            title: todo.title,
            subTitle: todo.subTitle,
            isCompleted: !todo.isCompleted); // Toggle completion status.
      }
      return todo; // Keep other to-do items unchanged.
    }).toList();
  }
}
