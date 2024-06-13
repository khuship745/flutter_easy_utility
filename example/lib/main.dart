import "package:flutter/material.dart";
import "package:flutter_easy_utility/flutter_easy_utility.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Easy Utility Example",
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _mobileController = TextEditingController();

  String strValue = "   Abc   ";
  int iValue = 56;
  double dValue = 9925.56;
  String price = "2500";
  String _validationMessageForNumber = "";
  String _validationMessageForEmail = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Flutter Easy Utility Example"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              10.heightGap,
              //String value
              Text("Converted String to String: ${strValue.convertToString()}"),
              Text("Converted String to Int: ${strValue.convertToInt()}"),
              Text("Converted String to Double: ${strValue.convertToDouble()}"),
              20.heightGap,
              //Int value
              Text("Converted Int to Int: ${iValue.convertToInt()}"),
              Text("Converted Int to String: ${iValue.convertToString()}"),
              Text("Converted Int to Double: ${iValue.convertToDouble()}"),
              20.heightGap,
              //Double value
              Text("Converted Double to Double: ${dValue.convertToDouble()}"),
              Text("Converted Double to String: ${dValue.convertToString()}"),
              Text("Converted Double to Int: ${dValue.convertToInt()}"),
              20.heightGap,
              Text(
                  "Check the message emptyOrNull: ${strValue.isEmptyOrNull()}"),
              Text(
                  "Check the message isNotEmptyAndNotNull: ${strValue.isNotEmptyAndNotNull()}"),
              Text("Trim the String: ${strValue.trimString()}"),
              Text(
                  "Convert the message to lowerCase: ${strValue.convertToLowerCase()}"),
              Text("Convert to price: ${price.convertToPrice("₹")}"),
              20.heightGap,
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
              5.heightGap,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _validationMessageForEmail =
                    _emailController.text.isValidEmail()
                        ? "Valid email-id"
                        : "Invalid email-id";
                  });
                },
                child: const Text("Validate Email-id"),
              ),
              5.heightGap,
              Text("Email-id validation: $_validationMessageForEmail"),
              20.heightGap,
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
              5.heightGap,
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _validationMessageForNumber =
                    _mobileController.text.isValidMobileNumber()
                        ? "Valid mobile number"
                        : "Invalid mobile number";
                  });
                },
                child: const Text("Validate Mobile Number"),
              ),
              5.heightGap,
              Text("Mobile number validation: $_validationMessageForNumber"),
              20.heightGap,
              Container(
                padding: const EdgeInsets.all(8),
                color: HexColor.fromHex("#00ff00"),
                child: const Text("Hex color"),
              ),
              10.heightGap,
            ],
          ),
        ),
      ),
    );
  }
}
