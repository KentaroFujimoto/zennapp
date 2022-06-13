import 'dart:async';
import 'package:flutter/material.dart';
import 'package:zennapp/intermediate.dart';
import 'BussinessLogic.dart';

class Intermediate5 extends StatefulWidget {
  const Intermediate5({Key? key}) : super(key: key);
  final String title = "中級編5";

  @override
  State<Intermediate5> createState() => _Intermediate5State();
}

class _Intermediate5State extends State<Intermediate5> {
  int _counter = 0;

  //Streamを制御するコントローラ定義。コントローラはStateクラスで定義する。
  var intStream = StreamController<int>();
  var stringStream = StreamController<String>.broadcast();

  var generator = Generator();
  var coordinator = Coordinator();
  var consumer = Consumer();
  
  int? ramdom_int = 0;

  void _incrementCounter() {
    generator.generate();
    setState(() {
      _counter++;
    });
  }

  @override
  void initState() {
    generator.init(intStream);
    coordinator.init(intStream, stringStream);
    consumer.init(stringStream);
    coordinator.coordinate();
    consumer.consume();
    super.initState();
  }

  @override
  void dispose() {
    intStream.close();
    stringStream.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              key: Key('counter'),
              style: Theme.of(context).textTheme.headline4,
            ),
            StreamBuilder<String>(
              stream: stringStream.stream,
              initialData: "",
              builder: (context, snapshot) {
                return Text(
                  'RANDOM : ${snapshot.data}',
                  style: Theme.of(context).textTheme.headline4,
                );
              },
            ),
            Text('$ramdom_int')
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        key: const Key('increment'),
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}