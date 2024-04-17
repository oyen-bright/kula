part of 'order_cubit.dart';

@freezed
class OrderState with _$OrderState {
  const factory OrderState.initial() = _Initial;
  const factory OrderState.loading() = _Loading;
  const factory OrderState.error({
    required String error,
  }) = _Error;
  const factory OrderState.loaded() = _Loaded;
}
