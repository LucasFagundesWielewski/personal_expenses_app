import 'dart:io';
import 'dart:ui';
import 'package:expenses/components/chart.dart';
import 'package:expenses/components/transaction_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'models/transaction.dart';
import 'dart:math';
import './components/transaction_list.dart';

void main() => runApp(const ExpensesApp());

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
      theme: ThemeData(
        textTheme: ThemeData.light().textTheme.copyWith(
              titleLarge: const TextStyle(
                fontFamily: 'OpenSans',
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
              titleMedium: TextStyle(
                color: Colors.grey[800],
                fontFamily: 'OpenSans',
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              titleSmall: const TextStyle(
                color: Colors.white,
                fontFamily: 'OpenSans',
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
        fontFamily: 'Quicksand',
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.deepPurple)
            .copyWith(secondary: Colors.purple),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.deepPurple,
          titleTextStyle: TextStyle(
            fontFamily: 'OpenSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
    Theme.of(context).platform == TargetPlatform.iOS
        ? CupertinoTheme.of(context)
        : Theme.of(context);
    WidgetsBinding.instance.addObserver(this as WidgetsBindingObserver);
  }

  void didChangeAppLifecycleState(AppLifecycleState state) {
    print(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this as WidgetsBindingObserver);
    super.dispose();
  }
  final List<Transaction> _transactions = [];
  bool _showChart = false;

  List<Transaction> get _recentTransactions {
    return _transactions.where((tr) {
      return tr.date.isAfter(DateTime.now().subtract(
        const Duration(days: 7),
      ));
    }).toList();
  }

  void _addTransaction(String title, double amount, DateTime date) {
    final newTransaction = Transaction(
      id: Random().nextDouble().toString(),
      title: title,
      amount: amount,
      date: date,
    );

    setState(() {
      _transactions.add(newTransaction);
    });

    Navigator.of(context).pop();
  }

  void _deleteTransaction(String id) {
    setState(() {
      _transactions.removeWhere((tr) => tr.id == id);
    });
  }

  void _openTransactionFormModal(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (_) {
        return TransactionForm(_addTransaction);
      },
    );
  }

  Widget _getIconButton(IconData icon, Function() fn) {
    return Platform.isIOS
        ? GestureDetector(
            onTap: fn,
            child: Icon(icon),
          )
        : IconButton(
            icon: Icon(icon),
            onPressed: fn,
          );
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    bool isLandscape = mediaQuery.orientation == Orientation.landscape;
    final double textScaleFactor = MediaQuery.of(context).textScaleFactor;
    final double fontSize = lerpDouble(16, 24, textScaleFactor)!;

    final iconList = Platform.isIOS ? CupertinoIcons.list_bullet : Icons.list;  
    final iconChart = Platform.isIOS ? CupertinoIcons.chart_pie : Icons.pie_chart;

    final actions = <Widget>[
        if (isLandscape)
          _getIconButton(
            _showChart ? iconList : iconChart,
            () => {
              setState(() {
                _showChart = !_showChart;
              })
            },
          ),
        _getIconButton(
          Platform.isIOS ? CupertinoIcons.add : Icons.add,
          () => _openTransactionFormModal(context),
        ),
      ];
    final PreferredSizeWidget appBar = Platform.isIOS ? 
    CupertinoNavigationBar(
      middle: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: fontSize,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (isLandscape)
            CupertinoButton(
              child: Icon(_showChart ? Icons.list : Icons.pie_chart),
              onPressed: () => {
                setState(() {
                  _showChart = !_showChart;
                })
              },
            ),
          CupertinoButton(
            child: const Icon(Icons.add),
            onPressed: () => _openTransactionFormModal(context),
          ),
        ],
      ),
    )
    :AppBar(
      title: Text(
        'Despesas Pessoais',
        style: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: fontSize,
        ),
      ),
      actions: actions,
    );
    final availableHeight = mediaQuery.size.height -
        appBar.preferredSize.height -
        mediaQuery.padding.top;

    final bodyPage = SafeArea(
      child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          const SizedBox(height: 8),
          if (_showChart || !isLandscape)
            Container(
              height: availableHeight * (isLandscape ? 0.8 : 0.3),
              child: Chart(_recentTransactions),
            ),
          if (!_showChart || !isLandscape)
            Container(
              height: availableHeight * (isLandscape ? 1 : 0.7),
              child: TransactionList(_transactions, _deleteTransaction),
            ),
        ],
      ),
    )
      );
    

    return Platform.isIOS
            ? CupertinoPageScaffold(
                navigationBar: CupertinoNavigationBar(
                  middle: Text(
                    'Despesas Pessoais',
                    style: TextStyle(
                      fontFamily: 'OpenSans',
                      fontSize: fontSize,
                    ),
                  ),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      if (isLandscape)
                        CupertinoButton(
                          child: Icon(_showChart ? Icons.list : Icons.pie_chart),
                          onPressed: () => {
                            setState(() {
                              _showChart = !_showChart;
                            })
                          },
                        ),
                      CupertinoButton(
                        child: const Icon(Icons.add),
                        onPressed: () => _openTransactionFormModal(context),
                      ),
                    ],
                  ),
                ),
                child: bodyPage,
              )
            : Scaffold(
            appBar: appBar,
            body: bodyPage,
            floatingActionButton: Platform.isIOS
                ? Container()
                : FloatingActionButton(
                    child: const Icon(Icons.add),
                    onPressed: () => _openTransactionFormModal(context),
                  ),
            floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
          );
  }
}