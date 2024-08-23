import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class AdaptativeDatePicker extends StatelessWidget{

  final DateTime? selectedDate;
  final void Function(DateTime) onDateChanged;

  AdaptativeDatePicker({
    this.selectedDate,
    required this.onDateChanged,
  });
  
  void _showDatePicker(BuildContext context) {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }

      onDateChanged(pickedDate);  
    });
  }

  @override
  Widget build(BuildContext context){
    return Platform.isIOS
    ? Container(height: 180, child: CupertinoDatePicker(
      mode: CupertinoDatePickerMode.date,
      initialDateTime: DateTime.now(),
      minimumDate: DateTime(2020),  
      maximumDate: DateTime.now(),
      onDateTimeChanged: (pickedDate) {
        onDateChanged(pickedDate);
      },
    ),)
              : Container(
                height: 70,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        selectedDate == null
                            ? 'Nenhuma Data Selecionada!'
                            : 'Data Selecionada: ${DateFormat('dd/MM/y').format(selectedDate!)}',
                      ),
                    ),
                    TextButton(
                      child: const Text(
                        'Selecionar Data',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      onPressed: () => _showDatePicker(context),
                    ),
                  ],
                ),
              );
  }
}