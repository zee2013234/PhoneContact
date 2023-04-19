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
  var name = ["Hong", "Kim", "Pizza"];

  var numeric = [0, 0, 0];

  addOne(text) {
    setState(() {
      name = [...name, text];
    });
  }

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
                    return DialogUI(function: addOne);
                  });
            },
          );
        }),
        appBar: AppBar(
          title: Text(name.length.toString()),
          centerTitle: false,
        ),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (c, i) {
              return ListTile(
                  leading: Icon(Icons.person), title: Text(name[i]));
            }),
        bottomNavigationBar: BottomBar(),
      ),
    );
  }
}

class DialogUI extends StatelessWidget {
  DialogUI({Key? key, this.function}) : super(key: key);
  final function;
  var inputData = TextEditingController();

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
          TextField(controller: inputData),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text("Cancel")),
              TextButton(
                  onPressed: () {
                    function(inputData.text);
                    Navigator.pop(context);
                  },
                  child: Text("OK")),
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
