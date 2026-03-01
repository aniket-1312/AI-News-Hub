import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("About")),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: Text(
          "AI News Hub\n\n"
              "A Flutter-based application that aggregates "
              "Artificial Intelligence related news using NewsAPI.\n\n"
              "Developed as an Application Lab Assignment (ALA).",
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
