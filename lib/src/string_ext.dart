extension StringExt on String? {
  /**
   * Checks if a string contains a valid mobile number.
   * Removes non-digit characters and checks if the length is between 5 and 15 digits and contains only digits.
   */
  bool isValidMobileNumber() {
    if (this == null) {
      return false;
    }
    String digitsOnly = this!.replaceAll(RegExp(r'\D'), '');
    return (digitsOnly.length > 5 && digitsOnly.length <= 15) &&
        digitsOnly.contains(RegExp(r'^[0-9]+$'));
  }

  /**
   * Checks if a string is either null or empty after trimming whitespace.
   */
  bool isEmptyOrNull() {
    return this == null || this!.trim().isEmpty;
  }

  /**
   * Checks if a string is neither null nor empty after trimming whitespace.
   */
  bool isNotEmptyAndNotNull() {
    return this != null && this!.trim().isNotEmpty;
  }

  /**
   * Trims whitespace from a string.
   * Returns an empty string if the original string is null or the string "null".
   */
  String trimString() {
    if (this == null) {
      return "";
    }
    if (this!.toLowerCase().trim() == "null") {
      return "";
    }
    return this!.trim();
  }

  /**
   * Trims whitespace from a string and converts it to lowercase.
   */
  String convertToLowerCase() {
    if (this == null) {
      return "";
    }
    return this!.trim().toLowerCase();
  }

  /**
   * Trims whitespace from a string and formats it as a price with a specified currency sign.
   */
  String convertToPrice(String currencySymbol) {
    if (this == null) {
      return "${currencySymbol}0.00";
    }
    return "$currencySymbol${this!.trim()}";
  }

  /**
   * Checks if a string is a valid email using a regular expression.
   */
  bool isValidEmail() {
    if (this == null) {
      return false;
    }
    final RegExp regex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    return regex.hasMatch(this!);
  }
}
