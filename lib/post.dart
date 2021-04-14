import 'package:http/http.dart' as http;
import 'dart:convert';

class Post {
  String id;
  String name;
  String job;
  String created;

  Post({this.id, this.name, this.job, this.created});

  factory Post.addPost(Map<String, dynamic> object) {
    return Post(
        id: object['id'],
        name: object['name'],
        job: object['job'],
        created: object['createdAt']);
  }

  static Future<Post> connectToApi(String name, String job) async {
    String apiURL = "https://reqres.in/api/users";

    var apiResult = await http.post(apiURL, body: {"name": name, "job": job});

    var jsonObject = json.decode(apiResult.body);

    return Post.addPost(jsonObject);
  }
}
