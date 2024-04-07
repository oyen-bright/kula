// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Map<String, dynamic> toAddToCartMap() {
    List<Map<String, dynamic>> mealExtraJson =
        meal.mealExtra.map((e) => e.toJson()).toList();
    return {
      'meal_id': meal.id,
      'quantity': quantity,
      'meal_variaties': [],
      'meal_extra': mealExtraJson,
    };
  }

  CartItem copyWith({
    String? cartItemId,
    Meal? meal,
    List<dynamic>? mealOptionSelected,
    List<dynamic>? mealExtras,
    int? quantity,
    String? totalAmount,
    dynamic additionalInformation,
  }) {
    return CartItem(
      cartItemId: cartItemId ?? this.cartItemId,
      meal: meal ?? this.meal,
      mealOptionSelected: mealOptionSelected ?? this.mealOptionSelected,
      mealExtras: mealExtras ?? this.mealExtras,
      quantity: quantity ?? this.quantity,
      totalAmount: totalAmount ?? this.totalAmount,
      additionalInformation:
          additionalInformation ?? this.additionalInformation,
    );
  }
}

class CartFees {
  final double totalMealCost;
  final double deliveryFee;
  final double serviceFee;
  final double vat;
  final double total;

  CartFees({
    required this.totalMealCost,
    required this.deliveryFee,
    required this.serviceFee,
    required this.vat,
    required this.total,
  });

  factory CartFees.fromJson(Map<String, dynamic> json) {
    return CartFees(
      totalMealCost: double.tryParse(json['total_meal_cost'].toString()) ?? 0,
      deliveryFee: double.tryParse(json['delivery_fee'].toString()) ?? 0,
      serviceFee: double.tryParse(json['service_fee'].toString()) ?? 0,
      vat: double.tryParse(json['vat'].toString()) ?? 0.0,
      total: double.tryParse(json['total'].toString()) ?? 0.0,
    );
  }

  static CartFees get dummy {
    return CartFees(
        totalMealCost: 0.0,
        deliveryFee: 0.0,
        serviceFee: 0.0,
        vat: 0.0,
        total: 0.0);
  }
}
