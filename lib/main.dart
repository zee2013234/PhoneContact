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
        appBar: AppBar(),
        body: ListView(children: const [
          Row(children: [Icon(Icons.person), Text("홍길동")]),
          Row(children: [Icon(Icons.person), Text("홍길동")]),
          Row(children: [Icon(Icons.person), Text("홍길동")]),
        ]),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: SizedBox(
        height: 50,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            Icon(Icons.phone),
            Icon(Icons.chat),
            Icon(Icons.contact_page),
          ],
        ),
      ),
    );
  }
}
