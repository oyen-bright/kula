class Order {
  final String id;
  final String userId;
  final List<String> cartItems;
  final int orderNo;
  final double totalAmount;
  final double totalPrice;
  final double vatFee;
  final String status;
  final String deliveryAddress;
  final String paymentMethod;
  final dynamic additionalInformation;
  final String createdAt;
  final String updatedAt;
  final double shippingFee;
  final double serviceFee;

  final List<OrderItem> orderItems;

  Order({
    required this.id,
    required this.userId,
    required this.cartItems,
    required this.orderNo,
    required this.totalAmount,
    required this.totalPrice,
    required this.vatFee,
    required this.status,
    required this.deliveryAddress,
    required this.paymentMethod,
    required this.additionalInformation,
    required this.createdAt,
    required this.updatedAt,
    required this.shippingFee,
    required this.serviceFee,
    required this.orderItems,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user_id'],
      // cartItems: List.from(json['cart_items']),
      cartItems: [],
      orderNo: json['order_no'],
      totalAmount: double.tryParse(json['total_amount'].toString()) ?? 0,
      totalPrice: double.tryParse(json['total_price'].toString()) ?? 0,
      vatFee: double.tryParse(json['vat_fee'].toString()) ?? 0,
      status: json['status'],
      deliveryAddress: json['delivery_address'],
      paymentMethod: json['payment_method'],
      additionalInformation: json['additional_information'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      shippingFee: double.tryParse(json['vat_fee'].toString()) ?? 0,

      serviceFee: double.tryParse(json['service_fee'].toString()) ?? 0,

      orderItems: List<OrderItem>.from(
          json['order_items'].map((x) => OrderItem.fromJson(x))),
    );
  }

  static Order get dummy {
    return Order(
        id: "id",
        userId: "userId",
        cartItems: [],
        orderNo: 0,
        totalAmount: 0,
        totalPrice: 0,
        vatFee: 0,
        status: "status",
        deliveryAddress: "deliveryAddress",
        paymentMethod: "paymentMethod",
        additionalInformation: "additionalInformation",
        createdAt: DateTime.now().toString(),
        updatedAt: DateTime.now().toString(),
        shippingFee: 0,
        serviceFee: 0,
        orderItems: []);
  }
}

class OrderItem {
  final Meal meal;
  final List<dynamic> mealOptionSelected;
  final List<dynamic> mealExtras;
  final int quantity;
  final double totalAmount;
  final dynamic additionalInformation;

  OrderItem({
    required this.meal,
    required this.mealOptionSelected,
    required this.mealExtras,
    required this.quantity,
    required this.totalAmount,
    required this.additionalInformation,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      meal: Meal.fromJson(json['meal']),
      mealOptionSelected: List<dynamic>.from(json['meal_option_selected']),
      mealExtras: List<dynamic>.from(json['meal_extras']),
      quantity: json['quantity'],
      totalAmount: double.tryParse(json['total_amount']) ?? 0,
      additionalInformation: json['additional_information'],
    );
  }
}

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
  final int showExtras;
  final String status;
  final dynamic selectedExtra;

  Meal({
    required this.id,
    required this.categoryId,
    required this.name,
    required this.image,
    required this.description,
    required this.price,
    required this.salePrice,
    required this.vendorId,
    required this.estimatedTime,
    required this.showExtras,
    required this.status,
    required this.selectedExtra,
  });

  factory Meal.fromJson(Map<String, dynamic> json) {
    return Meal(
      id: json['id'],
      categoryId: json['category_id'],
      name: json['name'],
      image: json['image'],
      description: json['description'],
      price: double.tryParse(json['price']) ?? 0,
      salePrice: double.tryParse(json['sale_price']) ?? 0,
      vendorId: json['vendor_id'],
      estimatedTime: json['estimated_time'],
      showExtras: json['show_extras'],
      status: json['status'],
      selectedExtra: json['selected_extra'],
    );
  }
}
