class TodoModel {
  late final int id;
  late final String title;
  late final String subTitle;
  final bool isCompleted;

  TodoModel({
    required this.id,
    required this.title,
    required this.subTitle,
    this.isCompleted = false,
  });
}
