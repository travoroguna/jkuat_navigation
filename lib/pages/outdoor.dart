import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class OutdoorPage extends StatefulWidget {
  const OutdoorPage({super.key});

  @override
  State<OutdoorPage> createState() => _OutdoorPageState();
}

class _OutdoorPageState extends State<OutdoorPage> {
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
