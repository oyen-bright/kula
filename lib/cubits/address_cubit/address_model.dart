class Address {
  final String street;
  final String floorNumber;
  final String houseNumber;
  final String longitude;
  final String latitude;
  final String additionalInfo;
  Address({
    required this.street,
    required this.floorNumber,
    required this.houseNumber,
    required this.longitude,
    required this.latitude,
    required this.additionalInfo,
  });

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
      street: json['street'] ?? '',
      floorNumber: json['floor_number'] ?? '',
      houseNumber: json['house_number'] ?? '',
      longitude: json['longitude'] ?? '',
      latitude: json['latitude'] ?? '',
      additionalInfo: json['additional_info'] ?? '',
    );
  }
}
