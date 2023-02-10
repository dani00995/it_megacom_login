import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_design_chips/core/app_gradient.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: AppGradient.bgGradient),
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.center,
      child: SingleChildScrollView(
        child: SizedBox(
            width: double.infinity,
            height: 776,
            child: Stack(children: [
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
                  Center(
                    child: child,
                  )
            ])),
      ),
    );
  }
}
