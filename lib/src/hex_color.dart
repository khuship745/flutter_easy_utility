import 'package:flutter/material.dart';

extension HexColor on Color {
  /**
   * Creates a Color object from a hex string.
   * The string can be in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
   * If the string is 6 characters long, it assumes full opacity (ff).
   */
  static Color fromHex(String hexString) {
    final buffer = StringBuffer();
    if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
    buffer.write(hexString.replaceFirst('#', ''));
    return Color(int.parse(buffer.toString(), radix: 16));
  }

  /**
   * Converts a Color object to a hex string.
   * The string will be in the format "#aabbcc" or "aabbcc".
   * The leadingHashSign parameter adds a hash sign at the beginning if set to true (default).
   */
  String toHex({bool leadingHashSign = true}) => '${leadingHashSign ? '#' : ''}'
      '${alpha.toRadixString(16).padLeft(2, '0')}'
      '${red.toRadixString(16).padLeft(2, '0')}'
      '${green.toRadixString(16).padLeft(2, '0')}'
      '${blue.toRadixString(16).padLeft(2, '0')}';
}
