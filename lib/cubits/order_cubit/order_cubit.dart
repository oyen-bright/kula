import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/services/order_service.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderService orderService;
  OrderCubit(this.orderService) : super(const OrderState.initial());

  Future<void> getOrders() async {
    emit(const OrderState.loading());
    final response = await orderService.getOrders();
    if (response.error != null) {
      emit(OrderState.error(error: response.error ?? ""));
      return;
    }

    emit(const OrderState.loaded());
  }
}
