import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_design_chips/bloc/authBloc/auth_bloc.dart';
import 'package:test_design_chips/data/repository/auth_repo.dart';
import 'package:test_design_chips/data/repository/dio_settings.dart';
import 'package:test_design_chips/ui/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
          create: (context) => DioSettings(),
        ),
        RepositoryProvider(
          create: (context) => AuthRepo(
            dio: RepositoryProvider.of<DioSettings>(context).dio,
          ),
        ),
      ],
      child: BlocProvider(
        create: (context) => AuthBloc(
          repo: RepositoryProvider.of<AuthRepo>(context),
        ),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: WelcomePage(),
        ),
      ),
    );
  }
}