import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

typedef void StringCallback(String val);

class SimpleExternalCardItem extends StatelessWidget {
  SimpleExternalCardItem({this.account});

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
            kPrimaryColor,
            Colors.white54,
            kPrimaryColor,
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
                  width: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(
                    account.alias,
                    style: kTextCardStyle.copyWith(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    StringUtils.hidePartial(account.accountNumber,
                        begin: 0, end: 7),
                    style: kTextCardStyle.copyWith(fontSize: 10),
                  ),
                  Text(account.money,
                      style: kTextCardStyle.copyWith(fontSize: 12))
                ])
              ],
            ),
          ]),
    );
  }
}
