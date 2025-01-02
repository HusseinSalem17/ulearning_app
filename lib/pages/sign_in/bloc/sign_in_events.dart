abstract class SignInEvent {
  const SignInEvent();
}

class EmailEvent extends SignInEvent {
  final String email;
  const EmailEvent(this.email);
}

class PasswordlEvent extends SignInEvent {
  final String password;
  const PasswordlEvent(this.password);
}
