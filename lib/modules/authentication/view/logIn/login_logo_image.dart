import 'package:demo/utils/device/deviceutils.dart';
import 'package:demo/utils/image_strings.dart';
import 'package:demo/utils/sizes.dart';
import 'package:demo/utils/text_strings.dart';
import 'package:flutter/material.dart';

class LoginLogoImageNTitle extends StatelessWidget {
  const LoginLogoImageNTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        padding: const EdgeInsets.only(left: 7.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image(
                  image: AssetImage(
                    TDeviceUtils.isDarkMode(context)
                        ? TImageStrings.appLogoDark
                        : TImageStrings.appLogoLight,
                  ),
                  height: TSizes.logoHeight,
                ),
              ],
            ),
            SizedBox(height: TSizes.defaultSpace),
            Text(
              TTextStrings.welcomeMessage,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Text(
              TTextStrings.loginText,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ),
    );
  }
}
