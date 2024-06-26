import 'package:flutter_easy_utility/src/string_ext.dart';
import 'package:flutter_easy_utility/src/utility.dart';

/**
 * Converts any dynamic type to a String.
 * Trims the string and returns it.
 * If an error occurs, it logs the error and returns an empty string.
 */
String convertToString(dynamic value) {
  String strValue = "";
  try {
    if (value == null) {
      return "";
    }
    if (value is String) {
      strValue = value.toString();
      return strValue.trimString();
    }
    strValue = value.toString();
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
int convertToInt(dynamic value) {
  int iValue = 0;
  String strValue;
  try {
    if (value == null) {
      return 0;
    }
    if (value is int) {
      strValue = value.toString();
      if (strValue.isNotEmptyAndNotNull()) {
        iValue = int.parse(strValue);
      }
    }
    if (value is String) {
      double dValue = double.tryParse(value) ?? 0.0;
      iValue = dValue.ceil();
    }
    if (value is double) {
      iValue = value.ceil();
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
double convertToDouble(dynamic value) {
  double dValue = 0.00;
  String strValue;
  try {
    if (value == null) {
      return 0.00;
    }
    strValue = value.toString();
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
