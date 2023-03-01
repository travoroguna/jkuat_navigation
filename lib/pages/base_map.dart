import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';


class BaseMap extends StatefulWidget {
  const BaseMap({Key? key}) : super(key: key);

  @override
  State<BaseMap> createState() => _BaseMapState();
}

class _BaseMapState extends State<BaseMap> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body :FlutterMap(
    options: MapOptions(
    center: LatLng(51.509364, -0.128928),
    zoom: 9.2,
    ),
    nonRotatedChildren: [
    AttributionWidget.defaultWidget(
    source: 'JKUAT',
    onSourceTapped: null,
    ),
    ],
    children: [
    // TileLayer(
    // wmsOptions: WMSTileLayerOptions(
    // baseUrl: "http://78.141.234.158/geoserver/Prisca/wms/?",
    // layers: ['JKUAT'],
    // format: "image/png",
    // transparent: true,
    // styles: ["JKUAT_style"],
    // crs: const Epsg3857(),
    // ),
    // //subdomains: const ['a', 'b', 'c', 'd', 'e', 'f', 'g', 'h'],
    // // userAgentPackageName: 'dev.fleaflet.flutter_map.example',
    // ),
    ],
   //  
    ),
    );

}
}
