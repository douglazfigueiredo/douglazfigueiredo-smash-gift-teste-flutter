import 'package:flutter/material.dart';
import 'package:frontend/app/pages/countries/countries_page.dart';
import 'package:get/get_navigation/get_navigation.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Smash Gift',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
      home: const CountriesPage(title: 'Countries'),
    );
  }
}
