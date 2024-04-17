enum Environment {
  development("DEV"),
  production("PROD");

  const Environment(this.value);
  final String value;
}

enum HttpMethod {
  get("GET"),
  post('POST'),
  put('PUT'),
  delete('DELETE');

  const HttpMethod(this.value);
  final String value;
}

enum HapticFeedbackType {
  light,
  medium,
  heavy,
  selection,
  vibrate,
}

enum PaymentMethod {
  card("cad"),
  transfer("transfer"),
  cashOnDelivery("cod"),
  storeCredit("store_credit");

  const PaymentMethod(this.value);
  final String value;
}

enum BarType { error, success, loading, action }

enum WrapperBackgroundImage { one, two }

enum WrapperBackgroundImageSize { small, large }
