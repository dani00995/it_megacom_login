import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_design_chips/bloc/authBloc/auth_bloc.dart';
import 'package:test_design_chips/core/app_colors.dart';
import 'package:test_design_chips/core/app_fonts.dart';
import 'package:test_design_chips/core/app_gradient.dart';
import 'package:test_design_chips/ui/widgets/background_widget.dart';

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
      body: BackgroundWidget(child: Container(
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
                            keyboardType: TextInputType.number,
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
                        child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'Are you a new user?',
                    style: AppFonts.w600s15.copyWith(color: AppColors.white),
                  ),
                  TextButton(
                      onPressed: () {}, child:  Text('Sign up',
                    style: AppFonts.w600s15.copyWith(color: AppColors.whiteBlue) ))
                ],
              )
                      )
                    ],
                  ),
                ),),
    );
  }
}
