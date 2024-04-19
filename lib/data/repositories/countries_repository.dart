import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:frontend/data/databases/db_firestore.dart';
import 'package:frontend/data/models/country.dart';

class CountriesRepository {
  late FirebaseFirestore _db;
  final List<Country> _countries = [];

  CountriesRepository() {
    _startRepository();
  }

  _startRepository() async {
    await _startFirestore();
  }

  _startFirestore() {
    _db = DBFirestore.get();
  }

  Future<List<Country>> getCountries() async {
    final snapshot = await _db.collection('countries').orderBy('name').get();

    for (var doc in snapshot.docs) {
      Country country = Country(
          geonameid: doc.get('geonameid'),
          name: doc.get('name'),
          countryName: doc.get('country'),
          subcountry: doc.get('subcountry'),
          cities: _getCities(snapshot, doc));
      _countries.add(country);
    }

    return _countries;
  }

  List<String> _getCities(snapshot, doc) {
    List<String> cities = [];
    for (var country in snapshot.docs) {
      if (country.get('country') == doc.get('country')) {
        cities.add(country.get('name'));
      }
    }
    return cities;
  }
}
