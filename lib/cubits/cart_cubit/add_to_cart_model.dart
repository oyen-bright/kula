// ignore_for_file: public_member_api_docs, sort_constructors_first

class AddToCartItem {
  String mealId;
  int quantity;
  double? price;
  List<MealVariety> mealVarieties;
  List<MealExtra> mealExtra;

  AddToCartItem({
    this.price,
    required this.mealId,
    required this.quantity,
    required this.mealVarieties,
    required this.mealExtra,
  });

  void _addExtra(
    String id,
    double price,
  ) {
    final index = mealExtra.indexWhere((element) => element.mealId == id);
    if (index == -1) {
      mealExtra.add(MealExtra(mealId: id, quantity: 1, price: price));
      return;
    }

    mealExtra[index] = MealExtra(mealId: id, quantity: 1, price: price);
  }

  int get itemQuantity {
    return quantity +
        mealExtra.fold<int>(
            0, (int value, MealExtra element) => value + element.quantity);
  }

  double get itemPrice {
    return (price ?? 0).toDouble() +
        mealExtra.fold<double>(
            0,
            (double value, MealExtra element) =>
                value + ((element.price ?? 0) * element.quantity));
  }

  int mealExtraQuantity(String id) {
    return mealExtra
        .firstWhere(
            orElse: () => MealExtra(mealId: "", quantity: 0),
            (element) => element.mealId == id)
        .quantity;
  }

  void increaseExtraMealQuality(String id, double price) {
    final index = mealExtra.indexWhere((element) => element.mealId == id);
    if (index != -1) {
      mealExtra[index] = mealExtra[index].copyWith(
        mealId: id,
        quantity: mealExtra[index].quantity + 1,
      );
      return;
    }

    _addExtra(id, price);
  }

  void decreaseExtraMealQuality(
    String id,
  ) {
    final index = mealExtra.indexWhere((element) => element.mealId == id);
    if (index != -1 && mealExtra[index].quantity > 0) {
      mealExtra[index] = mealExtra[index].copyWith(
        mealId: id,
        quantity: mealExtra[index].quantity - 1,
      );
    }
  }

  factory AddToCartItem.fromJson(Map<String, dynamic> json) {
    List<dynamic> mealVarietiesJson = json['meal_variaties'];
    List<dynamic> mealExtraJson = json['meal_extra'];

    return AddToCartItem(
      mealId: json['meal_id'],
      quantity: json['quantity'],
      mealVarieties:
          mealVarietiesJson.map((e) => MealVariety.fromJson(e)).toList(),
      mealExtra: mealExtraJson.map((e) => MealExtra.fromJson(e)).toList(),
    );
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> mealVarietiesJson =
        mealVarieties.map((e) => e.toJson()).toList();
    List<Map<String, dynamic>> mealExtraJson =
        mealExtra.map((e) => e.toJson()).toList();

    return {
      'meal_id': mealId,
      'quantity': quantity,
      'meal_variaties': mealVarietiesJson,
      'meal_extra': mealExtraJson,
    };
  }
}

class MealVariety {
  String mealOptionCategoryId;
  String mealOptionId;

  MealVariety({
    required this.mealOptionCategoryId,
    required this.mealOptionId,
  });

  factory MealVariety.fromJson(Map<String, dynamic> json) {
    return MealVariety(
      mealOptionCategoryId: json['meal_option_category_id'] as String,
      mealOptionId: json['meal_option_id'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meal_option_category_id': mealOptionCategoryId,
      'meal_option_id': mealOptionId,
    };
  }
}

class MealExtra {
  String mealId;
  int quantity;
  double? price;

  MealExtra({
    required this.mealId,
    this.price,
    required this.quantity,
  });

  factory MealExtra.fromJson(Map<String, dynamic> json) {
    return MealExtra(
      mealId: json['meal_id'] as String,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'meal_id': mealId,
      'quantity': quantity,
    };
  }

  MealExtra copyWith({
    String? mealId,
    int? quantity,
    double? price,
  }) {
    return MealExtra(
      mealId: mealId ?? this.mealId,
      quantity: quantity ?? this.quantity,
      price: price ?? this.price,
    );
  }
}
