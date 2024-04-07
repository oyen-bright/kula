part of 'cart_cubit.dart';

@freezed
class CartState with _$CartState {
  const CartState._();
  const factory CartState.initial() = _Initial;
  const factory CartState.hasItem({
    required String vendorID,
    required CartFees? fees,
    required List<CartItem> items,
  }) = _HasItem;

  const factory CartState.loading({
    String? vendorID,
    List<CartItem>? items,
    CartFees? fees,
  }) = _Loading;

  const factory CartState.message({
    required String error,
    required String? vendorID,
    required CartFees? fees,
    required List<CartItem>? items,
  }) = _Error;

  bool get isEmpty {
    return maybeWhen(
      orElse: () => true,
      message: (_, __, ___, items) => items?.isEmpty ?? true,
      hasItem: (
        _,
        ___,
        items,
      ) =>
          items.isEmpty,
    );
  }

  String? get vendorID {
    return maybeWhen(
        orElse: () => null,
        hasItem: (id, _, __) => id,
        loading: (id, _, __) => id);
  }

  List<CartItem>? get cartItems {
    return maybeWhen(
        orElse: () => [],
        message: (_, __, ___, items) => items,
        hasItem: (_, __, items) => items,
        loading: (_, items, __) => items);
  }

  int get cartItemCount {
    return maybeWhen(
        orElse: () => 0,
        hasItem: (_, __, items) => items.length,
        loading: (_, items, __) => items?.length ?? 0);
  }

  CartFees? get fees {
    return maybeWhen(
        orElse: () => null,
        hasItem: (_, fees, __) => fees,
        loading: (_, __, fees) => fees);
  }
}
