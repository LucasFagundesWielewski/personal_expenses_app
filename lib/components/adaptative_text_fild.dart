import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptativeTextFild extends StatelessWidget{
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String label;
  final void Function(String) onSubmitted;

  AdaptativeTextFild({
    required this.controller,
    required this.keyboardType,
    required this.label,
    required this.onSubmitted,
  });

  @override
  Widget build(BuildContext context){
    return Platform.isIOS 
    ? Padding(
      padding: const EdgeInsets.only(
        bottom: 10,
      ),   
    child: CupertinoTextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      placeholder: label,
      padding: EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 12,
      ),)
    ) : TextField(
      controller: controller,
      keyboardType: keyboardType,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        labelText: label,
      ),
    );
  } 
}