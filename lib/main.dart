import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("앱임"),
          centerTitle: false,
        ),
        body: Text("안녕s"),
        bottomNavigationBar: BottomAppBar(
          child: SizedBox(
            height: 100,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.phone),
                  Icon(Icons.message),
                  Icon(Icons.contact_page),
                ]),
          ),
        ),
      ),
    );
  }
}
