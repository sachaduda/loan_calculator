import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

enum TextFieldType {
  digits,
  percent,
}

class TextFieldWidget extends StatefulWidget {
  final String? text;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final TextInputAction? textInputAction;
  final TextInputType keyboardType;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final ValueChanged<String>? onChanged;
  final TextFieldType textFieldType;

  const TextFieldWidget({
    super.key,
    this.text = '',
    this.suffixWidget,
    this.keyboardType = TextInputType.name,
    this.controller,
    this.focusNode,
    this.textInputAction = TextInputAction.send,
    this.prefixWidget,
    this.onChanged,
    required this.textFieldType,
  });

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late TextEditingController _controller;
  late List<TextInputFormatter> formatter = [];

  @override
  void initState() {
    _controller = widget.controller ?? TextEditingController();

    if (widget.textFieldType == TextFieldType.digits) {
      formatter.add(LengthLimitingTextInputFormatter(10));
      formatter.add(FilteringTextInputFormatter.allow(RegExp(r'^[1-9]\d*')));
    } else if (widget.textFieldType == TextFieldType.percent) {
      formatter.add(FilteringTextInputFormatter.allow(RegExp(r'^(?!0\d)\d{1,3}\.?(\d{1})?')));
    }

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      minLines: 1,
      maxLines: 1,
      textInputAction: widget.textInputAction,
      textAlign: TextAlign.start,
      controller: _controller,
      cursorColor: Colors.blue,
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Arial',
      ),
      keyboardType: widget.keyboardType,
      inputFormatters: formatter,
      decoration: InputDecoration(
        filled: false,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.blue,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        suffixIcon: widget.suffixWidget,
        isDense: true,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12,
          horizontal: 16,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.never,
      ),
    );
  }
}
