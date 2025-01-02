//api post response msg

class LoginRequestEntity {
  String? email;
  String? password;

  LoginRequestEntity({
    this.email,
    this.password,
  });

  Map<String, dynamic> toJson() => {
        "email": email,
        "password": password,
      };
}
