extension StringExtension on String {
  String toFirstLetterUpperCase() {
    if (isEmpty) return '';
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}