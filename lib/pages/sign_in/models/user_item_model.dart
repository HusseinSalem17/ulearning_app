class UserItem {
  int? id;
  String? name;
  String? email;
  String? avatar;
  // String? open_id;
  // int? type;
  // String? verified_at;
  // String? created_at;
  // String? updated_at;

  UserItem({
    this.id,
    this.name,
    this.email,
    this.avatar,
    // this.open_id,
    // this.type,
    // this.verified_at,
    // this.created_at,
    // this.updated_at,
  });

  factory UserItem.fromJson(Map<String, dynamic> json) => UserItem(
        id: json["id"] as int?,
        name: json["name"] as String?,
        email: json["email"] as String?,
        avatar: json["avatar"] as String?,
        // open_id: json["open_id"] as String?,
        // type: json["type"] as int?,
        // verified_at: json["verified_at"] as String?,
        // created_at: json["created_at"] as String?,
        // updated_at: json["updated_at"] as String?,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "email": email,
        "avatar": avatar,
        // "open_id": open_id,
        // "type": type,
        // "verified_at": verified_at,
        // "created_at": created_at,
        // "updated_at": updated_at,
      };
}
