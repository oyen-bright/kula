import 'package:kula/config/app_constants.dart';

String amountFormatter(dynamic amount,
    [String currency = AppConstants.appCurrency]) {
  double value = double.tryParse(amount.toString()) ?? 0.0;
  String formattedAmount = value.toStringAsFixed(2);
  List<String> parts = formattedAmount.split('.');
  RegExp pattern = RegExp(r'\B(?=(\d{3})+(?!\d))');
  parts[0] = parts[0].replaceAll(pattern, ',');
  if (parts[1] == '00') {
    return "$currency ${parts[0]}";
  }
  return "$currency ${parts.join('.')}";
}
