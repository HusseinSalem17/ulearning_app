import 'package:udemy_app/pages/sign_in/models/user_item_model.dart';

class UserLoginResponseEntity {
  String? access_token;
  String? refresh_token;
  UserItem? user;

  UserLoginResponseEntity({
    this.access_token,
    this.refresh_token,
    this.user,
  });

  factory UserLoginResponseEntity.fromJson(Map<String, dynamic> json) {
    print('json: $json');
    return UserLoginResponseEntity(
      access_token: json["access_token"],
      refresh_token: json["refresh_token"],
      user: json["user"] != null ? UserItem.fromJson(json["user"]) : null,
    );
  }

  Map<String, dynamic> toJson() => {
        "access_token": access_token,
        "refresh_token": refresh_token,
        "user": user?.toJson(),
      };
}
