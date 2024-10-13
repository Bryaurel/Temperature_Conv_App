import 'package:flutter/material.dart';

void main() {
  runApp(TemperatureConverterApp());
}

class TemperatureConverterApp extends StatefulWidget {
  @override
  _TemperatureConverterAppState createState() => _TemperatureConverterAppState();
}

class _TemperatureConverterAppState extends State<TemperatureConverterApp> {
  ThemeMode _themeMode = ThemeMode.light; // Default theme is light

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Temperature Conversion Application',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.purple, // Set the primary swatch to green
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.purple, // AppBar background color
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20), // AppBar text color
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.purple, // Button background color
            foregroundColor: Colors.white, // Button text color
          ),
        ),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.deepPurple, // Dark theme AppBar color
          titleTextStyle: TextStyle(color: Colors.white, fontSize: 20),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white, // Button text color in dark mode
          ),
        ),
      ),
      themeMode: _themeMode, // Apply the selected theme mode
      home: TemperatureConverter(toggleTheme: _toggleTheme),
    );
  }
}

class TemperatureConverter extends StatefulWidget {
  final VoidCallback toggleTheme;

  TemperatureConverter({required this.toggleTheme});

  @override
  _TemperatureConverterState createState() => _TemperatureConverterState();
}

class _TemperatureConverterState extends State<TemperatureConverter> {
  bool isFtoC = true; // Default to Fahrenheit to Celsius
  final TextEditingController _controller = TextEditingController();
  double? convertedValue;
  List<String> conversionHistory = [];

  void convertTemperature() {
    double? input = double.tryParse(_controller.text);
    if (input == null) return;

    double result;
    String conversion;

    if (isFtoC) {
      result = (input - 32) * 5 / 9; // Fahrenheit to Celsius
      conversion = 'F to C: ${input.toStringAsFixed(1)} => ${result.toStringAsFixed(2)}';
    } else {
      result = input * 9 / 5 + 32; // Celsius to Fahrenheit
      conversion = 'C to F: ${input.toStringAsFixed(1)} => ${result.toStringAsFixed(2)}';
    }

    setState(() {
      convertedValue = result;
      conversionHistory.add(conversion);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Temperature Conversion Application'),
        actions: [
          IconButton(
            icon: Icon(Icons.brightness_6), // Theme switch icon
            onPressed: widget.toggleTheme, // Call the toggle function
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Enter temperature',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Fahrenheit to Celsius'),
                Switch(
                  value: isFtoC,
                  onChanged: (value) {
                    setState(() {
                      isFtoC = value;
                    });
                  },
                ),
                Text('Celsius to Fahrenheit'),
              ],
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: convertTemperature,
              child: Text('Convert'),
            ),
            SizedBox(height: 16),
            if (convertedValue != null)
              Text(
                'Converted Value: ${convertedValue!.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            SizedBox(height: 16),
            Text(
              'Conversion History:',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: conversionHistory.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(conversionHistory[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
