import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test_design_chips/ui/pages/welcome_page.dart';
import 'package:test_design_chips/ui/widgets/welcome_input_widget_page.dart';

class WelcomeCodePage extends StatefulWidget {
  const WelcomeCodePage({super.key});

  @override
  State<WelcomeCodePage> createState() => _WelcomeCodePageState();
}

class _WelcomeCodePageState extends State<WelcomeCodePage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  WelcomeInputWidgetPage(controller: controller, hintText: 'Code',onPressed: (){
            Navigator.pop(context);

    },);
  }
}