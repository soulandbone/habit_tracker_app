import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final VoidCallback onPressed;
  const MyFloatingActionButton({required this.onPressed, super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: onPressed,
      child: const Icon(Icons.add),
    );
  }
}
