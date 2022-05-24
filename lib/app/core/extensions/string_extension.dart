extension IntExt on String {
  int get toInt => int.tryParse(this) ?? 0;

  String get formatCard {
    final buffer = StringBuffer();

    for (int i = 0; i < length; i++) {
      buffer.write(this[i]);
      int index = i + 1;
      if (index % 4 == 0 && index != length) {
        buffer.write('  ');
      }
    }
    return buffer.toString();
  }
}
