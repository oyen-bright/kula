extension StringExtension on String {
  String get titleCase {
    if (isEmpty) {
      return '';
    }
    return this[0].toUpperCase() + substring(1).toLowerCase();
  }
}
