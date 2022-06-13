import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'async.dart';
import 'nullSample.dart';
import 'dummy.dart';

class Intermediate extends StatefulWidget {
  const Intermediate({Key? key}) : super(key: key);
  final String title = "中級編1-4";

  @override
  State<Intermediate> createState() => _IntermediateState();
}

class _IntermediateState extends State<Intermediate> with WidgetsBindingObserver {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      print('call setState');
      _counter++;
    });
    nextPage2();
  }

  // ダミーで画面遷移を行う
  void nextPage1() async {
    {
      await Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => const DummyPage()
      ));
    }
  }

  void nextPage2() async {
    {
      await Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const DummyPage()
          )
      );
    }
  }

  void _asyncFunc() {
    Async().asynctest3();
  }

  void _nullFunc() {
    NullSample().method1();
  }

  @override
  void initState() {
    print("call initState");
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeDependencies() {
    print("call didChangeDependencies");
    super.didChangeDependencies();
  }

  @override
  void didUpdateWidget(oldWidget) {
    print("call didUpdateWidget");
    super.didUpdateWidget(oldWidget);
  }
  @override
  void deactivate() {
    print("call deactivate");
    super.deactivate();
  }
  @override
  void dispose() {
    print("call dispose");
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    print("state = $state");
    switch (state) {
      case AppLifecycleState.inactive:
        print('非アクティブになったときの処理');
        break;
      case AppLifecycleState.paused:
        print('停止されたときの処理');
        break;
      case AppLifecycleState.resumed:
        print('再開されたときの処理');
        break;
      case AppLifecycleState.detached:
        print('破棄されたときの処理');
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    print('call build');
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              key: const Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            FloatingActionButton(
              onPressed: _asyncFunc,
              child: const Text('Async'),
            ),
            FloatingActionButton(
              onPressed: _nullFunc,
              child: const Text('Null'),
            ),
            FloatingActionButton(
              key: const Key('increment'),
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
          ]
      ),
    );
  }
}
