import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_design_chips/bloc/authBloc/auth_bloc.dart';
import 'package:test_design_chips/ui/pages/welcome_code_page.dart';
import 'package:test_design_chips/ui/widgets/background_widget.dart';
import 'package:test_design_chips/ui/widgets/welcome_input_widget_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
              builder: (context) => const WelcomeCodePage(),
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
              content: Text(state.error??'Ошибка!'),
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
              hintText: 'Phone',
              onPressed: () {
                if (controller.text.length > 9) {
                  bloc.add(SendPhoneEvent(phoneNumber: controller.text));
                }
              },
            ),
    );
  }
}
