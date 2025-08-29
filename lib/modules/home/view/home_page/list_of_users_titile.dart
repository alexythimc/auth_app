import 'package:flutter/material.dart';

class ListOfUsersTitle extends StatelessWidget {
  const ListOfUsersTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      width: double.infinity,
      height: 80,
      decoration: BoxDecoration(
        color: const Color.fromRGBO(23, 47, 73, 1.0),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        "List of Users",
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
