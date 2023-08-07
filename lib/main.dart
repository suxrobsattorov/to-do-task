import 'package:flutter/material.dart';
import 'package:to_do_task/views/screens/add_event.dart';
import 'package:to_do_task/views/screens/details_event.dart';
import 'package:to_do_task/views/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'To Do Task',
      home: DetailsEventScreen(),
    );
  }
}