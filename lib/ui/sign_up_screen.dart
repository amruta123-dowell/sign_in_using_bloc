import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sign_in/blocs/signInBloc%20/sign_in_bloc.dart';

import 'package:flutter_bloc_sign_in/blocs/signUpBloc/sign_up_bloc.dart';
import 'package:flutter_bloc_sign_in/custom_widgets/text_field_widget.dart';
import 'package:flutter_bloc_sign_in/models/user_details_model.dart';
import 'package:flutter_bloc_sign_in/ui/home_screen.dart';
import 'package:flutter_bloc_sign_in/ui/sign_in_screen.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController userIdController = TextEditingController();

    return BlocConsumer<SignUpBloc, SignUpState>(
      listener: (context, state) {
        if (state is SignUpSuccess) {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const HomeScreen()));
          emailController.clear();
          userIdController.clear();
          passwordController.clear();
        }
      },
      builder: (context, state) {
        bool isError = state is SignUpFailure;
        return PopScope(
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextFieldWidget(
                  title: "UserId",
                  textController: userIdController,
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(title: "Email", textController: emailController),
                const SizedBox(
                  height: 20,
                ),
                TextFieldWidget(
                    title: "Password", textController: passwordController),
                const SizedBox(
                  height: 30,
                ),
                if (isError) ...[
                  Text(
                    state.errorMessage,
                    style: const TextStyle(color: Colors.red, fontSize: 17),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          shadowColor: Colors.purple,
                          backgroundColor:
                              const Color.fromARGB(255, 231, 93, 139)),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const SignInScreen()));
                      },
                      child: const Text(
                        "Sign in",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 17),
                      ))
                ],
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shadowColor: Colors.purple,
                        backgroundColor: const Color.fromARGB(255, 231, 93, 139)),
                    onPressed: () {
                      context.read<SignUpBloc>().add(SignUpInitialEvent(
                          userDetails: UserDetailsModel(
                              email: emailController.text,
                              password: passwordController.text,
                              id: int.parse(userIdController.text))));
                    },
                    child: const Text(
                      "SignUp",
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17),
                    ))
              ],
            ),
          ),
        );
      },
    );
  }
}
