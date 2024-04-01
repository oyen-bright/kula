import 'dart:convert';

class Restaurant {
  final String id;
  final String userId;
  final String storeName;
  final String storeAddress;
  final String storeEmail;
  final String phoneNumber;
  final String? phoneNumber2;
  final String contactPerson;
  final double minOrderAmount;
  final double maxOrderAmount;
  final Map<String, String> openingHours;
  final int status;
  final DateTime? approvedAt;
  final String shortDescription;
  final double latitude;
  final double longitude;
  final String lgaId;
  final String stateId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final double distanceInMeters;

  Restaurant({
    required this.id,
    required this.userId,
    required this.storeName,
    required this.storeAddress,
    required this.storeEmail,
    required this.phoneNumber,
    this.phoneNumber2,
    required this.contactPerson,
    required this.minOrderAmount,
    required this.maxOrderAmount,
    required this.openingHours,
    required this.status,
    this.approvedAt,
    required this.shortDescription,
    required this.latitude,
    required this.longitude,
    required this.lgaId,
    required this.stateId,
    required this.createdAt,
    required this.updatedAt,
    required this.distanceInMeters,
  });

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['id'],
      userId: json['user_id'],
      storeName: json['store_name'],
      storeAddress: json['store_address'],
      storeEmail: json['store_email'],
      phoneNumber: json['phone_number'],
      phoneNumber2: json['phone_number_2'],
      contactPerson: json['contact_person'],
      minOrderAmount: double.parse(json['min_order_amount']),
      maxOrderAmount: double.parse(json['max_order_amount']),
      openingHours: Map<String, String>.from(jsonDecode(json['opening_hours'])),
      status: json['status'],
      approvedAt: json['approved_at'] != null
          ? DateTime.parse(json['approved_at'])
          : null,
      shortDescription: json['short_description'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      lgaId: json['lga_id'],
      stateId: json['state_id'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      distanceInMeters: json['distance_in_meters'],
    );
  }

  static Restaurant get dummy {
    return Restaurant(
        id: "id",
        userId: "userId",
        storeName: "StoreName",
        storeAddress: "storeAddress",
        storeEmail: "storeEmail",
        phoneNumber: "phoneNumber",
        contactPerson: "contactPerson",
        minOrderAmount: 0,
        maxOrderAmount: 0,
        openingHours: {},
        status: 0,
        shortDescription: "shortDescription",
        latitude: 00,
        longitude: 00,
        lgaId: "lgaId",
        stateId: "stateId",
        createdAt: DateTime.now(),
        updatedAt: DateTime.timestamp(),
        distanceInMeters: 00);
  }
}
