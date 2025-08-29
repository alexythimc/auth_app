import 'package:demo/modules/authentication/view/logIn/password_verification_title_subtitle.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import 'forget_password_continue_resend.dart';

class ForgotPasswordEmailVerification extends StatelessWidget {
  const ForgotPasswordEmailVerification({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Iconsax.close_circle),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              //image

              /// title
              PasswordVerificationTitleSubtitle(),
              ContinueResendButton(),
            ],
          ),
        ),
      ),
    );
  }
}
