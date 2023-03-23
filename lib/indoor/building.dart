import 'package:flutter/material.dart';
import 'package:jkuat_navigation/utilities/appconfig.dart';
import 'package:situm_flutter_wayfinding/situm_flutter_sdk.dart';
import 'package:situm_flutter_wayfinding/situm_flutter_wayfinding.dart';

class Building extends StatefulWidget {
  String buildingIdentifier = "";
  String buildingName = "";
  late SitumFlutterSDK situmSdk;

  Building(this.buildingIdentifier, this.buildingName, {super.key}) {
    situmSdk = SitumFlutterSDK();
    situmSdk.init(situmUser, situmApiKey);
    situmSdk.setConfiguration(ConfigurationOptions(
      useRemoteConfig: true,
    ));
  }

  @override
  State<Building> createState() => _BuildingState();
}

class _BuildingState extends State<Building> {
  String currentOutput = "---";
  SitumFlutterWayfinding? mapController;

  @override
  void dispose() {
    mapController?.unload();
    super.dispose();
  }

  Widget _createSitumMapTab() {
    // The Situm map:
    return SitumMapView(
      key: const Key("situm_map"),
      // Your Situm credentials and building, see config.dart.
      // Copy config.dart.example if you haven't already.
      searchViewPlaceholder: widget.buildingName,
      situmUser: situmUser,
      situmApiKey: situmApiKey,
      buildingIdentifier: widget.buildingIdentifier,
      googleMapsApiKey: googleMapsApiKey,
      useHybridComponents: true,
      showPoiNames: true,
      hasSearchView: true,
      lockCameraToBuilding: true,
      useRemoteConfig: true,
      initialZoom: 16,
      showNavigationIndications: true,
      showFloorSelector: true,
      navigationSettings: const NavigationSettings(
        outsideRouteThreshold: 40,
        distanceToGoalThreshold: 8,
      ),
      loadCallback: _onSitumMapLoaded,
    );
  }

  void _onSitumMapLoaded(SitumFlutterWayfinding controller) {
    mapController = controller;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.buildingName),
      ),
      body: _createSitumMapTab(),
    );
  }

}
