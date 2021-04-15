import 'dart:convert';
import 'package:http/http.dart' as http;

class User {
  String id;
  String name;

  User({this.id, this.name});

  factory User.getAllUser(Map<String, dynamic> object) {
    return User(
        id: object['id'].toString(),
        name: object['first_name'] + " " + object['last_name']);
  }

  // ignore: missing_return
  static Future<List<User>> connectToAPI(String page) async {
    String apiURL = "https://reqres.in/api/users?page=" + page;

    var apiResult = await http.get(apiURL);
    var jsonData = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonData as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++)
      users.add(User.getAllUser(listUser[1]));
  }
}
