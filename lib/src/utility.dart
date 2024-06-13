import 'dart:io';
import 'package:flutter/material.dart';

/**
 * Logs a message to the console if the message is not empty.
 */
printLog(String strLogMessage) {
  if (strLogMessage.isNotEmpty) {
    debugPrint("| $strLogMessage");
  }
}

/**
 * Logs an exception to the console if the exception is not null.
 */
printExceptionLog(dynamic ex) {
  if (ex != null) {
    debugPrint("| ----- ERROR ----- |");
    debugPrint("| ${ex.toString()}");
  }
}

class Utility {
  /**
   * Calculates the size of a file in megabytes.
   * Reads the file bytes, converts to kilobytes, and then to megabytes.
   * Logs an error if an exception occurs and returns 0.
   */
  double getFileSize(File file) {
    double fileSize = 0;

    try {
      final bytes = file.readAsBytesSync().lengthInBytes;
      final kb = bytes / 1024;
      fileSize = kb / 1024;
    } catch (ex) {
      printExceptionLog(ex);
    }

    return fileSize;
  }
}
