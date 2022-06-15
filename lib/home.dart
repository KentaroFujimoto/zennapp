import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    // scaffoldは画面構成の基本widget
    return Scaffold(
      // 背景色
      backgroundColor: Colors.teal[100],

      // アプリ上部のコンテンツ設定
      appBar: AppBar(
        title: const Text("HOME"),
      ),

      // アプリのコンテンツ部分の設定
      body: Center(
        child: Container(
          margin: const EdgeInsets.only(top: 200),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  'Flutter練習',
                  style: Theme.of(context).textTheme.headline5,
                )
              ),
              Column(
                children: [
                  const Text(
                    'Zenn',
                    style: TextStyle(
                      fontSize: 20
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/beginner');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black
                            ),
                            child: const Text(
                              '初級',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/intermediate');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black
                            ),
                            child: const Text(
                              '中級1-4',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/intermediate5');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black
                            ),
                            child: const Text(
                              '中級5',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/advanced2');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black
                            ),
                            child: const Text(
                              '上級2',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                    ]
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    'Flutter大学',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/youtube');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black
                            ),
                            child: const Text(
                              'YouTube',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/janken');
                            },
                            style: ElevatedButton.styleFrom(
                              onPrimary: Colors.black
                            ),
                            child: const Text(
                                'じゃんけん',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            )
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(6),
                        child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).pushNamed('/firebase_auth');
                            },
                            style: ElevatedButton.styleFrom(
                                onPrimary: Colors.black
                            ),
                            child: const Text(
                              'FirebaseAuth',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                        ),
                      ),
                    ]
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(6),
                          child: ElevatedButton(
                              onPressed: () async {
                                await Navigator.of(context).pushNamed('/firebase_store');
                              },
                              style: ElevatedButton.styleFrom(
                                  onPrimary: Colors.black
                              ),
                              child: const Text(
                                'FirebaseStore',
                                style: TextStyle(
                                    color: Colors.white
                                ),
                              )
                          ),
                        ),
                      ]
                  )
                ],
              )
            ]
          ),
        )
      ),
    );
  }
}