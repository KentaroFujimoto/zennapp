import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class MyFirebaseStore extends StatefulWidget {
  const MyFirebaseStore({Key? key}) : super(key: key);

  @override
  State<MyFirebaseStore> createState() => _MyFirebaseStoreState();
}

class _MyFirebaseStoreState extends State<MyFirebaseStore> {
  final Stream<QuerySnapshot> _tasksStream = FirebaseFirestore.instance.collection('tasks').snapshots();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            'FirebaseStore',
            style: TextStyle(
                fontWeight: FontWeight.bold
            ),
          ),
          backgroundColor: Colors.black87,
        ),
        body: Center(
          child: StreamBuilder<QuerySnapshot>(
            stream: _tasksStream,
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.hasError) {
                return Text('Something went wrong');
              }

              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text("Loading");
              }

              return ListView(
                children: snapshot.data!.docs.map((DocumentSnapshot document) {
                  Map<String, dynamic> data = document.data()! as Map<String, dynamic>;
                  return ListTile(
                    title: Text(data['title']),
                    subtitle: Text(data['content']),
                  );
                }).toList(),
              );
            },
          )
        )
    );
  }
}
