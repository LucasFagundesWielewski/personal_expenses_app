import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class ChartBar extends StatelessWidget {
  final String label;
  final double amount;
  final double percentage;

  ChartBar(this.label, this.amount, this.percentage);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (ctx, constraints) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Container(
              height: constraints.maxHeight * 0.15,
              child: FittedBox(
                child: Text('R\$${NumberFormat("#,##0.00", "pt_BR").format(amount)}'), 
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05,),
            Container(
              height: constraints.maxHeight * 0.6,
              width: 10,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1.0),
                      color: Color.fromRGBO(220, 220, 220, 1),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 60 * percentage,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: constraints.maxHeight * 0.05,),
            Container(child: FittedBox(child: Text(label),), height: constraints.maxHeight * 0.15,),
          ],
        );
      },
    );
  }
}