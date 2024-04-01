// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/cubits/loading_cubit/loading_cubit.dart';
import 'package:kula/services/address_service.dart';
import 'package:kula/ui/views/authentication/sign_up/models/address_input.dart';

import 'address_model.dart';

part 'address_cubit.freezed.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressService addressService;
  LoadingCubit loadingCubit;
  AddressCubit(
    this.addressService,
    this.loadingCubit,
  ) : super(const AddressState.initial());

  Future<void> getAddress() async {
    emit(AddressState.loading(addresses: state.addresses));
    final response = await addressService.getAddress();
    if (response.error != null) {
      emit(AddressState.error(error: response.error ?? ""));
      return;
    }
    emit(AddressState.loaded(addresses: response.data ?? []));
  }

  Future<void> deleteAddress(String id) async {
    emit(AddressState.loading(addresses: state.addresses));
    loadingCubit.loading();
    final response = await addressService.deleteAddress(id);
    if (response.error != null) {
      loadingCubit.loaded();
      emit(AddressState.error(
          error: response.error ?? "", addresses: state.addresses));
      return;
    }

    getAddress();
    loadingCubit.loaded();
  }

  Future<void> addAddress(InputAddress address) async {
    emit(AddressState.loading(addresses: state.addresses));
    loadingCubit.loading();
    final response = await addressService.addAddress([address]);
    if (response.error != null) {
      loadingCubit.loaded();
      emit(AddressState.error(
          error: response.error ?? "", addresses: state.addresses));
      return;
    }

    getAddress();
    loadingCubit.loaded();
  }

  Future<void> setDefaultAddress(String id) async {
    emit(AddressState.loading(addresses: state.addresses));
    loadingCubit.loading();
    final response = await addressService.setDefaultAddress(id);
    if (response.error != null) {
      loadingCubit.loaded();
      emit(AddressState.error(
          error: response.error ?? "", addresses: state.addresses));
      return;
    }

    getAddress();
    loadingCubit.loaded();
  }
}
