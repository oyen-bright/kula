// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  String get name {
    return "$firstName $lastName";
  }

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

  User copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    DateTime? dateOfBirth,
    String? email,
  }) {
    return User(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      dateOfBirth: dateOfBirth ?? this.dateOfBirth,
      email: email ?? this.email,
    );
  }
}
