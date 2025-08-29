import 'package:demo/utils/device/deviceutils.dart';
import 'package:demo/utils/image_strings.dart';
import 'package:flutter/material.dart';

class VerificationImage extends StatelessWidget {
  const VerificationImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TDeviceUtils.screenHeight(context) * 0.5,
      child: Image(image: AssetImage(TImageStrings.emailverification)),
    );
  }
}
