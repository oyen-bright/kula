class RestaurantReviewM {
  final String id;
  final String vendorId;
  final String mealId;
  final String userId;
  final int rating;
  final String review;

  RestaurantReviewM({
    required this.id,
    required this.vendorId,
    required this.mealId,
    required this.userId,
    required this.rating,
    required this.review,
  });

  factory RestaurantReviewM.fromJson(Map<String, dynamic> json) {
    return RestaurantReviewM(
      id: json['id'],
      vendorId: json['vendor_id'],
      mealId: json['meal_id'],
      userId: json['user_id'],
      rating: json['rating'],
      review: json['review'],
    );
  }

  static RestaurantReviewM get dummy {
    return RestaurantReviewM(
        id: "id",
        vendorId: 'vendorId',
        mealId: 'mealId',
        userId: 'userId',
        rating: 0,
        review: 'review');
  }
}
