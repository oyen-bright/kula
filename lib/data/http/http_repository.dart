class HttpRepository {
  HttpRepository._();

  // static Future<Response> getVehicleData(String vin) async {
  //   return await HttpClient.getRequest(
  //       endpoint: Endpoint.vehicleData.replaceAll('[vin]', vin));
  // }

  //Legacy Code
  // static Future<Response> getVinByVehicleIdSmartCar(
  //     {required String vehicleId, required String accessToken}) async {
  //   return await HttpClient.getRequest(
  //     headers: {
  //       'Authorization': 'Bearer $accessToken',
  //     },
  //     endpoint: Endpoint.smartCarVin.replaceAll('[carId]', vehicleId),
  //   );
  // }
}
