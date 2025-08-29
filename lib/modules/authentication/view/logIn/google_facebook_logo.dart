import 'package:flutter/material.dart';

class GoogleNFacebookLogo extends StatelessWidget {
  const GoogleNFacebookLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.facebook),
          onPressed: () {},
        ),
        IconButton(
          icon: const Icon(Icons.g_mobiledata),
          onPressed: () {},
        ),
      ],
    );
  }
}
