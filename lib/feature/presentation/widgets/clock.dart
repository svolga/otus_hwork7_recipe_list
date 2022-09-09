import 'package:flutter/material.dart';

class Clock extends StatelessWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 16.0,
      height: 16.0,
      child: ClipRRect(
        borderRadius: BorderRadius.zero,
        child: Image.asset(
          "assets/images/clock.png",
          color: null,
          fit: BoxFit.cover,
          width: 16.0,
          height: 16.0,
          colorBlendMode: BlendMode.dstATop,
        ),
      ),
    );
  }
}
