class Country {
  String geonameid;
  String name;
  String countryName;
  String subcountry;
  List<String> cities;

  Country({
    required this.geonameid,
    required this.name,
    required this.countryName,
    required this.subcountry,
    required this.cities,
  });
}
