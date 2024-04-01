class Restaurant {
  final String id;
  final String street;
  final String floorNumber;
  final String houseNumber;
  final String longitude;
  final String latitude;
  final bool isDefault;
  final String additionalInfo;
  Restaurant({
    required this.id,
    required this.isDefault,
    required this.street,
    required this.floorNumber,
    required this.houseNumber,
    required this.longitude,
    required this.latitude,
    required this.additionalInfo,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      isDefault: (json['is_default'] ?? 0) == 1 ? true : false,
      street: json['street'] ?? '',
      floorNumber: json['floor_number'] ?? '',
      houseNumber: json['house_number'] ?? '',
      longitude: json['longitude'] ?? '',
      latitude: json['latitude'] ?? '',
      additionalInfo: json['additional_info'] ?? '',
    );
  }

  String get getFormattedAddress {
    String formattedAddress = street;
    if (floorNumber.isNotEmpty) {
      formattedAddress += ', Floor $floorNumber';
    }
    if (houseNumber.isNotEmpty) {
      formattedAddress += ', House $houseNumber';
    }
    return formattedAddress;
  }
}
