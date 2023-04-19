import 'dart:ffi';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var numeric = [0, 0, 0];
  var name = ['Kim', 'Hong', 'Pizza'];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: () {
            setState(() {
              a++;
            });
            print(a);
          },
        ),
        appBar: AppBar(
          title: Text('연락처앱'),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (c, i) {
              return ListTile(
                  leading: Text(numeric[i].toString()),
                  title: Text(name[i]),
                  trailing: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          numeric[i]++;
                        });
                      },
                      child: Text("Like")));
            }),
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
