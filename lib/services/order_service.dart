import 'dart:convert';
import 'dart:developer';

import 'package:kula/data/http/http_repository.dart';

abstract class _OrderService {
  Future<OrderServiceResponse<String?>> getOrders();

  Future<OrderServiceResponse<String?>> getOrderDetails(String orderNo);
}

class OrderServiceResponse<T> {
  final String? error;
  final T data;

  OrderServiceResponse({required this.error, required this.data});
}

class OrderService implements _OrderService {
  static void logger(String error) {
    log(error, name: "Payment Service ");
  }

  @override
  Future<OrderServiceResponse<String?>> getOrders() async {
    try {
      final response = await AppRepository.getOrders();
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      log(data.toString());

      final message = data['message'];

      return OrderServiceResponse<String?>(error: null, data: message);
    } catch (e) {
      OrderService.logger(e.toString());
      return OrderServiceResponse<String?>(error: e.toString(), data: null);
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
