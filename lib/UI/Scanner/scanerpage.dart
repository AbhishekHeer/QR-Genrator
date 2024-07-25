import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qu_genrator/messege.dart';

class Scanerpage extends StatefulWidget {
  const Scanerpage({super.key});

  @override
  State<Scanerpage> createState() => _ScanerpageState();
}

String value = "";

class _ScanerpageState extends State<Scanerpage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * .09,
        title: const Text('Scan'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(width: 0.0, height: height * .07),
            Center(
              child: InkWell(
                onTap: () {
                  AllMessege.bottomfortextcopy(context, height, width, value);
                },
                child: Container(
                  height: height * .3,
                  width: width * .95,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 50, 145, 189),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      value.isEmpty ? "Your Result" : value,
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w500, fontSize: height * .02),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: height * .2,
            ),
            ElevatedButton(
              onPressed: () async {
                // ignore: unused_local_variable
                var result = await FlutterBarcodeScanner.scanBarcode(
                    "#ff6666", "cancel", true, ScanMode.QR);
                if (result.isNotEmpty) {
                  setState(() {});
                  value = result.toString();
                }
              },
              child: const Text(
                "Tap For Scan",
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
