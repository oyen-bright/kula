class User {
  String id;
  String firstName;
  String lastName;
  String phoneNumber;
  DateTime dateOfBirth;
  String email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.dateOfBirth,
    required this.email,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      phoneNumber: json['phone_number'],
      dateOfBirth: DateTime.parse(json['date_of_birth']),
      email: json['email'],
    );
  }
}
