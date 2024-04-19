import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/order_cubit/order_model.dart';
import 'package:kula/data/http/http_repository.dart';

abstract class _OrderService {
  Future<OrderServiceResponse<List<Order>?>> getOrders();

  Future<OrderServiceResponse<String?>> getOrderDetails(String orderNo);
}

class OrderServiceResponse<T> {
  final String? error;
  final T data;

  OrderServiceResponse({required this.error, required this.data});
}

class OrderService implements _OrderService {
  static void logger(String error) {
    log(error, name: "Order Service ");
  }

  @override
  Future<OrderServiceResponse<List<Order>?>> getOrders() async {
    try {
      final response = await AppRepository.getOrders();
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      final orders =
          (data['data'] as List).map((e) => Order.fromJson(e)).toList();

      return OrderServiceResponse<List<Order>?>(error: null, data: orders);
    } catch (e) {
      OrderService.logger(e.toString());
      return OrderServiceResponse<List<Order>?>(
          error: e.toString(), data: null);
    }
  }

  @override
  Future<OrderServiceResponse<String?>> getOrderDetails(String orderNo) async {
    try {
      final response = await AppRepository.getOrderDetails(orderNo);
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      final message = data['message'];

      return OrderServiceResponse<String?>(error: null, data: message);
    } catch (e) {
      OrderService.logger(e.toString());
      return OrderServiceResponse<String?>(error: e.toString(), data: null);
    }
  }
}
