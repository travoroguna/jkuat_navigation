import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class IndoorPage extends StatefulWidget {
  const IndoorPage({super.key});

  @override
  State<IndoorPage> createState() => _IndoorPageState();
}

class _IndoorPageState extends State<IndoorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Where are you going?",
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}
