# flutter_utils

This project is a starting point for a Flutter plug-in package.It provides a set of methods/extensions for Flutter that make using the framework much easier and cleaner, adds additional functionality, and provides tools and parts needed to build your project faster.


## Features

Dynamic Type Conversion: Easily convert dynamic types to String, int, or double with error handling.

String Manipulation and Validation: Validate mobile numbers and emails, trim strings, format strings as prices, and more.

TextEditingController Extensions: Get trimmed text from TextEditingController and check if it is empty.

GapSizer: Simplify adding horizontal and vertical gaps using SizedBox.

File Utilities: Get the size of a file in megabytes.

Logging Utilities: Log messages and exceptions for debugging purposes.

HexColor: Convert colors between hexadecimal strings and Color objects.

![Flutter Easy Utility](https://github.com/khuship745/flutter_easy_utility/blob/master/assets/flutter_easy_utility_ss.png)

## Installing
To use this package, add `flutter_easy_utility` as a dependency in your `pubspec.yaml` file.

## Usage

### 1. convertToString
-Converts any dynamic type to a String.
-Trims the string and returns it.
-If an error occurs, it logs the error and returns an empty string.
```dart
String strValue = "   Abc   ";

Text("Converted String to String: ${strValue.convertToString()}"),
Text("Converted String to Int: ${strValue.convertToInt()}"),
Text("Converted String to Double: ${strValue.convertToDouble()}"),
```

### 2. convertToInt
-Converts any dynamic type to an int.
-If the dynamic type is a String, it parses it to a double first and then converts to int by rounding up.
-If an error occurs, it logs the error and returns 0.
```dart
int iValue = 56;

Text("Converted Int to Int: ${iValue.convertToInt()}"),
Text("Converted Int to String: ${iValue.convertToString()}"),
Text("Converted Int to Double: ${iValue.convertToDouble()}"),
```

### 3. convertToDouble
-Converts any dynamic type to a double.
-Replaces any commas in the string representation before parsing.
-If an error occurs, it logs the error and returns 0.00.
```dart
double dValue = 9925.56;

Text("Converted Double to Double: ${dValue.convertToDouble()}"),
Text("Converted Double to String: ${dValue.convertToString()}"),
Text("Converted Double to Int: ${dValue.convertToInt()}"),
```

### 4. isValidMobileNumber
-Checks if a string contains a valid mobile number.
-Removes non-digit characters and checks if the length is between 5 and 15 digits and contains only digits.
```dart
final TextEditingController _mobileController = TextEditingController();
String _validationMessageForNumber = "";

TextField(
  keyboardType: TextInputType.number,
  controller: _mobileController,
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    labelText: "Enter mobile number",
  ),
),
ElevatedButton(
  onPressed: () {
    setState(() {
      _validationMessageForNumber = _mobileController.text.isValidMobileNumber()
          ? "Valid mobile number"
          : "Invalid mobile number";
    });
  },
  child: const Text("Validate Mobile Number"),
),
Text("Mobile number validation: $_validationMessageForNumber"),//Outputs: Validation message for mobile number
```

### 5. isEmptyOrNull
-Checks if a string is either null or empty after trimming whitespace.
```dart
String strValue = "   Abc   ";

Text("Check the message emptyOrNull: ${strValue.isEmptyOrNull()}"),
```

### 6. isNotEmptyAndNotNull
-Checks if a string is neither null nor empty after trimming whitespace.
```dart
String strValue = "   Abc   ";

Text("Check the message isNotEmptyAndNotNull: ${strValue.isNotEmptyAndNotNull()}"),
```

### 7. trimString
-Trims whitespace from a string.
-Returns an empty string if the original string is null or the string "null".
```dart
String strValue = "   Abc   ";

Text("Trim the String: ${strValue.trimString()}"),
```

### 8. convertToLowerCase
-Trims whitespace from a string and converts it to lowercase.
```dart
String strValue = "   Abc   ";

Text("Convert the message to lowerCase: ${strValue.convertToLowerCase()}"),
```

### 9. convertToPrice
-Trims whitespace from a string and formats it as a price with a specified currency sign.
```dart
String price = "2500";

Text("Convert to price: ${price.convertToPrice("₹")}"),
```

### 10. isValidEmail
-Checks if a string is a valid email using a regular expression.
```dart
final TextEditingController _emailController = TextEditingController();
String _validationMessageForEmail = "";

TextField(
  controller: _emailController,
  decoration: InputDecoration(
    filled: true,
    fillColor: Colors.white,
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(8),
    ),
    labelText: "Enter email-id",
  ),
),
ElevatedButton(
  onPressed: () {
    setState(() {
      _validationMessageForEmail = _emailController.text.isValidEmail()
          ? "Valid email-id"
          : "Invalid email-id";
    });
  },
  child: const Text("Validate Email-id"),
),
Text("Email-id validation: $_validationMessageForEmail"),//Outputs; Validation message for email-id
```

### 11. printLog
-Logs a message to the console if the message is not empty.
```dart
printLog("This is a log message");
```

### 12. printExceptionLog
-Logs an exception to the console if the exception is not null.
```dart
try {
  throw Exception("An error occurred");
} catch (ex) {
  printExceptionLog(ex);
}
```

### 13. getFileSize
-Calculates the size of a file in megabytes.
-Reads the file bytes, converts to kilobytes, and then to megabytes.
-Logs an error if an exception occurs and returns 0.
```dart
File file = File('path/to/your/file.txt');
double fileSize = Utility().getFileSize(file);
print(fileSize); // Outputs: File size in MB
```

### 14. GapSizer
-> heightGap:
-Creates a SizedBox with a height equal to the value of the number.
-Useful for adding vertical space between widgets.
-> widthGap:
-Creates a SizedBox with a width equal to the value of the number.
-Useful for adding horizontal space between widgets.
```dart
Column(
  children: [
    Text("Hello Users"),
    5.heightGap,
    Row(
      children: [
        Text("Simple text1"),
        5.widthGap,
        Text("Simple text2"),
      ],
    ),
  ],
),
```

### 15. HexColor
->fromHex:
-Creates a Color object from a hex string.
-The string can be in the format "aabbcc" or "ffaabbcc" with an optional leading "#".
-If the string is 6 characters long, it assumes full opacity (ff).
->toHex:
-Converts a Color object to a hex string.
-The string will be in the format "#aabbcc" or "aabbcc".
-The leadingHashSign parameter adds a hash sign at the beginning if set to true (default).
```dart
Container(
  padding: const EdgeInsets.all(8),
  color: HexColor.fromHex("#00ff00"),
  child: const Text("Hex color"),
),
```
