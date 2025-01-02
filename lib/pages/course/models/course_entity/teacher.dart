class Teacher {
  int? id;
  String? avatar;
  int? type;
  String? openId;
  String? name;
  String? email;
  dynamic verifiedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  Teacher({
    this.id,
    this.avatar,
    this.type,
    this.openId,
    this.name,
    this.email,
    this.verifiedAt,
    this.createdAt,
    this.updatedAt,
  });

  factory Teacher.fromJson(Map<String, dynamic> json) => Teacher(
        id: json['id'] as int?,
        avatar: json['avatar'] as String?,
        type: json['type'] as int?,
        openId: json['open_id'] as String?,
        name: json['name'] as String?,
        email: json['email'] as String?,
        verifiedAt: json['verified_at'] as dynamic,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        updatedAt: json['updated_at'] == null
            ? null
            : DateTime.parse(json['updated_at'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'avatar': avatar,
        'type': type,
        'open_id': openId,
        'name': name,
        'email': email,
        'verified_at': verifiedAt,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
}
