class UserItem {
  int? id;
  String? name;
  String? email;
  String? avatar;
  String? open_id;
  int? type;
  String? verified_at;
  String? created_at;
  String? updated_at;

  UserItem({
    this.id,
    this.name,
    this.email,
    this.avatar,
    this.open_id,
    this.type,
    this.verified_at,
    this.created_at,
    this.updated_at,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        avatar: json["avatar"],
        open_id: json["open_id"],
        type: json["type"],
        verified_at: json["verified_at"],
        created_at: json["created_at"],
        updated_at: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        "open_id": open_id,
        "type": type,
        "verified_at": verified_at,
        "created_at": created_at,
        "updated_at": updated_at,
      };
}
