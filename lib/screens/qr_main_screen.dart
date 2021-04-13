import 'package:app_bancaria/screens/generate_qr_screen.dart';
import 'package:app_bancaria/screens/scan_qr_screen.dart';
import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class QrMainScreen extends StatefulWidget {
  static const String id = 'qr_main_screen';
  @override
  _QrMainScreenState createState() => _QrMainScreenState();
}

class _QrMainScreenState extends State<QrMainScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kbackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.fromLTRB(25, 25, 25, 8),
        child: Column(children: [
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
                'Transacción QR',
                overflow: TextOverflow.visible,
                softWrap: true,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              )
            ],
          ),
          Container(
            height: size.height * 0.7,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              SvgPicture.asset(
                'images/qrcode.svg',
                width: size.width * 0.4,
              ),
              SizedBox(height: 40),
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ScanQrScreen()));
                  },
                  child: Text('Escanear'),
                ),
              ),
              SizedBox(height: 10),
              FractionallySizedBox(
                widthFactor: 1,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: kSecondaryColor,
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => GenerateQrScreen()));
                  },
                  child: Text('Generar'),
                ),
              ),
            ]),
          )
        ]),
      )),
    );
  }
}
