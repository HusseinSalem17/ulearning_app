class RegisterResponseEntity {
  final String msg;

  RegisterResponseEntity({required this.msg});

  factory RegisterResponseEntity.fromJson(Map<String, dynamic> json) {
    return RegisterResponseEntity(
      msg: json['msg'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'msg': msg,
    };
  }
}
