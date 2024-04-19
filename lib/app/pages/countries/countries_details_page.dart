import 'package:flutter/material.dart';
import 'package:frontend/data/models/country.dart';

class CountriesDetailsPage extends StatefulWidget {
  final Country country;
  const CountriesDetailsPage({super.key, required this.country});

  @override
  State<CountriesDetailsPage> createState() => _CountriesDetailsPageState();
}

class _CountriesDetailsPageState extends State<CountriesDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cities | ${widget.country.countryName}"),
      ),
      body: ListView.separated(
        separatorBuilder: (_, __) => const Divider(),
        itemCount: widget.country.cities.length,
        itemBuilder: (_, index) {
          String city = widget.country.cities[index];
          return ListTile(
            title: Text(
              city,
            ),
          );
        },
      ),
    );
  }
}
