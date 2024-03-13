import 'package:flutter/material.dart';
import 'package:to_do_app/controller/todo_controller.dart';

import '../../utils/app_colors.dart';

class CompletedScreen extends StatelessWidget {
  final TodoController todoListNotifier;
  const CompletedScreen({super.key, required this.todoListNotifier});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: todoListNotifier,
      builder: (BuildContext context, todoList, Widget? child) {
        var completedTodo = todoList.where((todo) => todo.isCompleted).toList();
        return ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
              child: ListTile(
                title: Text(
                  completedTodo[index].title,
                  style: const TextStyle(
                      color: AppColors.kTodoTitle,
                      fontSize: 13,
                      fontWeight: FontWeight.w600),
                ),
                subtitle: Text(
                  completedTodo[index].subTitle,
                  style: const TextStyle(fontSize: 10),
                ),
                tileColor: AppColors.kWhite,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                contentPadding: const EdgeInsets.all(15),
              ),
            );
          },
          itemCount: completedTodo.length,
        );
      },
    );
  }
}
