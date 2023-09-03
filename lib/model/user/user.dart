import 'package:rest_api/model/user/user_dob.dart';
import 'package:rest_api/model/user/user_location.dart';
import 'package:rest_api/model/user/user_name.dart';
import 'package:rest_api/model/user/user_picture.dart';

class User {
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;
  final UserDOB dob;
  final UserLocation location;
  final UserPicture picture;
  User({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this.name,
    required this.dob,
    required this.location,
    required this.picture,
  });

  factory User.fromMap(Map<String, dynamic> user) {
    final name = UserName.fromMap(user["name"]);
    final dob = UserDOB.fromMap(user["dob"]);
    final location = UserLocation.fromMap(user["location"]);
    final picture = UserPicture.fromMap(user["picture"]);
    return User(
      cell: user["cell"],
      email: user["email"],
      gender: user["gender"],
      phone: user["phone"],
      nat: user["nat"],
      name: name,
      dob: dob,
      location: location,
      picture: picture,
    );
  }

  String get fullName {
    return "${name.title} ${name.first} ${name.last}";
  }
}
