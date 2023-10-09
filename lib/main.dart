import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/controllers/providers/event_provider.dart';
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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => EventProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'To Do Task',
        initialRoute: '/home',
        routes: {
          HomeScreen.routeName: (context) => const HomeScreen(),
          AddEventScreen.routeName: (context) => const AddEventScreen(),
          DetailsEventScreen.routeName: (context) => const DetailsEventScreen(),
        },
      ),
    );
  }
}
