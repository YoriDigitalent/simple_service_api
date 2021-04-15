import 'package:flutter/material.dart';
import 'package:simple_service_api/all_user.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String output = "no data";

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
                  Text(output),
                  // ignore: deprecated_member_use
                  RaisedButton(
                    onPressed: () {
                      User.connectToAPI("2").then((users) {
                        output = " ";
                        for (int i = 0; i < users.length; i++)
                          output = output + "[ " + users[i].name + " ]";
                        setState(() {});
                      });
                    },
                    child: Text("Get All User"),
                  )
                ],
              ),
            )));
  }
}
