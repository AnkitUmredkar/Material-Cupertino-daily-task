import 'package:flutter/material.dart';
import 'package:platform_converter_app/task1/provider/task1_provider.dart';
import 'package:platform_converter_app/task1/view/screens/task1.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Task1Provider(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          datePickerTheme: const DatePickerThemeData(),
          colorScheme: const ColorScheme.light(
            primary: Colors.blue,
            onSurface: Colors.black
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: const Task1(),
      ),
    );
  }
}
