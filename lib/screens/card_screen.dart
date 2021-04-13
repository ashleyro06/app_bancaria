import 'package:app_bancaria/components/SimpleCard.dart';
import 'package:app_bancaria/components/TransactionItem.dart';
import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  static const String id = 'card_screen';

  final AccountsModel account;
  final String accountNumber;

  const CardScreen({Key key, this.account, this.accountNumber})
      : super(key: key);

  @override
  _CardScreenState createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    AccountsModel _account = this.widget.account;
    String _accountNumber = this.widget.accountNumber;

    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: kSecondaryColor,
      appBar: buildAppBar(_account.accountNumber),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    SimpleCard(size: size, account: _account),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 15.0, bottom: 10, top: 30),
                  child: Text(
                    'Transacciones',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.white),
                  ),
                ),
                Container(
                  child: Column(children: <Widget>[
                    for (var transaction in _account.transactions)
                      TransactionItem(
                        transaction: transaction,
                        textColor: Colors.white,
                        inColor: Colors.green.shade100,
                        outColor: Colors.red.shade100,
                        showAccountTo: true,
                      ),
                  ]),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(accountNumber) {
    return AppBar(
      backgroundColor: kSecondaryColor,
      elevation: 0,
      toolbarHeight: 90,
      automaticallyImplyLeading: true,
      centerTitle: true,
      title: Text(
        accountNumber,
      ),
    );
  }
}

class ActionIconButton extends StatelessWidget {
  const ActionIconButton({
    Key key,
    this.icon,
    this.title,
    this.iconColor,
    this.backgroundColor,
    this.textColor,
    this.height,
    this.width,
    this.onTapFunction,
  }) : super(key: key);

  final IconData icon;
  final String title;
  final Color iconColor, backgroundColor, textColor;
  final double height, width;
  final Function onTapFunction;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTapFunction,
          child: Container(
            height: height,
            width: width,
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: Icon(
              icon,
              color: iconColor,
              size: height * 0.6,
            ),
          ),
        ),
        SizedBox(height: 5),
        Text(
          title,
          style: TextStyle(color: textColor, fontSize: 12),
        )
      ],
    );
  }
}
