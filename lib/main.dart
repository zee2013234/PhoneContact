import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:contacts_service/contacts_service.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  getPermission() async {
    var status = await Permission.contacts.status;
    if (status.isGranted) {
      print('Allowed');
      var contacts = await ContactsService.getContacts();
      setState(() {
        name = contacts;
      });
    } else if (status.isDenied) {
      print("NO");
      Permission.contacts.request();
      openAppSettings();
    }
  }

  @override
  void initState() {
    super.initState();
    getPermission();
  }

  var name = [];

  var numeric = [0, 0, 0];

  addOne(text) async {
    var newPerson = Contact();
    newPerson.givenName = text;
    await ContactsService.addContact(newPerson);
    var contacts = await ContactsService.getContacts();
    setState(() {
      name = contacts;
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
            actions: [
              IconButton(
                  onPressed: () {
                    getPermission();
                  },
                  icon: Icon(Icons.contacts))
            ]),
        body: ListView.builder(
            itemCount: name.length,
            itemBuilder: (c, i) {
              return ListTile(
                  leading: Icon(Icons.person),
                  title: Text(name[i].displayName));
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
