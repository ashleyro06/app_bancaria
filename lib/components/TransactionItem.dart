import 'package:app_bancaria/models/transactions.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class TransactionItem extends StatelessWidget {
  TransactionItem(
      {this.transaction,
      this.textColor,
      this.inColor,
      this.outColor,
      this.showAccountTo});

  final TransactiontsModel transaction;
  final Color textColor, inColor, outColor;
  final bool showAccountTo;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20.0),
      height: 80,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Row(children: <Widget>[
            if (transaction.type == 1)
              Container(
                decoration: BoxDecoration(
                  color: inColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_drop_up_rounded,
                  color: Colors.green,
                  size: 40,
                ),
              ),
            if (transaction.type == 2)
              Container(
                decoration: BoxDecoration(
                  color: outColor,
                  borderRadius: BorderRadius.all(Radius.circular(16)),
                ),
                height: 50,
                width: 50,
                child: Icon(
                  Icons.arrow_drop_down_rounded,
                  color: Colors.red,
                  size: 40,
                ),
              ),
            SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  'Transferencia',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: textColor),
                ),
                if (transaction.type == 2 && !showAccountTo)
                  Text(
                    "Desde ${StringUtils.hidePartial(transaction.accountFrom, begin: 0, end: 7)}",
                    style: TextStyle(
                        color: textColor.withOpacity(0.5), fontSize: 12),
                  ),
                if (transaction.type == 1 && !showAccountTo)
                  Text(
                    "Para ${StringUtils.hidePartial(transaction.accountTo, begin: 0, end: 7)}",
                    style: TextStyle(
                        color: textColor.withOpacity(0.5), fontSize: 12),
                  ),
                if (transaction.type == 2 && showAccountTo)
                  Text(
                    "Para ${StringUtils.hidePartial(transaction.accountTo, begin: 0, end: 7)}",
                    style: TextStyle(
                        color: textColor.withOpacity(0.5), fontSize: 12),
                  ),
                if (transaction.type == 1 && showAccountTo)
                  Text(
                    "Desde ${StringUtils.hidePartial(transaction.accountFrom, begin: 0, end: 7)}",
                    style: TextStyle(
                        color: textColor.withOpacity(0.5), fontSize: 12),
                  )
              ],
            ),
          ]),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[
              if (transaction.type == 1)
                Text(
                  '+ \$${transaction.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: textColor),
                ),
              if (transaction.type == 2)
                Text(
                  '- \$${transaction.amount}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      color: textColor),
                ),
              Text(
                transaction.date,
                style:
                    TextStyle(color: textColor.withOpacity(0.5), fontSize: 12),
              )
            ],
          ),
        ],
      ),
    );
  }
}
