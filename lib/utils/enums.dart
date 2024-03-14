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

enum BarType { error, success, loading, action }

enum WrapperBackgroundImage { one, two }

enum WrapperBackgroundImageSize { small, large }
