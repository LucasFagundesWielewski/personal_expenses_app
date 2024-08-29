import 'package:expenses/components/adaptative_text_fild.dart';
import 'package:flutter/material.dart';
import 'adaptative_button.dart';
import 'adaptative_date_picker.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;

  TransactionForm(this.onSubmit) {
    print('Constructor TransactionForm');
  }

  @override
  _TransactionFormState createState() { 
    print('Constructor TransactionForm');
    return _TransactionFormState();
  }
}

class _TransactionFormState extends State<TransactionForm> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();
  DateTime? _selectedDate;

  _TransactionFormState() {
    print('Constructor _TransactionFormState');
  }

  @override
  void initState() {
    super.initState();
    print('initState() _TransactionFormState');
  }

  void didUpdateWidget(covariant TransactionForm oldWidget) {
    super.didUpdateWidget(oldWidget);
    print('didUpdateWidget() _TransactionFormState');
  }

  void dispose() {
    super.dispose();
    print('dispose() _TransactionFormState');
  }

  void _submitForm() {
    final title = _titleController.text;
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    if (title.isEmpty || amount <= 0 || _selectedDate == null) {
      return;
    }

    widget.onSubmit(title, amount, _selectedDate!);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        elevation: 5,
        child: Padding(
          padding: EdgeInsets.only(
            top: 10,
            right: 10,
            left: 10,
            bottom: 10 + MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: <Widget>[
              AdaptativeTextFild(
                controller: _titleController,
                onSubmitted: (_) => _submitForm(),
                label: 'Título', 
                keyboardType: TextInputType.text,
              ),
              AdaptativeTextFild(
                controller: _amountController,
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                onSubmitted: (_) => _submitForm(),
                label: 'Valor (R\$)',
              ),
              AdaptativeDatePicker(selectedDate: _selectedDate,
                onDateChanged: (newDate) {
                  setState(() {
                    _selectedDate = newDate;
                  });
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  AdaptativeButton(
                    label: 'Nova Transação',
                    onPressed: _submitForm,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}