import '../restaurant_cubit/meal_model.dart';

class CartItem {
  final String cartItemId;
  final Meal meal;
  final List<dynamic> mealOptionSelected;
  final List<dynamic> mealExtras;
  final int quantity;
  final String totalAmount;
  final dynamic additionalInformation;

  CartItem({
    required this.cartItemId,
    required this.meal,
    required this.mealOptionSelected,
    required this.mealExtras,
    required this.quantity,
    required this.totalAmount,
    required this.additionalInformation,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartItemId: json['cart_item_id'],
      meal: Meal.fromJson(json['meal']),
      mealOptionSelected: json['meal_option_selected'],
      mealExtras: json['meal_extras'],
      quantity: json['quantity'],
      totalAmount: json['total_amount'],
      additionalInformation: json['additional_information'],
    );
  }

  static CartItem get dummy {
    return CartItem(
        cartItemId: "cartItemId",
        meal: Meal.dummy,
        mealOptionSelected: [],
        mealExtras: [],
        quantity: 0,
        totalAmount: "0.0",
        additionalInformation: "additionalInformation");
  }
}
