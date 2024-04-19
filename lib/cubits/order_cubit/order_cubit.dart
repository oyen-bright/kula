import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/services/order_service.dart';

import 'order_model.dart';

part 'order_cubit.freezed.dart';
part 'order_state.dart';

class OrderCubit extends Cubit<OrderState> {
  final OrderService orderService;
  OrderCubit(this.orderService) : super(const OrderState.initial());

  Future<void> getOrders() async {
    emit(OrderState.loading(state.orders));
    final response = await orderService.getOrders();
    if (response.error != null) {
      emit(OrderState.error(error: response.error ?? "", orders: state.orders));
      return;
    }

    final completedOrder = response.data
            ?.where((element) => element.status != "pending")
            .toList() ??
        [];
    final pending = response.data
            ?.where((element) => element.status == "pending")
            .toList() ??
        [];
    final AllOrder allOrder = (completed: completedOrder, pending: pending);

    emit(OrderState.loaded(allOrder));
  }
}
