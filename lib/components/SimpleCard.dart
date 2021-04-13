import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class SimpleCard extends StatelessWidget {
  const SimpleCard({
    Key key,
    @required this.size,
    @required AccountsModel account,
  })  : _account = account,
        super(key: key);

  final Size size;
  final AccountsModel _account;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 50, horizontal: 10),
      width: size.width * 0.8,
      height: 250,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            kPrimaryColor,
            Colors.white,
            kPrimaryColor,
          ],
        ),
        color: kPrimaryColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30), topLeft: Radius.circular(30)),
      ),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Image.asset(
              "images/chip.png",
              height: 40,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  "${_account.balance}",
                  style: kTextCardStyle.copyWith(
                      fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(
                  _account.type,
                  style: kTextCardStyle.copyWith(fontSize: 15),
                ),
              ],
            )
          ]),
    );
  }
}
