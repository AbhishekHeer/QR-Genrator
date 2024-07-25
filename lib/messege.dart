import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qu_genrator/share/download.dart';
import 'package:qu_genrator/share/share.dart';
import 'package:screenshot/screenshot.dart';
import 'package:url_launcher/url_launcher.dart';

class AllMessege {
  static void bottomsheet(BuildContext context, height, width, String qrdata,
      ScreenshotController ss) {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: height * .005, left: width * .02),
              child: ListTile(
                onTap: () {
                  DownloadQR.downloadQR(qrdata, context, ss).then((value) {
                    Navigator.pop(context);
                  });
                },
                leading: const Icon(CupertinoIcons.down_arrow),
                title: const Text('Download'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * .005, left: width * .02),
              child: ListTile(
                onTap: () {
                  try {
                    ShareQR.shareQR(qrdata, ss);
                  } catch (e) {
                    print(e);
                  }
                },
                leading: const Icon(CupertinoIcons.share),
                title: const Text('Share'),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * .01, left: width * .02),
              child: ListTile(
                onTap: () {
                  Navigator.pop(context);
                },
                leading: const Icon(Icons.cancel),
                title: const Text('Cancel'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future<void> bottomfortextcopy(
      BuildContext context, height, width, String copytext) async {
    showModalBottomSheet(
      context: context,
      builder: (context) => SizedBox(
        height: 200,
        child: Column(
          children: [
            ListTile(
              onTap: () async {
                if (copytext.contains("https://")) {
                  var url = Uri.parse(copytext);
                  await launchUrl(url);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Row(
                    children: [Text('Invalid URL')],
                  )));
                  Navigator.pop(context);
                }
              },
              title: const Text('Go To Website'),
              leading: const Icon(CupertinoIcons.arrow_right_circle),
            ),
            ListTile(
              onTap: () async {
                await Clipboard.setData(ClipboardData(text: copytext))
                    .then(((value) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Row(
                    children: [Text('Text Copy Successfully')],
                  )));
                  Navigator.pop(context);
                }));
              },
              title: const Text('Copy Text'),
              leading: const Icon(Icons.copy),
            ),
            ListTile(
              title: const Text('Cancel'),
              onTap: () {
                Navigator.pop(context);
              },
              leading: const Icon(Icons.cancel),
            ),
          ],
        ),
      ),
    );
  }
}
