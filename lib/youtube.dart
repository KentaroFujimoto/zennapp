import 'package:flutter/material.dart';

class YouTube extends StatefulWidget {
  const YouTube({Key? key}) : super(key: key);
  final String title = "エンジニアSiGMa";

  @override
  State<YouTube> createState() => _YouTubeState();
}

class _YouTubeState extends State<YouTube> {
  // final List<Map<String, String>> entries = [
  //   {'image': 'https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2020/02/flutter.png','title': 'Flutter勉強'},
  //   {'image': 'https://www.kurume-it.ac.jp/style/wp-content/uploads/2019/04/code-1839406_1280-718x479.jpg', 'title': 'アプリ開発'},
  //   {'image': 'https://a0.awsstatic.com/libra-css/images/logos/aws_logo_smile_1200x630.png', 'title': 'AWS構築'}
  // ];
  final List<String> entries = [
    'Flutter大学 アプリを作ってみよう', '技術マウントを取る熱いエンジニアさんへのメッセージ', '僕らは今何をすべきか'
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black87,
        actions: [
          const Icon(Icons.add),
          const SizedBox(width: 22),
          const Icon(Icons.search),
          const SizedBox(width: 22),
          const Icon(Icons.laptop)
        ],
      ),
      body: Container(
        color: Colors.black87,
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          itemCount: entries.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: EdgeInsets.only(bottom: 20),
              width: double.infinity,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.network(
                    'https://cdn-ssl-devio-img.classmethod.jp/wp-content/uploads/2020/02/flutter.png',
                    width: 140,
                  ),
                  const SizedBox(
                      width: 16
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entries[index],
                          style: const TextStyle(
                            height: 1.2,
                            color: Colors.white,
                            fontSize: 16
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: const [
                            Text(
                              '1000回視聴',
                              style: TextStyle(
                                color: Colors.white
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Text(
                              '5日前',
                              style: TextStyle(
                                  color: Colors.white
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
