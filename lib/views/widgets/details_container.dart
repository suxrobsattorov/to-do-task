import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsContainer extends StatelessWidget {
  String title, subTitle, time;
  String? location;

  DetailsContainer({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.time,
    this.location,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      height: 260,
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
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white,
                ),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.chevron_left,
                    color: Colors.black,
                    size: 35,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
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
            title,
            style: const TextStyle(
              fontSize: 32,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            subTitle,
            style: const TextStyle(
              fontSize: 12,
              color: Colors.white,
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
                time,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          location != null
              ? Row(
            children: [
              const Icon(
                Icons.location_on,
                size: 20,
                color: Colors.white,
              ),
              const SizedBox(width: 5),
              Text(
                location!,
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
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
