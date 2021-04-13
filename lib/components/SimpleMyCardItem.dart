import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class SimpleMyCardItem extends StatelessWidget {
  SimpleMyCardItem({this.account});

  final AccountsModel account;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 30.0),
      width: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xFF7282C0),
            kSecondaryColor,
          ],
        ),
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(15)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 4,
            blurRadius: 7,
            offset: Offset(4, 8),
          ),
        ],
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  "images/chip.png",
                  height: 20,
                ),
                SizedBox(
                  width: 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      account.balance.toString(),
                      style: kTextCardStyle.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                    Text(
                      account.accountNumber,
                      style: kTextCardStyle.copyWith(
                          fontSize: 10, color: Colors.white),
                    ),
                    Text(account.type,
                        style: kTextCardStyle.copyWith(
                            fontSize: 12, color: Colors.white))
                  ],
                ),
              ],
            ),
          ]),
    );
  }
}
