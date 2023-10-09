import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_task/controllers/providers/event_provider.dart';
import 'package:to_do_task/models/event.dart';
import 'package:to_do_task/views/screens/add_event.dart';
import 'package:to_do_task/views/screens/details_event.dart';
import 'package:to_do_task/views/widgets/schedule.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 25),
          child: Column(
            children: [
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 28),
                  Column(
                    children: [
                      const Text(
                        'Sunday',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 7),
                      Row(
                        children: [
                          const Text(
                            '28 September 2023',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Image.asset(
                            'assets/icons/bottom.png',
                            height: 13,
                            width: 15,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Image.asset(
                        'assets/icons/notification.png',
                        height: 28,
                        width: 28,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        margin: const EdgeInsets.only(
                          left: 17,
                          right: 1,
                          top: 1,
                        ),
                        padding: const EdgeInsets.all(1),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const CircleAvatar(
                          backgroundColor: Colors.blue,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 260,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.lightBlueAccent,
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Schedule',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      InkWell(
                        onTap: () => Navigator.of(context)
                            .pushReplacementNamed(AddEventScreen.routeName),
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 25,
                            vertical: 12,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.blue,
                          ),
                          child: const Text(
                            '+ Add Event',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  FutureBuilder(
                    future: Provider.of<EventProvider>(context, listen: false)
                        .getEvents(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      return Consumer<EventProvider>(
                        builder: (context, placeProvider, child) {
                          if (placeProvider.list.isNotEmpty) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: placeProvider.list.length,
                              itemBuilder: (context, index) {
                                Event event = placeProvider.list[index];
                                return InkWell(
                                  onTap: () => Navigator.of(context)
                                      .pushReplacementNamed(
                                    DetailsEventScreen.routeName,
                                    arguments: event,
                                  ),
                                  child: Schedule(
                                    color1: Colors.blue,
                                    color2: const Color(0xFFC6E6F6),
                                    title: event.name,
                                    subTitle: event.subName,
                                    time: event.time,
                                    location: event.location,
                                  ),
                                );
                              },
                            );
                          } else {
                            return child!;
                          }
                        },
                        child: const Center(
                          child: Text('Eventlar mavjud emas.'),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/*
                  const SizedBox(height: 20),
                  Schedule(
                    color1: Colors.red,
                    color2: const Color(0xFFF6CFC6),
                    title: 'Watching Football',
                    subTitle: "Lorem Ipsum is simply dummy text",
                    time: '17:00 - 18:30',
                  ),
                  const SizedBox(height: 20),
                  Schedule(
                    color1: Colors.orange,
                    color2: const Color(0xFFF6E3C6),
                    title: 'Watching Football',
                    subTitle: "Lorem Ipsum is simply dummy text",
                    time: '17:00 - 18:30',
                  ),
                  const SizedBox(height: 20),
                  Schedule(
                    color1: Colors.orange,
                    color2: const Color(0xFFF6E3C6),
                    title: 'Watching Football',
                    subTitle: "Lorem Ipsum is simply dummy text",
                    time: '17:00 - 18:30',
                  ),
                  const SizedBox(height: 20),
                  Schedule(
                    color1: Colors.orange,
                    color2: const Color(0xFFF6E3C6),
                    title: 'Watching Football',
                    subTitle: "Lorem Ipsum is simply dummy text",
                    time: '17:00 - 18:30',
                  ),*/
