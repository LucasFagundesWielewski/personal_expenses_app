import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeButton extends StatelessWidget {
  final String label;
  final void Function() onPressed;
  final Color color;

  const AdaptativeButton({
    required this.label,
    required this.onPressed,
    this.color = Colors.white, 
  });

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
    ? CupertinoButton(
      child: Text(label),
      onPressed: onPressed,
      padding: EdgeInsets.symmetric(
        horizontal: 20,
      ),
    ) : ElevatedButton(
      onPressed: onPressed,
      child: Text(label),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(color), 
      ),
    );
  }
}