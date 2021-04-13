import 'package:app_bancaria/components/CardItem.dart';
import 'package:app_bancaria/components/TitleText.dart';
import 'package:app_bancaria/components/TransactionItem.dart';
import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/models/transactions.dart';
import 'package:app_bancaria/navigation/navigation_bloc.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class MyCardsScreen extends StatefulWidget with NavigationStates {
  static const String id = 'my_cards_screen';
  @override
  _MyCardsScreenState createState() => _MyCardsScreenState();
}

class _MyCardsScreenState extends State<MyCardsScreen> {
  List<AccountsModel> _myAccounts = [
    AccountsModel(
        balance: 200000,
        accountNumber: '12456879654',
        type: 'Ahorros',
        user: 'Pedro Cifuentes'.toUpperCase(),
        transactions: [
          TransactiontsModel(
              accountFrom: '12456879654',
              accountTo: '94568903476',
              type: 2, //out
              amount: 4000,
              date: '20-03-2021'),
        ]),
    AccountsModel(
        balance: 3000000,
        accountNumber: '54632894630',
        type: 'Corriente',
        user: 'Pedro Cifuentes'.toUpperCase(),
        transactions: [
          TransactiontsModel(
              accountFrom: '74632890127',
              accountTo: '54632894630',
              type: 1, //in
              amount: 2450000,
              date: '02-04-2021'),
        ]),
    AccountsModel(
        balance: 100000,
        accountNumber: '398725643202',
        type: 'Ahorros',
        user: 'Pedro Cifuentes'.toUpperCase(),
        transactions: [
          TransactiontsModel(
              accountFrom: '398725643202',
              accountTo: '96502483137',
              type: 2, //out
              amount: 70000,
              date: '15-03-2021'),
          TransactiontsModel(
              accountFrom: '86530164720',
              accountTo: '398725643202',
              type: 1, //in
              amount: 2500000,
              date: '22-02-2021'),
          TransactiontsModel(
              accountFrom: '86530164720',
              accountTo: '398725643202',
              type: 1, //in
              amount: 2500000,
              date: '22-02-2021'),
        ]),
  ];

  List<TransactiontsModel> _myTransactions = [
    TransactiontsModel(
        accountFrom: '74632890127',
        accountTo: '54632894630',
        type: 1, //in
        amount: 2450000,
        date: '02-04-2021'),
    TransactiontsModel(
        accountFrom: '12456879654',
        accountTo: '94568903476',
        type: 2, //out
        amount: 4000,
        date: '20-03-2021'),
    TransactiontsModel(
        accountFrom: '398725643202',
        accountTo: '96502483137',
        type: 2, //out
        amount: 70000,
        date: '15-03-2021'),
    TransactiontsModel(
        accountFrom: '86530164720',
        accountTo: '398725643202',
        type: 1, //in
        amount: 2500000,
        date: '22-02-2021'),
    TransactiontsModel(
        accountFrom: '86530164720',
        accountTo: '398725643202',
        type: 1, //in
        amount: 2500000,
        date: '22-02-2021'),
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Container(
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleText(
              size: size,
              icon: Icons.credit_card_rounded,
              title: 'Mis cuentas',
            ),
            Container(
              height: size.height * 0.86,
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 10.0),
                        height: size.height * 0.35,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            for (var account in _myAccounts)
                              CardItem(account: account)
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20.0, bottom: 10),
                        child: Text(
                          'Transacciones',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                      ),
                      Container(
                        child: Column(
                          children: <Widget>[
                            for (var transaction in _myTransactions)
                              TransactionItem(
                                transaction: transaction,
                                textColor: kSecondaryColor,
                                inColor: Colors.green.shade50,
                                outColor: Colors.red.shade50,
                                showAccountTo: false,
                              ),
                          ],
                        ),
                      )
                    ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
