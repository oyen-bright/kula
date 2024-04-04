class Meal {
  final String id;
  final String categoryId;
  final String name;
  final String image;
  final String description;
  final double price;
  final double salePrice;
  final String vendorId;
  final String estimatedTime;
  final bool showExtras;
  final String status;
  final dynamic selectedExtra;
  final Vendor? vendor;
  final List<MealExtra> mealExtra;

  Meal({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    this.mealExtra = const [],
    required this.description,
    required this.price,
    required this.salePrice,
    required this.vendorId,
    required this.estimatedTime,
    required this.showExtras,
    required this.status,
    required this.selectedExtra,
    required this.vendor,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: double.parse(json['price'].toString()),
      salePrice: double.parse(json['sale_price'].toString()),
      vendorId: json['vendor_id'],
      mealExtra: List.from((json['meal_extra'] ?? []))
          .map((x) => MealExtra.fromJson(x))
          .toList(),
      estimatedTime: json['estimated_time'],
      showExtras: true,
      // showExtras: (json['show_extras'] ?? 0) == 1 ? true : false,
      status: json['status'],
      selectedExtra: json['selected_extra'],
      vendor: json['vendor'] != null ? Vendor.fromJson(json['vendor']) : null,
    );
  }

  static Meal get dummy {
    return Meal(
        id: "id",
        categoryId: "categoryId",
        name: "name",
        image: "image",
        description: "description",
        price: 0.0,
        salePrice: 0.0,
        vendorId: "vendorId",
        estimatedTime: "estimatedTime",
        showExtras: true,
        status: "status",
        selectedExtra: "selectedExtra",
        vendor: Vendor.dummy);
  }
}

class Vendor {
  final String id;
  final String storeName;

  Vendor({
    required this.id,
    required this.storeName,
  });

  factory Vendor.fromJson(Map<String, dynamic> json) {
    return Vendor(
      id: json['id'],
      storeName: json['store_name'],
    );
  }

  static Vendor get dummy {
    return Vendor(id: "id", storeName: "storeName");
  }
}

class MealExtra {
  final String id;
  final String mealId;
  final String mealName;
  final int quantityLimit;
  final int totalQuantity;
  final String price;
  final dynamic cartId;
  final String image;

  MealExtra({
    required this.id,
    required this.mealId,
    required this.mealName,
    required this.quantityLimit,
    required this.totalQuantity,
    required this.price,
    required this.cartId,
    required this.image,
  });

  factory MealExtra.fromJson(Map<String, dynamic> json) {
    return MealExtra(
      id: json['id'],
      mealId: json['meal_id'],
      mealName: json['meal_name'],
      quantityLimit: json['quantity_limit'],
      totalQuantity: json['total_quantity'],
      price: json['price'],
      cartId: json['cart_id'],
      image: json['image'],
    );
  }
}
