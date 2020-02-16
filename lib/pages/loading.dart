import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart';

class Loading extends StatefulWidget {
  Loading({Key key}) : super(key: key);

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getData() async {
    String url = 'https://jsonplaceholder.typicode.com/todos/1';
    Response response = await get(url);

    if (response.statusCode == 200) {
      Map jsonResponse = convert.jsonDecode(response.body);
      print(jsonResponse);
      print(jsonResponse['userId']);
    } else {
      print('Error with status ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading Screen'),
    );
  }
}