// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String title;
  final TextEditingController textController;
  final TextInputType? keyBoardType;
  const TextFieldWidget(
      {super.key,
      required this.title,
      required this.textController,
      this.keyBoardType});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: Color.fromARGB(255, 76, 6, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
          Container(
            height: 50,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.green,
                border: Border.all(
                  color: Colors.black,
                )),
            child: TextFormField(
              keyboardType: keyBoardType,
              style: const TextStyle(
                  color: Colors.white, fontWeight: FontWeight.bold),
              controller: textController,
              decoration: const InputDecoration(
                  isDense: true,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                  enabledBorder: InputBorder.none,
                  errorBorder: InputBorder.none,
                  disabledBorder: InputBorder.none),
            ),
          )
        ],
      ),
    );
  }
}
