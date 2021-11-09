class TodoModel {
  String text;
  bool done;

  TodoModel({
    required this.text,
    this.done = false,
  });

  factory TodoModel.fromJson(Map<String, dynamic> json) => TodoModel(
        text: json["text"],
        done: json["done"],
      );

  Map<String, dynamic> toJson() => {
        "text": text,
        "done": done,
      };
}
