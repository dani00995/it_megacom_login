import 'package:flutter/material.dart';
import 'package:test_design_chips/ui/pages/welcome_code_page.dart';
import 'package:test_design_chips/ui/widgets/welcome_input_widget_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _HomePageState();
}

class _HomePageState extends State<WelcomePage> {
  final controller = TextEditingController();
  
  
@override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return     WelcomeInputWidgetPage(controller: controller, hintText: 'Phone',onPressed: (){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>WelcomeCodePage()));
    },);

  }
}

