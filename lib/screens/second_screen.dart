import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_objectbox_state/main.dart';
import 'package:flutter_objectbox_state/models/student.dart';

// A second screen to use the database and stream again:

class SecondScreen extends StatefulWidget {
  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  // This doesnt work, stream has already been listened to:
  final _listControllerStudent = StreamController<List<Student>>(sync: true);

  @override
  void initState() {
    super.initState();
    setState(() {
      // use the objectbox singleton from main file
      _listControllerStudent
          .addStream(objectBox.queryStream.map((q) => q.find()));
    });
  }

  @override
  void dispose() {
    _listControllerStudent.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_forward_sharp),
            onPressed: () {
              Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          )
        ],
      ),
      body: StreamBuilder<List<Student>>(
        stream: _listControllerStudent.stream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.hasData ? snapshot.data!.length : 0,
            itemBuilder: _itemBuilder(snapshot.data ?? []),
          );
        },
      ),
    );
  }

  ListTile Function(BuildContext, int) _itemBuilder(List<Student> students) =>
      (BuildContext context, int index) => ListTile(
            title: Text(students[index].name),
          );
}
