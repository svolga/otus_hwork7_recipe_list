import 'package:flutter/material.dart';

class Shadow extends StatelessWidget {
  const Shadow({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 396.0,
      height: 136.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(25, 148, 146, 146),
            offset: Offset(0.0, 4.0),
            blurRadius: 4.0,
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          color: const Color.fromARGB(255, 255, 255, 255),
        ),
      ),
    );
  }
}
