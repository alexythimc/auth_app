import 'package:demo/utils/text_strings.dart';
import 'package:flutter/material.dart';

class CopyRight extends StatelessWidget {
  const CopyRight({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      TTextStrings.copyRightText,
      style: TextStyle(fontSize: 12, color: Colors.grey),
    );
  }
}
