import 'package:flutter/material.dart';
import 'package:simple_service_api/post.dart';
import 'package:simple_service_api/user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // ignore: avoid_init_to_null
  Post post = null;
  // ignore: avoid_init_to_null
  User user = null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(
              title: Text("API CRUD Flutter Demo"),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text((user != null)
                      ? user.id + " | " + user.name
                      : "Tidak ada data"),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      User.connectToAPI("10").then((value) {
                        user = value;
                        setState(() {});
                      });
                    },
                    child: Text("Get User"),
                  )
                ],
              ),
            )));
  }
}
