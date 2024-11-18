import 'package:flutter/material.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      var vs = SizedBox(
        height: constraints.maxHeight * 0.01,
      );
      return Column(
        children: [
          Text(
            'contact us'.toUpperCase(),
            style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700),
          ),
          vs,
          Container(
            decoration: BoxDecoration(color: Colors.grey),
            width: constraints.maxWidth * 0.6,
            height: constraints.maxHeight * 0.3,
          )
        ],
      );
    });
  }
}
