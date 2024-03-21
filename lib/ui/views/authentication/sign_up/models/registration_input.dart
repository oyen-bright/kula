class RegistrationInput {
  String? password;
  String? email;
  String? phoneNumber;
  String? firstName;
  String? lastName;

  bool validateInput() {
    return [password, email, phoneNumber, firstName, lastName]
        .every((element) => element != null && element.isNotEmpty);
  }
}
