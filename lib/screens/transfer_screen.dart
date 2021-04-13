import 'package:app_bancaria/components/SimpleExternalCardItem.dart';
import 'package:app_bancaria/components/SimpleMyCardItem.dart';
import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class TransferScreen extends StatefulWidget {
  static const String id = 'transfer_screen';
  @override
  _TransferScreenState createState() => _TransferScreenState();
}

class _TransferScreenState extends State<TransferScreen> {
  AccountsModel _selectedFrom, _selectedTo;
  String _valueToSend;
  List<AccountsModel> _addedAccounts = [
    AccountsModel(
        alias: 'Mariana',
        entity: 'AAAAAAA',
        accountNumber: '456320052094',
        type: 'Ahorros',
        user: 'Mariana Perez'.toUpperCase(),
        userId: 123568792120,
        money: 'COP'),
    AccountsModel(
        alias: 'Juan',
        entity: 'VVVVVVVVV',
        accountNumber: '324956202145',
        type: 'Corriente',
        user: 'Juan Maldonado'.toUpperCase(),
        userId: 654359210845,
        money: 'COP'),
    AccountsModel(
        alias: 'Sebastian',
        entity: 'ZZZZZZZZ',
        accountNumber: '7852012223456',
        type: 'Corriente',
        user: 'Sebastian Romero'.toUpperCase(),
        userId: 102354631254,
        money: 'COP')
  ];
  List<AccountsModel> _myAccounts = [
    AccountsModel(
      balance: 200000,
      accountNumber: '12456879654',
      type: 'Ahorros',
      user: 'Pedro Cifuentes'.toUpperCase(),
    ),
    AccountsModel(
      balance: 3000000,
      accountNumber: '54632894630',
      type: 'Corriente',
      user: 'Pedro Cifuentes'.toUpperCase(),
    ),
    AccountsModel(
      balance: 100000,
      accountNumber: '398725643202',
      type: 'Ahorros',
      user: 'Pedro Cifuentes'.toUpperCase(),
    ),
  ];

  _onKeyboardTap(String value) {
    setState(() {
      if (_valueToSend != null) {
        _valueToSend = _valueToSend + value;
      } else {
        _valueToSend = value;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
        child: Center(
          child: Container(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(25, 8, 25, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        Text(
                          'Realizar transferencia',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    SizedBox(height: 48),
                    Container(
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.credit_card_rounded,
                                color: kPrimaryColor,
                              ),
                              new DropdownButton(
                                hint: _selectedFrom == null
                                    ? Text('Seleccione su cuenta')
                                    : Text(
                                        _selectedFrom.accountNumber,
                                      ),
                                items:
                                    _myAccounts.map((AccountsModel myAccount) {
                                  return new DropdownMenuItem<AccountsModel>(
                                    value: myAccount,
                                    child: new SimpleMyCardItem(
                                        account: myAccount),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedFrom = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(
                                Icons.person_add_alt_1_rounded,
                                color: kPrimaryColor,
                              ),
                              new DropdownButton(
                                hint: _selectedTo == null
                                    ? Text('Seleccione un remitente')
                                    : Text(
                                        "${_selectedTo.alias} - ${_selectedTo.accountNumber}"),
                                items: _addedAccounts
                                    .map((AccountsModel addedAccount) {
                                  return new DropdownMenuItem<AccountsModel>(
                                    value: addedAccount,
                                    child: new SimpleExternalCardItem(
                                        account: addedAccount),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _selectedTo = newValue;
                                  });
                                },
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Container(
                            constraints:
                                BoxConstraints(maxWidth: size.width - 60),
                            padding: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              border: Border(
                                bottom: BorderSide(
                                  color: kPrimaryColor,
                                  width: 3.0,
                                ),
                              ),
                            ),
                            width: size.width - 60,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.attach_money_rounded,
                                  color: kPrimaryColor,
                                  size: 30,
                                ),
                                SizedBox(width: 20),
                                Container(
                                  width: size.width - 120,
                                  child:
                                      _valueToSend == null || _valueToSend == ''
                                          ? Text(
                                              '0',
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          : Text(
                                              _valueToSend,
                                              overflow: TextOverflow.visible,
                                              softWrap: true,
                                              style: TextStyle(
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 40),
                    NumericKeyboard(
                        onKeyboardTap: _onKeyboardTap,
                        textColor: kSecondaryColor,
                        rightButtonFn: () {},
                        rightIcon: Icon(
                          Icons.check_box_rounded,
                          color: kPrimaryColor,
                          size: 45,
                        ),
                        leftButtonFn: () {
                          setState(() {
                            _valueToSend = _valueToSend.substring(
                                0, _valueToSend.length - 1);
                          });
                        },
                        leftIcon: Icon(
                          Icons.backspace_rounded,
                          color: Colors.grey.shade400,
                          size: 30,
                        ),
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly)
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
