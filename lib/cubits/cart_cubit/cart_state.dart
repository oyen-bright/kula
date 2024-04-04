part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();
  const factory CartState.initial() = _Initial;
  const factory CartState.hasItem({
    required String vendorID,
    required List<CartItem> items,
  }) = _HasItem;

  const factory CartState.loading({
    String? vendorID,
    List<CartItem>? items,
  }) = _Loading;

  const factory CartState.message({
    required String error,
    required String? vendorID,
    required List<CartItem>? items,
  }) = _Error;

  bool get isEmpty {
    return maybeWhen(
      orElse: () => true,
      hasItem: (_, items) => items.isEmpty,
    );
  }

  String? get vendorID {
    return maybeWhen(
        orElse: () => null, hasItem: (id, _) => id, loading: (id, _) => id);
  }

  List<CartItem>? get cartItems {
    return maybeWhen(
        orElse: () => [],
        hasItem: (__, items) => items,
        loading: (_, items) => items);
  }

  int get cartItemCount {
    return maybeWhen(
        orElse: () => 0,
        hasItem: (__, items) => items.length,
        loading: (_, items) => items?.length ?? 0);
  }
}
