// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';

class ScrollText extends StatefulWidget {
  final String text;
  ScrollText({super.key, required this.text});

  @override
  State<ScrollText> createState() => _ScrollTextState();
}

class _ScrollTextState extends State<ScrollText> {
  late String firsthalf;
  late String secondhalf;
  bool hiddentext = true;
  double textheight = 300;

  @override
  void initState() {
    super.initState();
    if (widget.text.length > textheight) {
      firsthalf = widget.text.substring(0, textheight.toInt());
      secondhalf =
          widget.text.substring(textheight.toInt() + 1, widget.text.length);
    } else {
      firsthalf = widget.text;
      secondhalf = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: secondhalf.isEmpty
          ? Text(firsthalf)
          : Column(
              children: [
                Text(hiddentext ? "$firsthalf..." : firsthalf + secondhalf),
                InkWell(
                    onTap: () {
                      setState(() {
                        hiddentext = !hiddentext;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          hiddentext ? "Show more" : "Show less",
                        ),
                        Icon(
                          hiddentext
                              ? Icons.arrow_drop_down
                              : Icons.arrow_drop_up,
                          color: Colors.amber,
                        )
                      ],
                    )),
              ],
            ),
    );
  }
}
