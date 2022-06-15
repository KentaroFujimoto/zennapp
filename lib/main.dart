import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zennapp/beginner.dart';
import 'package:zennapp/dummy.dart';
import 'home.dart';
import 'intermediate.dart';
import 'intermediate5.dart';
import 'advanced2.dart';
import 'janken.dart';
import 'youtube.dart';
import 'firebase_auth.dart';
import 'firebase_store.dart';
import 'dummy.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: <String, WidgetBuilder> {
        '/': (BuildContext context) => const Home(),
        '/beginner': (BuildContext context) => const Beginner(),
        '/intermediate': (BuildContext context) => const Intermediate(),
        '/intermediate5': (BuildContext context) => const Intermediate5(),
        '/advanced2': (BuildContext context) => const Advanced2(),
        '/youtube': (BuildContext context) => const YouTube(),
        '/janken': (BuildContext context) => const Janken(),
        '/firebase_auth': (BuildContext context) => const MyFirebaseAuth(),
        '/firebase_store': (BuildContext context) => const MyFirebaseStore(),
        '/dummy': (BuildContext context) => const DummyPage(),
      },
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   bool flag = true;
//
//   final Uri url = Uri.parse("https://edge-gate.com");
//
//   void _incrementCounter() {
//     setState(() {
//       _counter++;
//       _setCounterValue();
//     });
//   }
//
//   void _getCounterValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = prefs.getInt('counter') ?? 0;
//     });
//   }
//
//   void _setCounterValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setInt('counter', _counter);
//   }
//
//   void _removeCounterValue() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _counter = 0;
//       prefs.remove('counter');
//     });
//   }
//
//   void _launchUrl() async {
//     if (!await launchUrl(
//       url,
//       mode: LaunchMode.externalApplication,
//     )) {
//       throw '$urlを開けません';
//     }
//   }
//
//   void animateButton() {
//     setState(() {
//       flag = !flag;
//     });
//   }
//
//   @override
//   void initState() {
//     super.initState();
//     _getCounterValue();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             Container( //Columnなどを装飾したい時はContainerで囲む。
//               width: 300,
//               decoration: BoxDecoration(
//                 border: Border.all(color: Colors.black)
//               ),
//               child: Column(children: [
//                 Text(
//                   'Counter',
//                   style: Theme.of(context).textTheme.headline5
//                 ),
//                 Text(
//                   '$_counter',
//                   style: Theme.of(context).textTheme.headline4,
//                 ),
//                 Row(
//                   children:[
//                     ElevatedButton(
//                       onPressed: _removeCounterValue,
//                       child: const Text("Reset"),
//                     ),
//                     FloatingActionButton(
//                       onPressed: _incrementCounter,
//                       tooltip: 'Increment',
//                       child: const Icon(Icons.add),
//                     ),
//                   ]
//                 ),
//               ]),
//             ),
//             IconButton(
//               onPressed: _launchUrl,
//               icon: const Icon(Icons.open_in_browser),
//               color: Colors.blue,
//             ),
//             Container(
//               width: 300,
//               decoration: BoxDecoration(
//                   border: Border.all(color: Colors.black)
//               ),
//               child: Column(children: [
//                 Text(
//                     'Animation',
//                   style: Theme.of(context).textTheme.headline5
//                 ),
//                 AnimatedAlign(
//                   alignment: flag ? Alignment.centerLeft : Alignment.centerRight,
//                   duration: const Duration(seconds: 1),
//                   child: ElevatedButton(
//                     onPressed: animateButton,
//                     style: ElevatedButton.styleFrom(
//                       primary: Colors.orange,
//                       onPrimary: Colors.white,
//                     ),
//                     child: const Text('Button'),
//                   ),
//                 ),
//                 AnimatedOpacity(
//                   opacity: flag ? 0 : 1.0,
//                   duration: const Duration(seconds: 1),
//                   child: const Text(
//                     "消える文字",
//                     style: TextStyle(
//                         color: Colors.green,
//                         fontSize: 20
//                     ),
//                   ),
//                 ),
//               ]),
//             )
//           ],
//         ),
//       ),
//       floatingActionButton: Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children:[
//           FloatingActionButton(
//             onPressed: (){},
//             child: const Icon(Icons.access_alarm_outlined),
//           ),
//
//           FloatingActionButton(
//             onPressed: (){
//               Navigator.pushNamed(context, '/intermediate ');
//             },
//             child: const Icon(Icons.navigate_next_outlined),
//           )
//         ]
//       ),
//     );
//   }
// }
