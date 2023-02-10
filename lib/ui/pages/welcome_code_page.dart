import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_design_chips/bloc/authBloc/auth_bloc.dart';
import 'package:test_design_chips/ui/pages/home_page.dart';
import 'package:test_design_chips/ui/pages/welcome_code_page.dart';
import 'package:test_design_chips/ui/widgets/background_widget.dart';
import 'package:test_design_chips/ui/widgets/welcome_input_widget_page.dart';

class WelcomeCodePage extends StatefulWidget {
  const WelcomeCodePage({super.key});

  @override
  State<WelcomeCodePage> createState() => _WelcomeCodePageState();
}

class _WelcomeCodePageState extends State<WelcomeCodePage> {
  final controller = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<AuthBloc>(context);
    return BlocListener<AuthBloc, AuthState>(
      bloc: bloc,
      listener: (context, state) {
        if (state is AuthSucces) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.model.message ?? ''),
            ),
          );
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const HomePage(),
            ),
          );
        } else if (state is AuthLoading) {
          setState(() {
            isLoading = true;
          });
        } else if (state is AuthError) {
          setState(() {
            isLoading = false;
          });
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('Ошибка!'),
            ),
          );
        }
      },
      child: isLoading
          ? Scaffold(
              body: BackgroundWidget(
                child: CircularProgressIndicator(),
              ),
            )
          : WelcomeInputWidgetPage(
              controller: controller,
              hintText: 'Code',
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  bloc.add(SendCodeEvent(code: controller.text));
                }
              },
            ),
    );
  }
}
