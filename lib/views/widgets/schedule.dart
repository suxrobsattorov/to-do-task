import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Schedule extends StatelessWidget {
  Color color1;
  Color color2;
  String title, subTitle, time;
  String? location;

  Schedule({
    Key? key,
    required this.color1,
    required this.color2,
    required this.title,
    required this.subTitle,
    required this.time,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 10,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color1,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
          ),
        ),
        Container(
          padding: const EdgeInsets.all(7),
          height: 95,
          width: double.infinity,
          decoration: BoxDecoration(
            color: color2,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: color1,
                ),
              ),
              Text(
                subTitle,
                style: TextStyle(
                  fontSize: 12,
                  color: color1,
                ),
              ),
              Row(
                children: [
                  Icon(
                    Icons.watch_later,
                    size: 20,
                    color: color1,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      fontSize: 14,
                      color: color1,
                    ),
                  ),
                  location != null
                      ? Row(
                          children: [
                            const SizedBox(width: 20),
                            Icon(
                              Icons.location_on,
                              size: 20,
                              color: color1,
                            ),
                            Text(
                              location!,
                              style: TextStyle(
                                fontSize: 14,
                                color: color1,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}
