import 'dart:math';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatefulWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionItem({
    Key? key, 
    required this.transaction,
    required this.onRemove,
  }) : super(key: key);

  @override
  _TransactionItemState createState() => _TransactionItemState();
}

class _TransactionItemState extends State<TransactionItem> {
  static const _colors = [
    Colors.red,
    Colors.blue,
    Colors.purple,
    Colors.orange,
    Colors.amber,
    Colors.green,
  ];

  late Color _backgroundColor;

  @override
  void initState() {
    super.initState();
    _backgroundColor = _colors[Random().nextInt(_colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      margin: const EdgeInsets.symmetric(
        vertical: 8,
        horizontal: 5,
      ),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: _backgroundColor,
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                  'R\$${NumberFormat("#,##0.00", "pt_BR").format(widget.transaction.amount)}'),
            ),
          ),
        ),
        title: Text(
          widget.transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(widget.transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                onPressed: () => widget.onRemove(widget.transaction.id),
                style: TextButton.styleFrom(
                  side: Theme.of(context).textTheme.titleLarge!.color ==
                          Colors.black
                      ? const BorderSide(color: Colors.red)
                      : const BorderSide(color: Colors.white),
                ),
              )
            : IconButton(
                icon: const Icon(Icons.delete),
                color: Theme.of(context).disabledColor,
                onPressed: () => widget.onRemove(widget.transaction.id),
              ),
      ),
    );
  }
}