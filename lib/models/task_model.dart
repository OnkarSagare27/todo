class TaskModel {
  final int id;
  final String name;
  final String? description;
  final String status;
  final List<dynamic> argb;

  TaskModel({
    required this.id,
    required this.status,
    required this.name,
    required this.argb,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
      'argb': argb
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
        id: json['id'],
        name: json['name'],
        description: json['description'],
        status: json['status'],
        argb: json['argb']);
  }
}
