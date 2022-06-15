import 'package:ecommerce_app/utilities/routes.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'e-commerce app',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFf4f4f4),
        primaryColor: Colors.red,
        inputDecorationTheme: InputDecorationTheme(
          hintStyle: const TextStyle(color: Colors.grey),
          labelStyle: const TextStyle(color: Colors.grey),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.grey),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Colors.red),
          ),
        ),
      ),
      onGenerateRoute: onGenerate,
      initialRoute: AppRoutes.loginPageRoute,
    );
  }
}
