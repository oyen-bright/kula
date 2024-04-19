import 'package:intl/intl.dart';

String formattedCreatedAt(String date) {
  final createdAtDateTime = DateTime.tryParse(date) ?? DateTime.now();
  final now = DateTime.now();
  final difference = now.difference(createdAtDateTime);

  if (difference.inDays < 7) {
    final DateFormat dayFormat = DateFormat('EEEE');
    final DateFormat dateFormat = DateFormat('MMMM d');
    final DateFormat yearFormat = DateFormat('y');
    final dayOfWeek = dayFormat.format(createdAtDateTime);
    final dateOfMonth = dateFormat.format(createdAtDateTime);
    final year = yearFormat.format(createdAtDateTime);
    return '$dayOfWeek, $dateOfMonth, $year';
  } else {
    return DateFormat('yyyy-MM-dd hh:mm:ss').format(createdAtDateTime);
  }
}
