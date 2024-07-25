import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qu_genrator/messege.dart';
import 'package:screenshot/screenshot.dart';

class GenHome extends StatefulWidget {
  const GenHome({super.key});

  @override
  State<GenHome> createState() => _GenHomeState();
}

TextEditingController urllink = TextEditingController();
ScreenshotController screenshotController = ScreenshotController();

class _GenHomeState extends State<GenHome> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('QR Gen'),
        centerTitle: true,
        toolbarHeight: height * .09,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 0.0, height: height * .02),
            if (urllink.text.isNotEmpty)
              Center(
                child: SizedBox(
                  height: height * .2,
                  width: width * .45,
                  child: Screenshot(
                    controller: screenshotController,
                    child: Card(
                      color: Colors.white,
                      child: Center(
                        child: InkWell(
                          onTap: () {
                            AllMessege.bottomsheet(context, height, width,
                                urllink.text.toString(), screenshotController);
                          },
                          child: Padding(
                            padding: EdgeInsets.all(height * .003),
                            child: QrImageView(
                              backgroundColor: Colors.white,
                              data: urllink.text.toString(),
                              version: QrVersions.auto,
                              gapless: false,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            SizedBox(width: 0.0, height: height * .04),
            Padding(
              padding: EdgeInsets.only(
                  top: height * .04, left: width * .09, right: width * .09),
              child: TextField(
                controller: urllink,
                decoration: InputDecoration(
                    labelText: 'Enter Name',
                    suffix: Padding(
                      padding: EdgeInsets.only(
                          right: width * .03, top: height * .004),
                      child: InkWell(
                          onTap: () {
                            urllink.clear();
                          },
                          child: const Icon(Icons.clear)),
                    ),
                    hintText: 'Enter URL',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(height * .03))),
              ),
            ),
            SizedBox(width: 0.0, height: height * .04),
            Padding(
              padding: EdgeInsets.only(
                top: height * .03,
              ),
              child: ElevatedButton(
                onPressed: () {
                  setState(() {});
                },
                child: const Text('Generate QR Code'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
