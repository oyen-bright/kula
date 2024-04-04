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
      emit(CartState.message(
          error: response.error ?? "",
          vendorID: state.vendorID,
          items: state.cartItems));

      return;
    }

    emit(CartState.message(
        error: response.data ?? "",
        vendorID: vendorID,
        items: state.cartItems));
    getCart();
  }

  Future<void> getCart() async {
    emit(CartState.loading(vendorID: state.vendorID, items: state.cartItems));

    final response = await cartService.getCart();

    if (response.error != null) {
      emit(CartState.message(
          error: response.error ?? "",
          vendorID: state.vendorID,
          items: state.cartItems));

      return;
    }

    emit(CartState.hasItem(
        vendorID: state.vendorID ?? "", items: response.data ?? []));
  }

  Future<void> deleteCartItem(String id) async {
    loadingCubit.loading();

    final response = await cartService.deleteCartItem(id);
    loadingCubit.loaded();

    if (response.error != null) {
      emit(CartState.message(
          error: response.error ?? "",
          vendorID: state.vendorID,
          items: state.cartItems));

      return;
    }

    getCart();
  }
}
