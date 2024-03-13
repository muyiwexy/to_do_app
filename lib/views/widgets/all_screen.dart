import 'package:flutter/material.dart';
import 'package:to_do_app/controller/todo_controller.dart';
import 'package:to_do_app/models/todo_model.dart';
import 'package:to_do_app/views/edit_view.dart';

import '../../utils/app_colors.dart';

class AllScreen extends StatelessWidget {
  final TodoController todoListNotifier;
  const AllScreen({super.key, required this.todoListNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<List<TodoModel>>(
      valueListenable: todoListNotifier,
      builder: (BuildContext context, todoList, Widget? child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final todo = todoList[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: ListTile(
                title: Text(
                  todo.title,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: AppColors.kTodoTitle,
                    fontSize: 13,
                    fontWeight: FontWeight.w600,
                    decoration:
                        todo.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                subtitle: Text(
                  todo.subTitle,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 10,
                    decoration:
                        todo.isCompleted ? TextDecoration.lineThrough : null,
                  ),
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    todoOptions(AppColors.kTodoOptions, () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EditView(
                            todoListNotifier: todoListNotifier,
                            todo: todo,
                          ),
                        ),
                      );
                    }, Icons.mode_edit_outline_outlined),
                    todoOptions(AppColors.kTodoOptions, () {
                      todoListNotifier.deletTodo(todo.id);
                    }, Icons.delete_rounded),
                    todoOptions(AppColors.kTodoOptions, () {
                      todoListNotifier.toggleTodoStatus(todo.id);
                    },
                        todo.isCompleted
                            ? Icons.close
                            : Icons.check_circle_outline_sharp),
                  ],
                ),
                tileColor: AppColors.kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.all(15),
              ),
            );
          },
          itemCount: todoList.length,
        );
      },
    );
  }

  IconButton todoOptions(Color color, Function() onPressed, IconData icon) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(
        icon,
        color: color,
      ),
    );
  }
}
