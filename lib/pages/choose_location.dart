import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key key}) : super(key: key);

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  void getData() async {
    String url = 'https://www.googleapis.com/books/v1/volumes?q={terror}';
    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      var itemCount = jsonResponse['totalItems'];
      print('Total number of books: $itemCount');
    } else {
      print('Request failed with status: ${response.statusCode}');
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    print('build funciton ran');
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose a Location'),
        backgroundColor: Colors.blue[900],
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: Text('Choose location screen $counter'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter += 1;
          });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}