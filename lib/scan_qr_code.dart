import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class ScanQrCode extends StatefulWidget {
  @override
  State<ScanQrCode> createState() => _ScanQrCodeState();
}

class _ScanQrCodeState extends State<ScanQrCode> {

  String qrResult = "Scanned data will appear here";

  Future<void> scanQR() async{
    try{
      final qrCode = await FlutterBarcodeScanner.scanBarcode('#ff6666', 'Cancel', true, ScanMode.QR);
      if(!mounted)return;
      setState(() {
        qrResult = qrCode.toString();
      });
    }on PlatformException{
      qrResult = "Fail to load QR code";
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('QR code Scanner'),
       backgroundColor: Colors.blue,
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
           SizedBox(height: 30,),
           Text('$qrResult',style: TextStyle(color: Colors.black),),
           SizedBox(height: 30,),
           ElevatedButton(onPressed: (){
             scanQR();
           }, child: Text('Scan code',style: TextStyle(color: Colors.white),),
           style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),)
         ],
       ),
     ),
   );
  }
}