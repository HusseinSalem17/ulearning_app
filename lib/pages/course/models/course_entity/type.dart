class Type {
  int? id;
  String? name;
  String? title;
  String? description;
  dynamic order;
  DateTime? createdAt;
  DateTime? updatedAt;

  Type({
    this.id,
    this.name,
    this.title,
    this.description,
    this.order,
    this.createdAt,
    this.updatedAt,
  });

  factory Type.fromJson(Map<String, dynamic> json) => Type(
        id: json['id'] as int?,
        name: json['name'] as String?,
        title: json['title'] as String?,
        description: json['description'] as String?,
        order: json['order'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'title': title,
        'description': description,
        'order': order,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
