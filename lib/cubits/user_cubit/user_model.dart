class User {
  String firstName;
  String lastName;
  String phoneNumber;
  DateTime dateOfBirth;
  String email;
  bool acceptTerms;
  bool privacyPolicy;
  bool emailVerified;
  bool phoneVerified;
  String password;

  User({
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
    required this.acceptTerms,
    required this.privacyPolicy,
    required this.emailVerified,
    required this.phoneVerified,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      email: json['email'],
      acceptTerms: json['accept_terms'],
      privacyPolicy: json['privacy_policy'],
      emailVerified: json['email_verified'],
      phoneVerified: json['phone_verified'],
      password: json['password'],
    );
  }
}
