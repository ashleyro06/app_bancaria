import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';

class AddAccountScreen extends StatefulWidget {
  static const String id = 'add_account_screen';
  @override
  _AddAccountScreenState createState() => _AddAccountScreenState();
}

class _AddAccountScreenState extends State<AddAccountScreen> {
  AccountsModel newAccount;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 25, 25, 8),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.shade200,
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                color: kSecondaryColor,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Inscribir cuenta',
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'de terceros',
                              overflow: TextOverflow.visible,
                              softWrap: true,
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(height: 40),
                    Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextField(
                            style: TextStyle(color: kSecondaryColor),
                            onChanged: (value) {
                              newAccount.alias = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                                labelText: 'Alias',
                                icon: Icon(Icons.edit_rounded)),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextField(
                            style: TextStyle(color: kSecondaryColor),
                            onChanged: (value) {
                              newAccount.entity = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Entidad bancaria',
                              icon: Icon(
                                Icons.account_balance_rounded,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextField(
                            style: TextStyle(color: kSecondaryColor),
                            onChanged: (value) {
                              newAccount.accountNumber = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Nº de cuenta',
                              icon: Icon(
                                Icons.credit_card_rounded,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextField(
                            style: TextStyle(color: kSecondaryColor),
                            onChanged: (value) {
                              newAccount.user = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Nombre de propietario',
                              icon: Icon(
                                Icons.person_rounded,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 10.0),
                          child: TextField(
                            style: TextStyle(color: kSecondaryColor),
                            onChanged: (value) {
                              newAccount.userId = int.parse(value);
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Nº de identificación',
                              icon: Icon(Icons.badge),
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.only(bottom: 40.0),
                          child: TextField(
                            style: TextStyle(color: kSecondaryColor),
                            onChanged: (value) {
                              newAccount.money = value;
                            },
                            decoration: kTextFieldDecoration.copyWith(
                              labelText: 'Moneda',
                              icon: Icon(Icons.attach_money_rounded),
                            ),
                          ),
                        ),
                        FractionallySizedBox(
                          widthFactor: 1,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: kPrimaryColor,
                              onPrimary: Color(0xFFFFFFFF),
                              elevation: 0,
                              padding: EdgeInsets.symmetric(
                                vertical: 15.0,
                                horizontal: 10.0,
                              ),
                              shape: new RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(30.0),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Inscribir'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
