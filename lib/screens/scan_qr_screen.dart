import 'package:app_bancaria/components/SimpleMyCardItem.dart';
import 'package:app_bancaria/models/accounts.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:numeric_keyboard/numeric_keyboard.dart';

class ScanQrScreen extends StatefulWidget {
  @override
  _ScanQrScreenState createState() => _ScanQrScreenState();
}

class _ScanQrScreenState extends State<ScanQrScreen> {
  String _qrCode;
  List<String> qrData;
  bool _qrScanned = false;
  AccountsModel _selectedFrom;
  String _valueToSend;
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

  Future<void> scanQRCode() async {
    try {
      final qrCode = await FlutterBarcodeScanner.scanBarcode(
          '#FFBC42', 'Cancelar', true, ScanMode.QR);

      if (!mounted) return;

      setState(() {
        this._qrCode = qrCode;
        if (this._qrCode != '-1') {
          this.qrData = this._qrCode.split('&');
          this._qrScanned = true;
        }
      });
    } on PlatformException {
      _qrCode = 'Ha ocurido un error';
      this._qrScanned = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
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
                        'Escanear QR',
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(fontSize: 18),
                      ),
                      Text(
                        'Transacción',
                        overflow: TextOverflow.visible,
                        softWrap: true,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(height: 40),
              (_qrScanned == true)
                  ? buildQrTransaction(size)
                  : buildScanner(size)
            ],
          ),
        ),
      ),
    );
  }

  Container buildQrTransaction(Size size) {
    return Container(
      height: size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
                items: _myAccounts.map((AccountsModel myAccount) {
                  return new DropdownMenuItem<AccountsModel>(
                    value: myAccount,
                    child: new SimpleMyCardItem(account: myAccount),
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 10),
              Icon(
                Icons.person_add_alt_1_rounded,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Text(qrData[1])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 8),
              Icon(
                Icons.badge,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Text(qrData[0])
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 8),
              Icon(
                Icons.money,
                color: kPrimaryColor,
              ),
              SizedBox(width: 20),
              Text(qrData[2])
            ],
          ),
          SizedBox(height: 20),
          Container(
            constraints: BoxConstraints(maxWidth: size.width - 60),
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
                  child: _valueToSend == null || _valueToSend == ''
                      ? Text(
                          '0',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        )
                      : Text(
                          _valueToSend,
                          overflow: TextOverflow.visible,
                          softWrap: true,
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                )
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
                  _valueToSend =
                      _valueToSend.substring(0, _valueToSend.length - 1);
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
    );
  }

  Container buildScanner(Size size) {
    return Container(
      height: size.height * 0.7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            'images/scanqr.svg',
            width: size.width * 0.6,
          ),
          SizedBox(
            height: 20,
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
              onPressed: () {
                scanQRCode();
              },
              child: Text('Escanear'),
            ),
          ),
        ],
      ),
    );
  }
}
