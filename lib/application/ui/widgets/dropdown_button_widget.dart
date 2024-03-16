import 'package:flutter/material.dart';

class DropdownButtonWidget extends StatelessWidget {
  final dynamic value;
  final List<DropdownMenuItem> items;
  final ValueChanged<dynamic> onChanged;

  const DropdownButtonWidget({
    super.key,
    required this.items,
    required this.onChanged,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      borderRadius: BorderRadius.circular(8.0),
      style: const TextStyle(
        color: Colors.black,
        fontFamily: 'Arial',
      ),
      value: value,
      items: items,
      onChanged: onChanged,
    );
  }
}
