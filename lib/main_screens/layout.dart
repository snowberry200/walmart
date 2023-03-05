import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'desktop.dart';
import 'mobile.dart';
import 'tablet.dart';

class Layout extends StatefulWidget {
  const Layout({Key? key}) : super(key: key);

  @override
  State<Layout> createState() => _LayoutState();
}

class _LayoutState extends State<Layout> {
  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: CupertinoColors.white,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          if (constraints.maxWidth >= 1200) {
            return const DesktopScreen();
          } else if (constraints.maxWidth > 670 &&
              constraints.maxWidth < 1200) {
            return const TabletScreen();
          } else {
            return const MobileScreen();
          }
        },
      ),
    );
  }
}
