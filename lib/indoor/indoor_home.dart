import 'package:flutter/material.dart';
import 'package:jkuat_navigation/indoor/building.dart';
import 'package:jkuat_navigation/utilities/appconfig.dart';

class IndoorHomePage extends StatefulWidget {
  const IndoorHomePage({Key? key}) : super(key: key);

  @override
  State<IndoorHomePage> createState() => _IndoorHomePageState();
}

class _IndoorHomePageState extends State<IndoorHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Navigate Indoor",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: ListView(
        children: [
          makeBuildingNav(context, buildingIdentifierSPA, "SPA", 'Swimming Pool Annex'),
          makeBuildingNav(context, buildingIdentifierELB, "ELB", 'Engineering Laboratory Building'),
          makeBuildingNav(context, buildingIdentifierNCLB, "NCLB", 'New Common Laboratory Building'),
        ],
      ),
    );
  }

  GestureDetector makeBuildingNav(
      BuildContext context, String buildingIdentifier, String buildingName, String title) {
    return GestureDetector(
      onTap: () {
        // Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>SPA(), (route) => false)
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    Building(buildingIdentifier, buildingName)));
      },
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListTile(
          leading: const Icon(
            Icons.place,
            color: Colors.green,
            size: 30,
          ),
          title: Text(title),
          subtitle: Text(buildingName),
          trailing: const Icon(Icons.arrow_forward_ios),
        ),
      ),
    );
  }
}
