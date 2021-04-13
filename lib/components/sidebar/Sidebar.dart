import 'package:app_bancaria/components/sidebar/MenuItem.dart';
import 'package:app_bancaria/navigation/navigation_bloc.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> {
  bool isSidebarOpened = false;
  @override
  Widget build(BuildContext context) {
    onIconClicked() {
      setState(() {
        isSidebarOpened = !isSidebarOpened;
      });
    }

    Size size = MediaQuery.of(context).size;
    return AnimatedContainer(
      width: isSidebarOpened ? size.width : 45,
      curve: Curves.fastOutSlowIn,
      duration: Duration(milliseconds: 500),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Container(
              color: kSecondaryColor,
              child: isSidebarOpened
                  ? SafeArea(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MenuItem(
                              title: 'Mis cuentas',
                              icon: Icons.credit_card_rounded,
                              onTap: () {
                                BlocProvider.of<NavigationBloc>(context)
                                    .add(NavigationEvents.MyCardsClickedEvent);
                                onIconClicked();
                              },
                            ),
                            MenuItem(
                              title: 'Cuentas de terceros',
                              icon: Icons.people_alt_rounded,
                              onTap: () {
                                BlocProvider.of<NavigationBloc>(context).add(
                                    NavigationEvents.AddedAccountsClickedEvent);
                                onIconClicked();
                              },
                            ),
                          ],
                        ),
                      ),
                    )
                  : Container(),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.95),
            child: GestureDetector(
              onTap: () {
                onIconClicked();
              },
              child: ClipPath(
                clipper: CustomMenuClipper(),
                child: Container(
                  width: 35,
                  height: 110,
                  color: kSecondaryColor,
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    isSidebarOpened ? Icons.close : Icons.menu,
                    color: kbackgroundColor,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
