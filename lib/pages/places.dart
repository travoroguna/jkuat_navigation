import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:jkuat_navigation/models/place.dart';
import 'package:jkuat_navigation/pages/directions.dart';
import 'package:jkuat_navigation/utilities/appconfig.dart';
import 'package:alan_voice/alan_voice.dart';

class PlacesPage extends StatefulWidget {
  const PlacesPage({super.key});

  @override
  State<PlacesPage> createState() => _PlacesPageState();
}


class _PlacesPageState extends State<PlacesPage> {
  _PlacesPageState() {
    /// Init Alan Button with project key from Alan Studio
    AlanVoice.addButton("5c8948d3444659508f15e76e07dbf1bf2e956eca572e1d8b807a3e2338fdd0dc/stage",
        buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

    /// Handle commands from Alan Studio
    AlanVoice.onCommand.add((command) {
      debugPrint("got new command ${command.toString()}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(color: Colors.black),
        title: const Text(
          "Where are you going?",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: StreamBuilder(
          stream: AppConfig.firebaseFiretore.collection("places").snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            List<Place> places = [];

            if (snapshot.hasData) {
              final items = snapshot.data!.docs;
              items.map((e) {
                places.add(
                  Place.fromMap(e.data() as Map<dynamic, dynamic>),
                );
              }).toList();
            }

            return ListView.builder(
              itemCount: places.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DirectionsPage(
                          name: places[i].name,
                          lat: places[i].latitude,
                          long: places[i].longitude,
                        ),
                      ),
                    );
                  },
                  child: Container(
                    decoration: const BoxDecoration(color: Colors.white),
                    margin: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: ListTile(
                      leading: const Icon(
                        Icons.place,
                        color: Colors.green,
                        size: 30,
                      ),
                      title: Text(places[i].name),
                      subtitle: Text(places[i].shortName),
                      trailing: const Icon(Icons.arrow_forward_ios),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}
