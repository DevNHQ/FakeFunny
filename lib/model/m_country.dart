class MCountry {
  late String country;
  late String imageCountry;
  late String key;

  MCountry({required this.country,required this.imageCountry,required this.key});

  MCountry.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    imageCountry = json['image_country'];
    key = json['key'];
  }
}