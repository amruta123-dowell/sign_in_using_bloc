import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sign_in/blocs/signInBloc%20/sign_in_bloc.dart';
import 'package:flutter_bloc_sign_in/custom_widgets/text_field_widget.dart';
import 'package:flutter_bloc_sign_in/enumaration/sign_in_status_enum.dart';
import 'package:flutter_bloc_sign_in/ui/home_screen.dart';
import 'package:flutter_bloc_sign_in/ui/sign_up_screen.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController passwordController = TextEditingController();
    TextEditingController userIdController = TextEditingController();

    return BlocConsumer<SignInBloc, SignInAddState>(
      listener: (context, state) {
        if (state.signInStatus == SignInStatus.success) {
          Navigator.pushNamed(context, "/homeScreen",
              arguments: {"userId": state.userId});
          // Navigator.push(
          //     context,
          //     MaterialPageRoute(
          //       builder: (context) => const HomeScreen(),
          //     ));
          passwordController.clear();
          userIdController.clear();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextFieldWidget(
                title: "userId",
                textController: userIdController,
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                title: "password",
                textController: passwordController,
              ),
              const SizedBox(height: 30),
              if (context.watch<SignInBloc>().state.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Text(context.watch<SignInBloc>().state.errorMessage!,
                      style: const TextStyle(color: Colors.red, fontSize: 15)),
                ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.purple,
                      backgroundColor: const Color.fromARGB(255, 231, 93, 139)),
                  onPressed: () {
                    Navigator.pushNamed(context, '/signUpScreen');
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => const SignUpScreen()));
                    userIdController.clear();
                    passwordController.clear();
                    context.read<SignInBloc>().add(ClearErrorEvent());
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shadowColor: Colors.purple,
                      backgroundColor: const Color.fromARGB(255, 231, 93, 139)),
                  onPressed: () {
                    context.read<SignInBloc>().add(InitialSignInEvent(
                        userId: int.tryParse(userIdController.text) ?? -1,
                        password: passwordController.text));
                  },
                  child: const Text(
                    "Sign in",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 17),
                  ))
            ],
          ),
        );
      },
    );
  }
}
