import 'package:app_bancaria/services/constants.dart';
import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrScreen extends StatefulWidget {
  @override
  _GenerateQrScreenState createState() => _GenerateQrScreenState();
}

class _GenerateQrScreenState extends State<GenerateQrScreen> {
  List<String> qrData = ["1028738462012", "JUAN RODRIGUEZ", "98374057419"];

  @override
  Widget build(BuildContext context) {
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
                  Text(
                    'Generar QR',
                    overflow: TextOverflow.visible,
                    softWrap: true,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              SizedBox(height: 40),
              Container(
                height: MediaQuery.of(context).size.height * 0.7,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      QrImage(
                        data: qrData.join('&'),
                      )
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
