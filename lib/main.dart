import 'package:app_bancaria/screens/add_account_screen.dart';
import 'package:app_bancaria/screens/login_screen.dart';
import 'package:app_bancaria/screens/qr_main_screen.dart';
import 'package:app_bancaria/screens/transfer_screen.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BankApp());
}

class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bank App',
      debugShowCheckedModeBanner: false,
      home: new LoginScreen(),
      theme: ThemeData(
        scaffoldBackgroundColor: kbackgroundColor,
        backgroundColor: kbackgroundColor,
        primarySwatch: Colors.indigo,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textTheme:
            Theme.of(context).textTheme.apply(bodyColor: kSecondaryColor),
      ),
      // Defined routes that doesn't work with BlocProvider,
      // External routes that doesn't have sidebar
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        TransferScreen.id: (context) => TransferScreen(),
        AddAccountScreen.id: (context) => AddAccountScreen(),
        QrMainScreen.id: (context) => QrMainScreen(),
      },
    );
  }
}
