import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class GridBox extends StatelessWidget {
  final String deviceName;
  final String devicePath;
  final bool onOff;
  final void Function(bool)? onChange;

  const GridBox(
      {Key? key,
      required this.deviceName,
      required this.devicePath,
      required this.onOff,
      this.onChange})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: onOff ? Colors.grey[100] : Colors.black54,
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset(
              devicePath,
              height: 80,
              color: onOff ? Colors.black54 : Colors.grey[300],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  deviceName,
                  style: GoogleFonts.aclonica(
                      fontSize: 16,
                      color: onOff ? Colors.black54 : Colors.grey[300]),
                ),
                Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: onOff,
                      onChanged: onChange,
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
