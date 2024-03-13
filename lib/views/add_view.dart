import 'package:flutter/material.dart';

import '../controller/todo_controller.dart';
import '../utils/app_colors.dart';
import 'widgets/custom_text_field.dart';

class AddView extends StatelessWidget {
  final TodoController todoListNotifier;
  AddView({super.key, required this.todoListNotifier});

  final TextEditingController titleController = TextEditingController();

  final TextEditingController detailsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kWhite,
      appBar: AppBar(
        backgroundColor: AppColors.kPrimary,
        toolbarHeight: kToolbarHeight * 1.8,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: AppColors.kWhite,
          ),
        ),
        title: const Text(
          "Add Task",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: AppColors.kWhite,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                CustomTextField(
                  hintText: "Title",
                  controller: titleController,
                ),
                const SizedBox(
                  height: 30,
                ),
                CustomTextField(
                  hintText: "Detail",
                  controller: detailsController,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            height: 65,
            child: ElevatedButton(
              onPressed: () {
                todoListNotifier.addTodo(
                    titleController.text, detailsController.text);
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.kPrimary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: const Text(
                "ADD",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: AppColors.kWhite,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
