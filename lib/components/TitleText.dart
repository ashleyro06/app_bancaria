import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  const TitleText({
    Key key,
    @required this.size,
    this.icon,
    this.title,
  }) : super(key: key);

  final Size size;
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size.height * 0.1,
      padding: EdgeInsets.only(right: 15.0, top: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Icon(
            icon,
            size: 30,
            color: kSecondaryColor,
          ),
          SizedBox(width: 20),
          Text(
            title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
