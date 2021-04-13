import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  const MenuItem({
    Key key,
    this.title,
    this.icon,
    this.onTap,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 30),
        child: Row(
          children: [
            Icon(icon, color: kbackgroundColor),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(color: kbackgroundColor),
            )
          ],
        ),
      ),
    );
  }
}
