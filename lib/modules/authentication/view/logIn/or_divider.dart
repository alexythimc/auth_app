import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({
    super.key,
    this.orText = "OR",
  });
  final String? orText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child:
              Text(orText!, style: Theme.of(context).textTheme.headlineMedium),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
