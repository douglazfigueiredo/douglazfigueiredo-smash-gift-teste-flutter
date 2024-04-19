import 'package:frontend/data/models/country.dart';
import 'package:frontend/data/repositories/countries_repository.dart';
import 'package:get/get.dart';

class CountriesController extends GetxController {
  final CountriesRepository repository;

  final List<Country> _countries = <Country>[].obs;
  List<Country> get countries => _countries;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  CountriesController({required this.repository});

  getCountries() async {
    _isLoading.value = true;

    final listAll = await repository.getCountries();

    Set<String> uniqueCountryNames = {};

    for (var country in listAll) {
      if (!uniqueCountryNames.contains(country.countryName)) {
        uniqueCountryNames.add(country.countryName);
        _countries.add(country);
      }
    }

    _isLoading.value = false;
  }
}
