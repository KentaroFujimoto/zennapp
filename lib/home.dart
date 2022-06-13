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
          margin: const EdgeInsets.only(top: 240),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(20),
                child: Text(
                  'ZennのFlutter講座',
                  style: Theme.of(context).textTheme.headline5,
                )
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: FloatingActionButton(
                        onPressed: () async {
                          await Navigator.of(context).pushNamed('/beginner');
                        },
                        child: const Text('初級')
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: FloatingActionButton(
                        onPressed: () async {
                          await Navigator.of(context).pushNamed('/intermediate');
                        },
                        child: const Text('中級1-4')
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: FloatingActionButton(
                        onPressed: () async {
                          await Navigator.of(context).pushNamed('/intermediate5');
                        },
                        child: const Text('中級5')
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(6),
                    child: FloatingActionButton(
                        onPressed: () async {
                          await Navigator.of(context).pushNamed('/advanced2');
                        },
                        child: const Text('上級2')
                    ),
                  ),
                ]
              )
            ]
          ),
        )
      ),
    );
  }
}