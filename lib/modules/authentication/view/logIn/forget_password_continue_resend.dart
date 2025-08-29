import 'package:demo/modules/authentication/viewModel/signup_controller.dart';
import 'package:demo/utils/device/deviceutils.dart';
import 'package:demo/utils/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ContinueResendButton extends StatelessWidget {
  const ContinueResendButton({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignUpController());
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
          child: SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => controller.verifyEmail(),
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(0),
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

        /// text button with resend email
        Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8),
          child: SizedBox(
            width: double.infinity,
            child: TextButton(
              //border color
              style: ButtonStyle(
                elevation: const WidgetStatePropertyAll(10),
                side: WidgetStatePropertyAll(
                  BorderSide(
                    color: TDeviceUtils.isDarkMode(context)
                        ? Colors.white
                        : Colors.black,
                    width: 1,
                  ),
                ),
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                TTextStrings.resendEmail,
                style: Theme.of(context).textTheme.titleMedium,
              ),
            ),
          ),
        ),
        //title
      ],
    );
  }
}
