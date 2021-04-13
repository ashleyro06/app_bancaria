import 'package:app_bancaria/components/sidebar/Sidebar.dart';
import 'package:app_bancaria/navigation/navigation_bloc.dart';
import 'package:app_bancaria/screens/add_account_screen.dart';
import 'package:app_bancaria/screens/mycards_screen.dart';
import 'package:app_bancaria/screens/qr_main_screen.dart';
import 'package:app_bancaria/screens/transfer_screen.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:fab_circular_menu/fab_circular_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SidebarLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //Redirects to selected route with BlocProvider
      //Using stack and having the sidebar on top
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(MyCardsScreen()),
        child: Stack(
          children: [
            BlocBuilder<NavigationBloc, NavigationStates>(
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),
            SideBar()
          ],
        ),
      ),
      // Shows a floating button that expands when clicking
      // Having 3 options inside
      // - Make a transaction with a registered account
      // - Register a third account
      // - Make a transaction scanning or generating a qr
      floatingActionButton: FabCircularMenu(
        ringColor: kSecondaryColor,
        ringDiameter: 350,
        fabColor: kSecondaryColor,
        fabOpenIcon: Icon(Icons.more_vert, color: Colors.white),
        fabCloseIcon: Icon(Icons.close, color: Colors.white),
        children: <Widget>[
          // ADD ACCOUNT
          IconButton(
              icon: Icon(Icons.person_add_alt_1_rounded,
                  size: 30, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, AddAccountScreen.id);
              }),
          // MAKE TRANSACTION WITH A REGISTERED ACCOUNT
          IconButton(
              icon: Icon(Icons.send_rounded, size: 30, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, TransferScreen.id);
              }),
          // MAKE TRANSACTION WITH QR CODE
          IconButton(
              icon: Icon(Icons.qr_code_rounded, size: 30, color: Colors.white),
              onPressed: () {
                Navigator.pushNamed(context, QrMainScreen.id);
              })
        ],
      ),
    );
  }
}
