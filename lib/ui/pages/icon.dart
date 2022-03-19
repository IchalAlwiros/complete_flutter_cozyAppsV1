import 'package:flutter/material.dart';

class Iconku extends StatefulWidget {
  int? index;

  Iconku(this.index);
  @override
  State<Iconku> createState() => _IconkuState();
}

class _IconkuState extends State<Iconku> {
  int pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      enableFeedback: false,
      onPressed: () {
        setState(() {
          pageIndex = widget.index!;
        });
      },
      icon: pageIndex == widget.index
          ? const Icon(
              Icons.widgets_rounded,
              color: Colors.white,
              size: 35,
            )
          : const Icon(
              Icons.widgets_outlined,
              color: Colors.white,
              size: 35,
            ),
    );
  }
}
