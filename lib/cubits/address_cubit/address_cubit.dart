// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:kula/services/address_service.dart';

import 'address_model.dart';

part 'address_cubit.freezed.dart';
part 'address_state.dart';

class AddressCubit extends Cubit<AddressState> {
  AddressService addressService;
  AddressCubit(
    this.addressService,
  ) : super(const AddressState.initial());

  Future<void> getAddress() async {
    emit(const AddressState.loading());
    final response = await addressService.getAddress();
    if (response.error != null) {
      emit(AddressState.error(error: response.error ?? ""));
      return;
    }
    emit(AddressState.loaded(addresses: response.data ?? []));
  }
}
