// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'meal_model.dart';

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
  final List<Meal>? meals;

  final String shortDescription;
  final double latitude;
  final double longitude;
  final String duration;
  final double averageRating;
  final int totalRatings;
  final String previewImage;

  final double distanceInMeters;

  Restaurant({
    required this.averageRating,
    required this.duration,
    required this.totalRatings,
    required this.previewImage,
    required this.id,
    required this.userId,
    required this.storeName,
    required this.storeAddress,
    this.meals,
    required this.storeEmail,
    required this.phoneNumber,
    this.phoneNumber2,
    required this.contactPerson,
    required this.minOrderAmount,
    required this.maxOrderAmount,
    required this.openingHours,
    required this.status,
    required this.shortDescription,
    required this.latitude,
    required this.longitude,
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
      openingHours: Map<String, String>.from((json['opening_hours'])),
      status: json['status'],
      averageRating: double.parse(json['average_rating'].toString()),
      totalRatings: json['total_ratings'],
      previewImage: json['preview_image'],
      shortDescription: json['short_description'],
      duration: json['duration'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
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
        distanceInMeters: 00,
        averageRating: 0,
        duration: 'duration',
        previewImage: 'previewImage',
        totalRatings: 0);
  }

  Restaurant copyWith({
    String? id,
    String? userId,
    String? storeName,
    String? storeAddress,
    String? storeEmail,
    String? phoneNumber,
    String? phoneNumber2,
    String? contactPerson,
    double? minOrderAmount,
    double? maxOrderAmount,
    Map<String, String>? openingHours,
    int? status,
    List<Meal>? meals,
    String? shortDescription,
    double? latitude,
    double? longitude,
    String? duration,
    double? averageRating,
    int? totalRatings,
    String? previewImage,
    double? distanceInMeters,
  }) {
    return Restaurant(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      storeName: storeName ?? this.storeName,
      storeAddress: storeAddress ?? this.storeAddress,
      storeEmail: storeEmail ?? this.storeEmail,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      phoneNumber2: phoneNumber2 ?? this.phoneNumber2,
      contactPerson: contactPerson ?? this.contactPerson,
      minOrderAmount: minOrderAmount ?? this.minOrderAmount,
      maxOrderAmount: maxOrderAmount ?? this.maxOrderAmount,
      openingHours: openingHours ?? this.openingHours,
      status: status ?? this.status,
      meals: meals ?? this.meals,
      shortDescription: shortDescription ?? this.shortDescription,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      duration: duration ?? this.duration,
      averageRating: averageRating ?? this.averageRating,
      totalRatings: totalRatings ?? this.totalRatings,
      previewImage: previewImage ?? this.previewImage,
      distanceInMeters: distanceInMeters ?? this.distanceInMeters,
    );
  }
}
