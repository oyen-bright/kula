import 'dart:convert';
import 'dart:developer';

import 'package:kula/cubits/address_cubit/address_model.dart';
import 'package:kula/data/http/http_repository.dart';
import 'package:kula/ui/views/authentication/sign_up/models/address_input.dart';

abstract class _AddressService {
  Future<AddressServiceResponse> getAddress();
  Future<AddressServiceResponse> deleteAddress(String addressId);
  Future<AddressServiceResponse> setDefaultAddress(String addressId);
  Future<AddressServiceResponse> addAddress(List<InputAddress> address);
}

class AddressServiceResponse<T> {
  final String? error;
  final T data;

  AddressServiceResponse({required this.error, required this.data});
}

class AddressService implements _AddressService {
  @override
  Future<AddressServiceResponse> addAddress(
      List<InputAddress> inputAddress) async {
    try {
      final response = await Future.wait(inputAddress
          .map((e) => AppRepository.addAddress(
              street: e.street!,
              houseNumber: e.houseNumber ?? "",
              floorNumber: e.floorNumber ?? "",
              longitude: e.longitude ?? "",
              latitude: e.latitude ?? "",
              additionalInfo: e.additionalInfo ?? ""))
          .toList());
      final data = jsonDecode(response.first.body) as Map<String, dynamic>;
      final message = data['message'];

      return AddressServiceResponse(error: null, data: message);
    } catch (e) {
      AddressService.logger(e.toString());
      return AddressServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<AddressServiceResponse> deleteAddress(String addressId) async {
    try {
      final response = await AppRepository.deleteAddress(addressId);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return AddressServiceResponse(error: null, data: message);
    } catch (e) {
      AddressService.logger(e.toString());
      return AddressServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<AddressServiceResponse<List<Address>?>> getAddress() async {
    try {
      final response = await AppRepository.getAddress();
      final data = jsonDecode(response.body) as Map<String, dynamic>;

      final List<Map<String, dynamic>> addresses = List.from(data['data']);

      return AddressServiceResponse(
          error: null,
          data: addresses.map((e) => Address.fromJson(e)).toList());
    } catch (e) {
      AddressService.logger(e.toString());
      return AddressServiceResponse(error: e.toString(), data: null);
    }
  }

  @override
  Future<AddressServiceResponse> setDefaultAddress(String addressId) async {
    try {
      final response = await AppRepository.setDefaultAddress(addressId);
      final data = jsonDecode(response.body) as Map<String, dynamic>;
      final message = data['message'];

      return AddressServiceResponse(error: null, data: message);
    } catch (e) {
      AddressService.logger(e.toString());
      return AddressServiceResponse(error: e.toString(), data: null);
    }
  }

  static void logger(String error) {
    log(error, name: "OTP Service ");
  }
}
