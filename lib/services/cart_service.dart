import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/cart_cubit/add_to_cart_model.dart';
import 'package:kula/cubits/cart_cubit/cart_model.dart';
import 'package:kula/data/http/http_repository.dart';
import 'package:kula/utils/enums.dart';

abstract class _CartService {
  Future<CartServiceResponse<({CartFees fess, List<CartItem> item})?>>
      getCart();
  Future<CartServiceResponse<String?>> clearCart();
  Future<CartServiceResponse<CartItem?>> updateCartQuantity(CartItem item);

  Future<CartServiceResponse<String?>> addToCart(AddToCartItem cartItem);
  Future<CartServiceResponse<String?>> deleteCartItem(String id);
  Future<CartServiceResponse<String?>> createOrder(
      PaymentMethod paymentMethod, String amount);
}

class CartServiceResponse<T> {
  final String? error;
  final T data;

  CartServiceResponse({required this.error, required this.data});
}

class CartService implements _CartService {
  @override
  Future<CartServiceResponse<String?>> addToCart(AddToCartItem cartItem) async {
    try {
      final response = await AppRepository.addToCart(cartItem.toMap());
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      final message = data['message'];

      return CartServiceResponse(error: null, data: message);
    } catch (e) {
      CartService.logger(e.toString());
      return CartServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<CartServiceResponse<({CartFees fess, List<CartItem> item})?>>
      getCart() async {
    try {
      final response = await AppRepository.getCart();
      final data = jsonDecode(response.body) as Map;

      final cartItems =
          List.from(data['data']).map(((e) => CartItem.fromJson(e))).toList();

      final cartFees = CartFees.fromJson(data['fees']);

      return CartServiceResponse(
          error: null, data: (fess: cartFees, item: cartItems));
    } catch (e) {
      CartService.logger(e.toString());
      return CartServiceResponse(error: e.toString(), data: null);
    }
  }

  static void logger(String error) {
    log(error, name: "Cart Service ");
  }

  @override
  Future<CartServiceResponse<String?>> deleteCartItem(String id) async {
    try {
      final response = await AppRepository.deleteCartItem(id);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      final message = data['message'];

      return CartServiceResponse(error: null, data: message);
    } catch (e) {
      CartService.logger(e.toString());
      return CartServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<CartServiceResponse<String?>> clearCart() async {
    try {
      final response = await AppRepository.clearCart();
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      return CartServiceResponse(error: null, data: "");
    } catch (e) {
      CartService.logger(e.toString());
      return CartServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<CartServiceResponse<CartItem?>> updateCartQuantity(
      CartItem item) async {
    try {
      final response = await AppRepository.updateCartQuantity(
          item.toAddToCartMap(), item.cartItemId);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      return CartServiceResponse(error: null, data: item);
    } catch (e) {
      CartService.logger(e.toString());
      return CartServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<CartServiceResponse<String?>> createOrder(
      PaymentMethod paymentMethod, String amount) async {
    try {
      final response = await AppRepository.createOrder(
          {"payment_method": "card", "payment_amount": 1000});
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final message = data['message'];

      return CartServiceResponse(error: null, data: message);
    } catch (e) {
      CartService.logger(e.toString());
      return CartServiceResponse(error: e.toString(), data: null);
    }
  }
}
