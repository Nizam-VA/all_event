class Venue {
  final String street;
  final String city;
  final String state;
  final String country;
  final double latitude;
  final double longitude;
  final String fullAddress;

  Venue({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.latitude,
    required this.longitude,
    required this.fullAddress,
  });

  factory Venue.fromJson(Map<String, dynamic> json) {
    return Venue(
      street: json['street'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      latitude: json['latitude'],
      longitude: json['longitude'],
      fullAddress: json['full_address'],
    );
  }

  Map<String, dynamic> toJson(Venue venue) {
    final Map<String, dynamic> data = {
      'street': venue.street,
      'city': venue.city,
      'state': venue.state,
      'country': venue.country,
      'latitude': venue.latitude,
      'longitude': venue.longitude,
      'full_address': venue.fullAddress,
    };
    return data;
  }
}
