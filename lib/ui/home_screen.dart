import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_sign_in/blocs/homeBloc/home_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int? userId;

  @override
  void initState() {
    final Map<String, int> argumentId =
        ModalRoute.of(context)?.settings.arguments as Map<String, int>;
    // context
    //     .read<HomeBloc>()
    //     .add(InitialHomeEvent(userId: argumentId["userId"]!));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home screen"),
      ),
      body: const Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 20,
          ),
          Text("Welcome name")
        ],
      ),
    );
  }
}
