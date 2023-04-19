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
        floatingActionButton: Builder(builder: (context) {
          return FloatingActionButton(
            onPressed: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return DialogUI();
                  });
            },
          );
        }),
        appBar: AppBar(),
        body: ListView.builder(
            itemCount: 3,
            itemBuilder: (c, i) {
              return ListTile(leading: Icon(Icons.person), title: Text("홍길동"));
            }),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  const DialogUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        child: Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Contact",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600)),
          TextField(),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
              TextButton(onPressed: () {}, child: Text("OK")),
            ],
          )
        ],
      ),
    ));
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
