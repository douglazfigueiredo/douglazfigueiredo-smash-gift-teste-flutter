import 'package:flutter/material.dart';
import 'package:frontend/app/pages/countries/countries_controller.dart';
import 'package:frontend/app/pages/countries/countries_details_page.dart';
import 'package:frontend/data/models/country.dart';
import 'package:frontend/data/repositories/countries_repository.dart';
import 'package:get/get.dart';

class CountriesPage extends StatefulWidget {
  const CountriesPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<CountriesPage> createState() => _CountriesPageState();
}

class _CountriesPageState extends State<CountriesPage> {
  late final CountriesController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CountriesController(
      repository: CountriesRepository(),
    );
    _controller.getCountries();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Obx(
        () {
          return _controller.isLoading.value
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : _controller.countries.isEmpty
                  ? const Center(
                      child: Text('No data available.'),
                    )
                  : ListView.separated(
                      separatorBuilder: (_, __) => const Divider(),
                      itemCount: _controller.countries.length,
                      itemBuilder: (_, index) {
                        Country country = _controller.countries[index];
                        return ListTile(
                          title: Text(country.countryName),
                          trailing: const Icon(Icons.chevron_right),
                          onTap: () {
                            Get.to(
                              () => CountriesDetailsPage(
                                country: country,
                              ),
                              transition: Transition.leftToRightWithFade,
                            );
                          },
                        );
                      },
                    );
        },
      ),
    );
  }
}
