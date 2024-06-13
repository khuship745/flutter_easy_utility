import 'package:flutter_easy_utility/src/string_ext.dart';

extension DynamicExt on dynamic {
  /**
   * Converts any dynamic type to a String.
   * Trims the string and returns it.
   * If an error occurs, it logs the error and returns an empty string.
   */
  String convertToString() {
    String strValue = "";
    try {
      if (this == null) {
        return "";
      }
      if (this is String) {
        strValue = this.toString();
        return strValue.trimString();
      }
      strValue = this.toString();
      return strValue.trimString();
    } catch (e) {
      printLog("ERROR : While convert to string : ${e.toString()}");
      return "";
    }
  }

  /**
   * Converts any dynamic type to an int.
   * If the dynamic type is a String, it parses it to a double first and then converts to int by rounding up.
   * If an error occurs, it logs the error and returns 0.
   */
  int convertToInt() {
    int iValue = 0;
    String strValue;
    try {
      if (this == null) {
        return 0;
      }
      if (this is int) {
        strValue = this.toString();
        if (strValue.isNotEmptyAndNotNull()) {
          iValue = int.parse(strValue);
        }
      }
      if (this is String) {
        double dValue = double.tryParse(this) ?? 0.0;
        iValue = dValue.ceil();
      }
      if (this is double) {
        iValue = this.ceil();
      }
      return iValue;
    } catch (e) {
      printLog("ERROR : While convert to int : ${e.toString()}");
      return 0;
    }
  }

  /**
   * Converts any dynamic type to a double.
   * Replaces any commas in the string representation before parsing.
   * If an error occurs, it logs the error and returns 0.00.
   */
  double convertToDouble() {
    double dValue = 0.00;
    String strValue;
    try {
      if (this == null) {
        return 0.00;
      }
      strValue = this.toString();
      if (strValue.isNotEmpty) {
        if (strValue.contains(",")) {
          strValue = strValue.replaceAll(",", "");
        }
        dValue = double.tryParse(strValue) ?? 0.00;
      } else {
        dValue = 0.00;
      }
      return dValue;
    } catch (e) {
      printLog("ERROR : While convert to double : ${e.toString()}");
      return 0.00;
    }
  }
}
