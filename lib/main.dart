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
              title: Row(
                children: [Text("금호동3가"), Icon(Icons.arrow_drop_down)],
              ),
              actions: const [
                SizedBox(
                  width: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.search),
                      Icon(Icons.menu),
                      Icon(Icons.notifications),
                    ],
                  ),
                ),
              ],
              centerTitle: false,
            ),
            body: SizedBox(
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Flexible(
                      flex: 3,
                      child: SizedBox(
                          height: 100,
                          child: Image(
                              image: AssetImage('assets/images/store.jpeg'))),
                    ),
                    Flexible(
                      flex: 7,
                      child: SizedBox(
                        height: 100,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: double.infinity,
                                child:
                                    Text("캐논 DSLR 100D (단렌즈, 충전기 16기가SD 포함)"),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text(
                                  "성동구 행당동 · 끌올 10분전",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              SizedBox(
                                width: double.infinity,
                                child: Text("210,000원"),
                              ),
                              Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Icon(Icons.favorite),
                                    Text("4"),
                                  ]),
                            ]),
                      ),
                    ),
                  ]),
            )));
  }
}
