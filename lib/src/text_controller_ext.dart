import 'package:flutter/material.dart';

extension TextControllerExt on TextEditingController {
  /**
   * Gets the trimmed text from a TextEditingController.
   */
  String get getString => text.toString().trim();

  /**
   * Checks if the text in a TextEditingController is empty after trimming whitespace.
   */
  bool get isEmpty => text.toString().trim().isEmpty;
}
