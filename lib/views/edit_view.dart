import 'package:flutter/material.dart';
import 'package:to_do_app/models/todo_model.dart';

import '../controller/todo_controller.dart';
import '../utils/app_colors.dart';
import 'widgets/custom_text_field.dart';

class EditView extends StatefulWidget {
  final TodoController todoListNotifier;
  final TodoModel todo;
  const EditView(
      {super.key, required this.todoListNotifier, required this.todo});

  @override
  State<EditView> createState() => _EditViewState();
}

class _EditViewState extends State<EditView> {
  late final TextEditingController titleController;
  late final TextEditingController detailsController;

  @override
  void initState() {
    titleController = TextEditingController(text: widget.todo.title);
    detailsController = TextEditingController(text: widget.todo.subTitle);
    super.initState();
  }

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
          "Edit Task",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 10, right: 20),
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      widget.todoListNotifier.editTodo(widget.todo.id,
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
                      "Update",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 10),
                  height: 65,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.kPrimary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    child: const Text(
                      "Cancel",
                      style: TextStyle(
                        fontSize: 18,
                        color: AppColors.kWhite,
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
