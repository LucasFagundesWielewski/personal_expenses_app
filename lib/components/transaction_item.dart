import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  final Transaction transaction;
  final void Function(String) onRemove;

  const TransactionItem({
    required this.transaction,
    required this.onRemove,
  });

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
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
              child: Text(
                  'R\$${NumberFormat("#,##0.00", "pt_BR").format(transaction.amount)}'),
            ),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        subtitle: Text(
          DateFormat('d MMM y').format(transaction.date),
        ),
        trailing: MediaQuery.of(context).size.width > 480
            ? TextButton.icon(
                icon: const Icon(Icons.delete),
                label: const Text('Excluir'),
                onPressed: () => onRemove(transaction.id),
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
                onPressed: () => onRemove(transaction.id),
              ),
      ),
    );
  }
}