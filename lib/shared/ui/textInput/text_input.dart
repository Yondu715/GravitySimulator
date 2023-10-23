import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final TextInputType? type;
  final String? placeHolder;
  final void Function(String)? onSubmited;
  final void Function(String)? onChanged;
  final double? width;
  final double? height;
  final TextEditingController _textEditingController = TextEditingController();

  TextInput(
      {super.key,
      this.type,
      this.placeHolder,
      this.onSubmited,
      this.onChanged,
      this.width,
      this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: TextField(
        controller: _textEditingController,
        keyboardType: type,
        decoration: InputDecoration(
          hintText: placeHolder,
        ),
        onSubmitted: onSubmited,
        onChanged: onChanged,
      ),
    );
  }
}
