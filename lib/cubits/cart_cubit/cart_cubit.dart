import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/services/cart_service.dart';

import 'add_to_cart_model.dart';
import 'cart_model.dart';

part 'cart_cubit.freezed.dart';
part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  final LoadingCubit loadingCubit;
  final CartService cartService;
  CartCubit(this.loadingCubit, this.cartService)
      : super(const CartState.initial());

  Future<void> addToCart(AddToCartItem item, String vendorID) async {
    loadingCubit.loading();
    final response = await cartService.addToCart(item);
    loadingCubit.loaded();
    if (response.error != null) {
      _emitMessageState(response.error);

      return;
    }

    emit(CartState.message(
        fees: state.fees,
        error: response.data ?? "",
        vendorID: vendorID,
        items: state.cartItems));
    getCart();
  }

  Future<void> inCrease(CartItem item) async {
    emit(CartState.loading(vendorID: state.vendorID, items: state.cartItems));

    final response = await cartService
        .updateCartQuantity(item.copyWith(quantity: item.quantity + 1));

    if (response.error != null) {
      _emitMessageState(response.error);

      return;
    }

    getCart();
  }

  Future<void> decrease(CartItem item) async {
    if (!(item.quantity - 1 > 0)) {
      return;
    }
    emit(CartState.loading(vendorID: state.vendorID, items: state.cartItems));

    final response = await cartService
        .updateCartQuantity(item.copyWith(quantity: item.quantity - 1));

    if (response.error != null) {
      _emitMessageState(response.error);

      return;
    }

    getCart();
  }

  Future<void> getCart() async {
    emit(CartState.loading(vendorID: state.vendorID, items: state.cartItems));

    final response = await cartService.getCart();

    if (response.error != null) {
      _emitMessageState(response.error);

      return;
    }

    emit(CartState.hasItem(
        vendorID: state.vendorID ?? "",
        items: response.data?.item ?? [],
        fees: response.data?.fess));
  }

  Future<void> clearCart() async {
    emit(CartState.loading(vendorID: state.vendorID, items: state.cartItems));

    final response = await cartService.clearCart();

    if (response.error != null) {
      _emitMessageState(response.error);

      return;
    }

    emit(CartState.hasItem(
        vendorID: state.vendorID ?? "", items: [], fees: null));
  }

  Future<void> deleteCartItem(String id) async {
    loadingCubit.loading();

    final response = await cartService.deleteCartItem(id);
    loadingCubit.loaded();

    if (response.error != null) {
      _emitMessageState(response.error);

      return;
    }

    getCart();
  }

  void _emitMessageState(String? error) {
    emit(CartState.message(
        error: error ?? "",
        vendorID: state.vendorID,
        items: state.cartItems,
        fees: null));
  }
}
