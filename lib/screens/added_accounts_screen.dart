import 'package:app_bancaria/components/ExternalCardItem.dart';
import 'package:app_bancaria/components/TitleText.dart';
import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/navigation/navigation_bloc.dart';
import 'package:flutter/material.dart';

class AddedAccountsScreen extends StatefulWidget with NavigationStates {
  @override
  _AddedAccountsScreenState createState() => _AddedAccountsScreenState();
}

class _AddedAccountsScreenState extends State<AddedAccountsScreen> {
  List<AccountsModel> _addedAccounts = [
    AccountsModel(
        alias: 'Mariana',
        entity: 'AAAAAAA',
        accountNumber: '456320052094',
        type: 'Ahorros',
        user: 'Mariana Perez'.toUpperCase(),
        userId: 123568792120,
        money: 'COP'),
    AccountsModel(
        alias: 'Juan',
        entity: 'VVVVVVVVV',
        accountNumber: '324956202145',
        type: 'Corriente',
        user: 'Juan Maldonado'.toUpperCase(),
        userId: 654359210845,
        money: 'COP'),
    AccountsModel(
        alias: 'Sebastian',
        entity: 'ZZZZZZZZ',
        accountNumber: '7852012223456',
        type: 'Corriente',
        user: 'Sebastian Romero'.toUpperCase(),
        userId: 102354631254,
        money: 'COP')
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Column(
        children: [
          TitleText(
            size: size,
            icon: Icons.people_alt_rounded,
            title: 'Cuentas de terceros',
          ),
          Container(
            height: size.height * 0.86,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  for (var account in _addedAccounts)
                    ExternalCardItem(account: account)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
