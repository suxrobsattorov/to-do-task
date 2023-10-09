import 'package:flutter/material.dart';
import 'package:to_do_task/views/screens/add_event.dart';

import '../../models/event.dart';
import '../screens/home.dart';

// ignore: must_be_immutable
class DetailsContainer extends StatelessWidget {
  Event event;

  DetailsContainer({
    Key? key,
    required this.event,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      height: 268,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 25),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () => Navigator.of(context)
                    .pushReplacementNamed(HomeScreen.routeName),
                child: Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushReplacementNamed(AddEventScreen.routeName, arguments: event.id);
                },
                child: Row(
                  children: [
                    Image.asset(
                      'assets/icons/edit.png',
                      height: 14,
                      width: 14,
                      fit: BoxFit.cover,
                      color: Colors.white,
                    ),
                    const Text(
                      'Edit',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 19),
          Text(
            event.name,
            style: const TextStyle(
              fontSize: 26,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            event.subName,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              const Icon(
                Icons.watch_later,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                event.time,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          // ignore: unnecessary_null_comparison
          event.location != null
              ? Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 20,
                      color: Colors.white,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      event.location,
                      style: const TextStyle(
                        fontSize: 12,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
