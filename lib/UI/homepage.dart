import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:qu_genrator/UI/Genrate/genhome.dart';
import 'package:qu_genrator/UI/Scanner/scanerpage.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

int indexvalue = 0;
final List<Widget> pages = [const GenHome(), const Scanerpage()];

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: pages.elementAt(indexvalue),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: indexvalue,
          onTap: (index) {
            setState(() {
              indexvalue = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_2_sharp), label: 'Genrate'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.qrcode_viewfinder), label: 'Scan')
          ]),
    );
  }
}
