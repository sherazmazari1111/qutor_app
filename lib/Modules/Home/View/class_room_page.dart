import 'package:flutter/material.dart';

class ClassRoomPage extends StatefulWidget {
  const ClassRoomPage({Key? key}) : super(key: key);

  @override
  State<ClassRoomPage> createState() => _ClassRoomPageState();
}

class _ClassRoomPageState extends State<ClassRoomPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ClassRoom"),
        backgroundColor:Color.fromARGB(255, 24, 171, 136),

      ),
    );
  }
}
