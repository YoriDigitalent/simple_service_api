import 'package:flutter/material.dart';
import 'package:simple_service_api/post.dart';

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
                  Text((post != null)
                      ? post.id +
                          " | " +
                          post.name +
                          " | " +
                          post.job +
                          " | " +
                          post.created
                      : "Tidak ada data"),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      Post.connectToApi("Badu", "IT Programmer").then((value) {
                        post = value;
                        setState(() {});
                      });
                    },
                    child: Text("Add"),
                  )
                ],
              ),
            )));
  }
}
