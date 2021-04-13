import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:basic_utils/basic_utils.dart';
import 'package:flutter/material.dart';

class ExternalCardItem extends StatelessWidget {
  ExternalCardItem({this.account});

  final AccountsModel account;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 12.0),
      padding: EdgeInsets.symmetric(vertical: 25.0, horizontal: 30.0),
      width: 300,
      height: 200,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            kPrimaryColor,
            Colors.white70,
            kPrimaryColor,
          ],
        ),
        color: kPrimaryColor,
        borderRadius: BorderRadius.all(Radius.circular(30)),
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
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Image.asset(
                  "images/chip.png",
                  height: 20,
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    account.entity,
                    style: kTextCardStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text(account.type,
                      style: kTextCardStyle.copyWith(fontSize: 12))
                ])
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(children: [
                  Text(
                    'CC',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.0),
                  Text(
                    account.userId.toString(),
                    style: kTextCardStyle,
                  ),
                ]),
                Text(
                  account.user,
                  style: kTextCardStyle,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  account.alias,
                  style: kTextCardStyle.copyWith(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
                  Text(
                    StringUtils.hidePartial(account.accountNumber,
                        begin: 0, end: 7),
                    style: kTextCardStyle.copyWith(fontSize: 10),
                  ),
                  Text(account.money,
                      style: kTextCardStyle.copyWith(fontSize: 12))
                ])
              ],
            )
          ]),
    );
  }
}
