import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';
import 'package:share_plus/share_plus.dart';

class ShareQR {
  static Future<void> shareQR(
      String text, ScreenshotController screenshot) async {
    try {
      await screenshot.capture().then((image) async {
        if (image != null) {
          final dir = await getApplicationCacheDirectory();
          final imagepath = await File("${dir.path}/qr.png").create();
          await imagepath.writeAsBytes(image);
          await Share.shareXFiles(
            [XFile(imagepath.path)],
            subject: 'QR Code',
          );
        }
      });
    } catch (e) {
      print(e);
    }
  }
}
