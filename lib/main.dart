import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sign_in/blocs/signInBloc%20/sign_in_bloc.dart';
import 'package:flutter_bloc_sign_in/blocs/signUpBloc/sign_up_bloc.dart';
import 'package:flutter_bloc_sign_in/ui/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SignUpBloc()),
        BlocProvider(create: (context) => SignInBloc())
      ],
      child: const MaterialApp(home: SignInScreen()),
    );
  }
}
