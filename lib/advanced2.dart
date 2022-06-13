import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zennapp/statefulTile.dart';

class Advanced2 extends StatefulWidget {
  const Advanced2({Key? key}) : super(key: key);
  final String title = "上級編2";

  @override
  State<Advanced2> createState() => _Advanced2State();
}

class _Advanced2State extends State<Advanced2> {
  late List<Widget> tiles;

  @override
  void initState() {
    super.initState();
    //2つのStatefulWidgetが準備
    tiles = [
      StatefulTile(key: UniqueKey()),
      StatefulTile(key: UniqueKey()),
    ];
  }
  // 入れ替え処理
  void changeTiles() {
    setState(() {
      tiles.insert(1, tiles.removeAt(0));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Row(children: tiles),
      floatingActionButton: FloatingActionButton(
        onPressed: changeTiles,
        child: Icon(Icons.add),
      ),
    );
  }
}
