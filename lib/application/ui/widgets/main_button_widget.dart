import 'package:flutter/material.dart';

class MainButtonWidget extends StatelessWidget {
  final String buttonText;
  final bool isActive;
  final VoidCallback onPressed;

  const MainButtonWidget({
    super.key,
    required this.buttonText,
    required this.isActive,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40,
      width: MediaQuery.of(context).size.width,
      child: ElevatedButton(
        onPressed: isActive ? onPressed : null,
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shadowColor: MaterialStateProperty.all(Colors.transparent),
          backgroundColor:
              (isActive) ? MaterialStateProperty.all(Colors.blue) : MaterialStateProperty.all(Colors.black54),
        ),
        child: Text(
          buttonText,
          style: const TextStyle(
            color: Colors.white,
            fontFamily: 'Arial',
          ),
        ),
      ),
    );
  }
}
