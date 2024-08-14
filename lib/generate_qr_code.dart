import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class GenerateQrCode extends StatefulWidget {
  const GenerateQrCode({super.key});

  @override
  State<GenerateQrCode> createState() => _GenerateQrCodeState();
}

class _GenerateQrCodeState extends State<GenerateQrCode> {

  TextEditingController urlController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR code'),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if(urlController.text.isNotEmpty)
                  QrImageView(data: urlController.text, size: 200,),
                SizedBox(height: 10,),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                    child: TextField(
                      controller: urlController,
                      decoration: InputDecoration(
                        hintText: 'Enter your data',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        labelText: 'Enter your data'
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text('Generate QR code',style: TextStyle(color: Colors.white),),
                style: ButtonStyle(backgroundColor: WidgetStatePropertyAll<Color>(Colors.blue)),),
              ],
            )),
      ),
    );
  }
}