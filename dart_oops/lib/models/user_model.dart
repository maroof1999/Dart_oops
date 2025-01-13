import 'package:dart_oops/models/user_bod.dart';
import 'package:dart_oops/models/user_location.dart';
import 'package:dart_oops/models/user_name.dart';
import 'package:dart_oops/models/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName userName;
  UserDateOfBirth dateOfBirth;
  UserLocation location;
  UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.userName,
    required this.dateOfBirth,
    required this.location,
    required this.picture,
  });
  factory User.fromJson(Map<String, dynamic> json) {
    final userName = UserName.fromJson(json['name']);
    final dateOfBirth = UserDateOfBirth.fromJson(json['dob']);
    final userLocation = UserLocation.fromJson(json['location']);
    final userPicture = UserPicture.fromJson(json['picture']);
    return User(
      gender: json['gender'],
      email: json['email'],
      phone: json['phone'],
      cell: json['cell'],
      nat: json['nat'],
      userName: userName,
      dateOfBirth: dateOfBirth,
      location: userLocation,
      picture: userPicture,
    );
  }
  String get fullName {
    return '${userName.title} ${userName.first} ${userName.last}';
  }
}
