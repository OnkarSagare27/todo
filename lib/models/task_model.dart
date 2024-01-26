class TaskModel {
  final int id;
  final String name;
  final String? description;
  final String status;

  TaskModel({
    required this.id,
    required this.status,
    required this.name,
    this.description,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'status': status,
    };
  }

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      status: json['status'],
    );
  }
}
