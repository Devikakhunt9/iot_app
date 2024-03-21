import 'package:flutter/material.dart';


class TextBox extends StatefulWidget {

  TextEditingController? textEditingController;
  late String labelText;
  late String hintText;
  Widget? iconWidget;
  late bool obsecureText;
  String? errorMessage;
  final String? Function(String?)? function;
  TextBox({
    // required this.textEditingController,
    required this.labelText,
    required this.hintText,
    this.iconWidget,
    required this.obsecureText,
    this.errorMessage,
    this.function,
    this.textEditingController
  });

  @override
  State<TextBox> createState() => _TextBoxState();
}

class _TextBoxState extends State<TextBox> {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.obsecureText,
        validator: widget.function,
        decoration: InputDecoration
          (
            border: OutlineInputBorder
              (
                borderRadius: BorderRadius.circular(50)
            ),
            labelText: widget.labelText,
            hintText: widget.hintText,
            suffixIcon: widget.iconWidget,
            errorText: widget.errorMessage
        ),
      ),
    );
  }
}