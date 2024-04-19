part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const OrderState._();

  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading(AllOrder orders) = _Loading;
  const factory OrderState.error(
      {required String error, required AllOrder orders}) = _Error;
  const factory OrderState.loaded(AllOrder orders) = _Loaded;

  AllOrder get orders {
    return map(
        initial: (_) => (pending: [], completed: []),
        loading: (state) => state.orders,
        error: (state) => state.orders,
        loaded: (state) => state.orders);
  }
}

typedef AllOrder = ({List<Order> pending, List<Order> completed});
