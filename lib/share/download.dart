import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:screenshot/screenshot.dart';

class DownloadQR {
  static Future<void> downloadQR(
      String url, context, ScreenshotController ss) async {
    try {
      PermissionStatus permissionStatus = await Permission.storage.request();

      if (permissionStatus.isGranted == true) {
        await ss.capture().then((image) async {
          await ImageGallerySaver.saveImage(image!);
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("QR code downloaded to Downloads")));
      } else if (permissionStatus == PermissionStatus.denied) {
        await ss.capture().then((image) async {
          await ImageGallerySaver.saveImage(image!);
        });
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("QR code downloaded to Downloads")));
      } else {
        await Permission.storage.request();
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text("Permission granted")));
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Error downloading QR code")));
    }
  }
}
