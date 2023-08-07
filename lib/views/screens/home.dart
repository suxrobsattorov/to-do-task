import 'package:flutter/material.dart';
import 'package:to_do_task/views/widgets/schedule.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const SizedBox(width: 28),
                Column(
                  children: [
                    Text(
                      'Sunday',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 7),
                    Row(
                      children: [
                        Text(
                          '28 September 2023',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
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
                    Container(
                      child: Image.asset(
                        'assets/icons/notification.png',
                        height: 28,
                        width: 28,
                      ),
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
                        child: CircleAvatar(
                          backgroundColor: Colors.blue,
                        )),
                  ],
                )
              ],
            ),
            const SizedBox(height: 20),
            Container(
              height: 270,
              width: double.infinity,
              color: Colors.lightBlueAccent,
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
                        fontSize: 24,
                        fontWeight: FontWeight.w800,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.blue,
                      ),
                      child: const Text(
                        '+ Add Event',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Schedule(
                  color1: Colors.blue,
                  color2: const Color(0xFFC6E6F6),
                  title: 'Watching Football',
                  subTitle:
                      "Lorem Ipsum is simply dummy text",
                  time: '17:00 - 18:30',
                  location: 'Stamford Bridge',
                ),
                const SizedBox(height: 20),
                Schedule(
                  color1: Colors.red,
                  color2: const Color(0xFFF6CFC6),
                  title: 'Watching Football',
                  subTitle:
                      "Lorem Ipsum is simply dummy text",
                  time: '17:00 - 18:30',
                ),
                const SizedBox(height: 20),
                Schedule(
                  color1: Colors.orange,
                  color2: const Color(0xFFF6E3C6),
                  title: 'Watching Football',
                  subTitle:
                      "Lorem Ipsum is simply dummy text",
                  time: '17:00 - 18:30',
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
