import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/register_model.dart';

class MyFirebaseAuth extends StatefulWidget {
  const MyFirebaseAuth({Key? key}) : super(key: key);

  @override
  State<MyFirebaseAuth> createState() => _MyFirebaseAuthState();
}

class _MyFirebaseAuthState extends State<MyFirebaseAuth> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _screenSize = MediaQuery.of(context).size;
    final _formKey = GlobalKey<FormState>();

    return ChangeNotifierProvider<RegisterModel>(
      create: (BuildContext context) => RegisterModel(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            'FirebaseAuth',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Center(
          child: Consumer<RegisterModel>(builder: (context, model, child) {
            return Container(
              margin: const EdgeInsets.only(top: 100),
              width: _screenSize.width * 0.8,
              child: Column(
                children: [
                  const Text(
                    '新規登録',
                    style: TextStyle(
                        fontSize: 20
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'メールアドレス',
                            ),
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'メールアドレスを入力してください';
                              }
                              return null;
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 10),
                          child: TextFormField(
                            decoration: const InputDecoration(
                              hintText: 'パスワード',
                            ),
                            autovalidateMode: AutovalidateMode
                                .onUserInteraction,
                            validator: (String? value) {
                              if (value == null || value.isEmpty) {
                                return 'パスワードを入力してください';
                              }
                              return null;
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () async {
                            if (_formKey.currentState!.validate()) {
                              try {
                                await model.signUp;
                              } catch (e) {

                              }
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: const Color.fromRGBO(255, 228, 181, 1),
                              onPrimary: Colors.grey
                          ),
                          child: const Text(
                            '登録',
                            style: TextStyle(
                                color: Colors.black
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            );
          }),
        )
      ),
    );
  }
}
