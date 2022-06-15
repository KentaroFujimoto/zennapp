import 'dart:math';
import 'package:flutter/material.dart';


class Janken extends StatefulWidget {
  const Janken({Key? key}) : super(key: key);

  @override
  State<Janken> createState() => _JankenState();
}

class _JankenState extends State<Janken> {
  int myHand = 3;
  int computerHand = 3;
  List<String> hands = ['✊', '✌️', '✋', ''];
  String result = '';

  void janken(int selectHand) {
    myHand = selectHand;
    generateHand();
    judge();
    setState((){});
  }

  void generateHand() {
    final int randomNumber = Random().nextInt(3);
    computerHand = randomNumber;
  }

  void judge() {
    if (myHand == computerHand) {
      result = '引き分け';
    } else if (myHand == 1 && computerHand == 2 || myHand == 2 && computerHand == 3 || myHand == 3 && computerHand == 1) {
      result = '勝ち';
    } else {
      result = '負け';
    }
  }

  void resetHands() {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('じゃんけん'),
      ),
      body: Container(
        padding: const EdgeInsets.only(
            top: 200, left: 60, right: 60
        ),
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(bottom: 30, left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('結果は...'),
                  Text(
                    result,
                    style: const TextStyle(
                      fontSize: 20
                    ),
                  ),
                  const Text('です!'),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  const Text(
                    'コンピュータ',
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  Text(
                    hands[computerHand],
                    style: const TextStyle(
                        fontSize: 40
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 30),
              child: Column(
                children: [
                  const Text(
                    'プレイヤー',
                    style: TextStyle(
                        fontSize: 22
                    ),
                  ),
                  Text(
                    hands[myHand],
                    style: const TextStyle(
                      fontSize: 40
                    ),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                      janken(0);
                    }, //引数ある関数使う時は(){}必要。
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      onPrimary: Colors.white,
                    ),
                    child: const Text(
                      '✊',
                      style: TextStyle(
                        fontSize: 22
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                      janken(1);
                    },
                    child: const Text(
                      '✌️',
                      style: TextStyle(
                          fontSize: 22
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 80,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: (){
                      janken(2);
                    },
                    child: const Text(
                      '✋',
                      style: TextStyle(
                          fontSize: 22
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
