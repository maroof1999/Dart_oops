class UserLocation {
  final String city;
  final String state;
  final String country;
  final UserStreet street;
  final String postcode;
  final UserCoordinates coordinates;
  final UserTimezone timezone;
  UserLocation({
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
  });
  factory UserLocation.fromJson(Map<String, dynamic> json) {
    final userTimezone = UserTimezone(
      offset: json['timezone']['offset'],
      description: json['timezone']['description'],
    );
    final userStreet = UserStreet(
      number: json['street']['number'],
      name: json['street']['name'],
    );
    final userCoordinates = UserCoordinates(
      latitude: json['coordinates']['latitude'],
      longitude: json['coordinates']['longitude'],
    );
    return UserLocation(
      city: json['city'],
      state: json['state'],
      country: json['country'],
      postcode: json['postcode'].toString(),
      street: userStreet,
      coordinates: userCoordinates,
      timezone: userTimezone,
    );
  }
}

class UserStreet {
  final int number;
  final String name;
  UserStreet({
    required this.number,
    required this.name,
  });
  factory UserStreet.fromJson(Map<String, dynamic> json) {
    return UserStreet(
      number: json['number'],
      name: json['name'],
    );
  }
}

class UserCoordinates {
  final String latitude;
  final String longitude;
  UserCoordinates({
    required this.latitude,
    required this.longitude,
  });
  factory UserCoordinates.fromJson(Map<String, dynamic> json) {
    return UserCoordinates(
      latitude: json['latitude'],
      longitude: json['longitude'],
    );
  }
}

class UserTimezone {
  final String offset;
  final String description;
  UserTimezone({
    required this.offset,
    required this.description,
  });
  factory UserTimezone.fromJson(Map<String, dynamic> json) {
    return UserTimezone(
      offset: json['offset'],
      description: json['description'],
    );
  }
}

