class Note {
  final int? id;
  String title;
  String description;
  final String? created_at;
  String? updated_at;
  final int? isDeleted;

  Note({
    this.id,
    required this.title,
    required this.description,
    this.created_at,
    this.updated_at,
    this.isDeleted = 0,
  });

  Note copyWith({
    int? id,
    String? title,
    String? description,
    String? created_at,
    String? updated_at,
    int? isDeleted,
  }) {
    return Note(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      created_at: created_at ?? this.created_at,
      updated_at: updated_at ?? this.updated_at,
      isDeleted: isDeleted ?? this.isDeleted,
    );
  }

  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
        isDeleted: json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "created_at": created_at,
        "updated_at": updated_at,
        "isDeleted": isDeleted,
      };
}
