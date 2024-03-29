part of 'address_cubit.dart';

@freezed
class AddressState with _$AddressState {
  const AddressState._();
  const factory AddressState.initial() = _Initial;
  const factory AddressState.loaded({required List<Address> addresses}) =
      _Loaded;
  const factory AddressState.loading() = _Loading;
  const factory AddressState.error({required String error}) = _Error;

  bool get isEmpty {
    return map(
      loaded: (state) => state.addresses.isEmpty,
      error: (_) => false,
      initial: (_) => false,
      loading: (_) => false,
    );
  }

  List<Address> get addresses {
    return map(
      loaded: (state) => state.addresses,
      error: (_) => [],
      initial: (_) => [],
      loading: (_) => [],
    );
  }
}
