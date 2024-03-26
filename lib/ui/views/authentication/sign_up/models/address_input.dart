class InputAddress {
  String? street;
  String? floorNumber;
  String? houseNumber;
  String? longitude;
  String? latitude;
  String? additionalInfo;

  bool validateInput() {
    return [
      street,
      floorNumber,
      houseNumber,
      longitude,
      latitude,
      additionalInfo
    ].every((element) => element != null && element.isNotEmpty);
  }

  String get address {
    String addressString = '${street ?? ''} ';
    addressString += '${floorNumber ?? ''} ';
    addressString += (houseNumber ?? '');

    return addressString.trim();
  }
}
