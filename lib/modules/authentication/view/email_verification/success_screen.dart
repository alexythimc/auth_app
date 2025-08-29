import 'package:demo/utils/device/deviceutils.dart';
import 'package:demo/utils/image_strings.dart';
import 'package:demo/utils/sizes.dart';
import 'package:demo/utils/text_strings.dart';
import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: TSizes.appBarHeight),
            SizedBox(
              height: TDeviceUtils.screenHeight(context) * 0.4,
              width: double.infinity,
              child: Image(
                image: AssetImage(TImageStrings.emailverificationsucces),
              ),
            ),
            SizedBox(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    TTextStrings.emailVerificationSuccess,
                    style: Theme.of(context).textTheme.headlineMedium,
                  ),
                  Center(
                    child: Text(TTextStrings.emailVerificationSuccessSubtitle),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8,
                      bottom: 8,
                      top: 15,
                    ),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          elevation: const WidgetStatePropertyAll(10),
                          shape: WidgetStatePropertyAll(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                        ),
                        // text with bold font in my theme
                        child: Text("Continue", style: TextTheme().titleLarge),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
