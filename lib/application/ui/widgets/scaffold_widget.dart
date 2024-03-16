import 'package:flutter/material.dart';

class ScaffoldWidget extends StatelessWidget {
  final Widget body;
  final String title;

  const ScaffoldWidget({
    super.key,
    required this.body,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        appBar: AppBar(
          surfaceTintColor: Colors.transparent,
          title: Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontFamily: 'Arial',
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
        ),
        extendBody: true,
        backgroundColor: Colors.white10,
        body: body,
      ),
    );
  }
}
