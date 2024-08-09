import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconly/iconly.dart';
import 'package:vikn_task/controllers/login_controller.dart';
import 'package:vikn_task/utils/constants/textstyle.dart';
import 'package:vikn_task/utils/strings/logintext.dart';
import 'package:vikn_task/widgets/button.dart';
import 'package:vikn_task/widgets/login_background_widget.dart';
import 'package:vikn_task/widgets/textformfield_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 1.2 * kToolbarHeight, 40, 20),
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              Positioned.fill(
                child: CustomPaint(
                  painter: BackgroundPainter(),
                ),
              ),
              BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 100.0, sigmaY: 100.0),
                child: Container(
                  decoration: const BoxDecoration(color: Colors.transparent),
                ),
              ),
              language(),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25.0),
                      child: Column(
                        children: [
                          Text(
                            LoginText.login,
                            style: AppText.averageWhite,
                          ),
                          const SizedBox(height: 5),
                          Text(
                            LoginText.belowLogin,
                            style: AppText.grey,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(10),
                          bottom: Radius.circular(10),
                        ),
                      ),
                      child: Column(
                        children: [
                          CustomTextFormField(
                            controller: loginController.usernameController,
                            labelText: 'Email',
                            icon: IconlyBold.user_2,
                            borderRadius: const BorderRadius.vertical(
                                top: Radius.circular(10)),
                          ),
                          CustomTextFormField(
                            controller: loginController.passwordController,
                            labelText: 'Password',
                            icon: IconlyBold.lock,
                            obscureText: true,
                            borderRadius: const BorderRadius.vertical(
                                bottom: Radius.circular(10)),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      LoginText.forgotPass,
                      style: AppText.smallBlue,
                    ),
                    const SizedBox(height: 20),
                    Obx(() {
                      return loginController.isLoading.value
                          ? const CircularProgressIndicator()
                          : SignInButton(
                              onPressed: () {
                                //  print('Sign in button pressed');
                                loginController.login();
                              },
                            );
                    }),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Column(
                  children: [
                    Text(
                      LoginText.noAccount,
                      style: AppText.smallWhite,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      LoginText.signUp,
                      style: AppText.smallBlue,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
