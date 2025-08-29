import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

import 'continue_resend.dart';
import 'verification_title_subtitle.dart';

class Emailverificationscreen extends StatelessWidget {
  const Emailverificationscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Get.offAllNamed('/login'),
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
              VerifcationTitleNsubtitle(),
              ContinueResendButton(),
            ],
          ),
        ),
      ),
    );
  }
}
