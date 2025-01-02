class RegisterRequestEntity {
  int? type;
  String? name;
  String? description;
  String? email;
  String? phone;
  String? avatar;
  String? open_id;
  int? online;
  String? password;

  RegisterRequestEntity({
    this.type,
    this.name,
    this.description,
    this.email,
    this.phone,
    this.avatar,
    this.open_id,
    this.online,
    this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      if (type != null) 'type': type,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (avatar != null) 'avatar': avatar,
      if (open_id != null) 'open_id': open_id,
      if (online != null) 'online': online,
      if (password != null) 'password': password,
    };
  }
}
