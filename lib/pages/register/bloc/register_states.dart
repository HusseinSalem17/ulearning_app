class RegisterStates {
  final String userName;
  final String email;
  final String password;
  final String rePassword;

// Optional Named Parameters
  const RegisterStates({
    this.userName = "",
    this.email = "",
    this.password = "",
    this.rePassword = "",
  });
  RegisterStates copyWith({
    String? userName,
    String? email,
    String? password,
    String? rePassword,
  }) {
    return RegisterStates(
      userName: userName ?? this.userName,
      email: email ?? this.email,
      password: password ?? this.password,
      rePassword: rePassword ?? this.rePassword,
    );
  }
}
//thread safe
