import 'package:flutter/material.dart';
import 'package:test_design_chips/core/app_colors.dart';
import 'package:test_design_chips/core/app_fonts.dart';
import 'package:test_design_chips/core/app_gradient.dart';

class WelcomeInputWidgetPage extends StatelessWidget {
  const WelcomeInputWidgetPage({
    super.key,
    required this.controller,
    required this.hintText,
    this.buttonText = 'Sign In',
    this.onPressed,
  });
  final TextEditingController controller;
  final String hintText;
  final String buttonText;
  final Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Container(
          decoration: BoxDecoration(gradient: AppGradient.bgGradient),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: SizedBox(
              width: double.infinity,
              height: 776,
              child: Stack(
                children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(-41.54 / 360),
                        child: Container(
                          width: 215,
                          height: 215,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppGradient.elseBgGradient,
                              boxShadow: [BoxShadow(blurRadius: 0)]),
                        ),
                      )),
                  Positioned(
                      top: 480,
                      right: 0,
                      child: RotationTransition(
                        turns: AlwaysStoppedAnimation(53 / 360),
                        child: Container(
                          width: 287,
                          height: 287,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: AppGradient.elseBgGradient,
                              boxShadow: [BoxShadow(blurRadius: 0)]),
                        ),
                      )),
                  Positioned(
                      top: 100,
                      left: 0,
                      right: 0,
                      child: Container(
                        width: double.infinity,
                        height: 565,
                        decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                  blurRadius: 4,
                                  color: AppColors.white.withOpacity(0.15)),
                            ],
                            border: Border.all(
                                width: 1,
                                color: AppColors.white.withOpacity(0.35)),
                            borderRadius: BorderRadius.circular(40),
                            gradient: AppGradient.whiteBgGradient),
                        child: Column(
                          children: [
                            SizedBox(
                              height: 23,
                            ),
                            Text(
                              "Welcome",
                              style: AppFonts.w600s25
                                  .copyWith(color: AppColors.white),
                            ),
                            SizedBox(
                              height: 139,
                            ),
                            Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: 309,
                                height: 57,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(14),
                                    color: AppColors.white.withOpacity(0.20)),
                                child: TextField(
                                  controller: controller,
                                  cursorColor: AppColors.white,
                                  style: AppFonts.w600s15
                                      .copyWith(color: AppColors.white),
                                  decoration: InputDecoration(
                                      hintText: hintText,
                                      hintStyle: AppFonts.w600s15
                                          .copyWith(color: AppColors.white),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 0, horizontal: 30),
                                      border: InputBorder.none,
                                      focusedBorder: InputBorder.none,
                                      enabledBorder: InputBorder.none,
                                      errorBorder: InputBorder.none),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 102,
                            ),
                            Center(
                              child: Container(
                                width: 121,
                                height: 57,
                                child: ElevatedButton(
                                  style: ButtonStyle(
                                      shadowColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          return AppColors.white
                                              .withOpacity(0.1);
                                        },
                                      ),
                                      backgroundColor: MaterialStateProperty
                                          .resolveWith<Color?>(
                                        (Set<MaterialState> states) {
                                          return AppColors.white
                                              .withOpacity(0.20);
                                        },
                                      ),
                                      shape: MaterialStateProperty.all<
                                              RoundedRectangleBorder>(
                                          RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(14.0),
                                      ))),
                                  onPressed: onPressed,
                                  child: Text(
                                    buttonText,
                                    style: AppFonts.w600s15
                                        .copyWith(color: AppColors.white),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 107,
                            ),
                            Center(
                              child: RichText(
                                text: TextSpan(children: [
                                  TextSpan(
                                      text: 'Are you a new user? ',
                                      style: AppFonts.w600s15
                                          .copyWith(color: AppColors.white)),
                                  TextSpan(
                                      text: 'Sign Up',
                                      style: AppFonts.w600s15.copyWith(
                                          color: AppColors.whiteBlue)),
                                ]),
                              ),
                            )
                          ],
                        ),
                      ))
                ],
              ),
            ),
          )),
    );
  }
}
