import 'package:flutter/material.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return SizedBox(
        width: constraints.maxWidth,
        height: constraints.maxHeight,
        child: Row(
          children: [
            const Text('About Us'),
            Positioned(
                left: constraints.maxWidth * 0.6,
                top: 0,
                right: 0,
                child: Image.asset('assets/location.jpg')),
          ],
        ),
      );
    });
  }
}
