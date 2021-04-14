import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.getUser(Map<String, dynamic> object) {
    return User(
        id: object['id'],
        name: object['first_name'] + " " + object['last_name']);
  }

  static Future<User> connectToAPI(String id) async {
    String apiURL = "https://reqres.in/api/uses" + id;

    var apiResult = await http.get(apiURL);
    var jsonData = json.decode(apiResult.body);
    var userData = (jsonData as Map<String, dynamic>)['data'];

    return User.getUser(userData);
  }
}
