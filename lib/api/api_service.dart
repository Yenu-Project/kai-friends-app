import 'dart:convert';

import 'package:http/http.dart' show Client;

// TODO: temporary Profile for testing. Will move to models
class Profile {
  int id;
  String username;
  String email;

  Profile({required this.id, required this.username, required this.email});

  factory Profile.fromJson(Map<String, dynamic> map) {
    return Profile(
        id: map['user_id'], username: map['username'], email: map['email']);
  }

  @override
  String toString() {
    return 'Profile {user_id: $id, username: $username, email: $email}';
  }
}

Profile profileFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return Profile.fromJson(data);
}

class ApiService {
  final String baseUrl = 'http://localhost:9000/api';
  final int userId = 1; // TODO: enable user login
  Client client = Client();

  Future<Profile> getUserProfile() async {
    // TODO: research proper error handling methods
    final response =
        await client.get(Uri.parse('$baseUrl/userprofiles/$userId/'));

    if (response.statusCode == 200) {
      return profileFromJson(response.body);
    } else {
      return Profile(id: -1, username: 'Not found', email: 'Not found');
    }
  }
}
