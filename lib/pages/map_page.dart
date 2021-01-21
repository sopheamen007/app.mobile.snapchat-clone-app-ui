import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:snapchat_ui/theme/colors.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(11.5760029, 104.845914),
    zoom: 15.4746,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: getFooter(),
      body: getBody(),
    );
  }

  Widget getFooter() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, top: 60),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.3)),
                    child: Icon(
                      Entypo.user,
                      color: primary,
                      size: 23,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.black.withOpacity(0.3)),
                    child: Icon(
                      Feather.search,
                      color: Colors.white,
                      size: 23,
                    ),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: darkGrey.withOpacity(0.30),
                    spreadRadius: 20,
                    blurRadius: 40,
                    // changes position of shadow
                  ),
                ]),
                child: Column(
                  children: [
                    Text(
                      "Phnom Penh",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 15,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "25 c",
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black.withOpacity(0.3)),
                child: Icon(
                  AntDesign.setting,
                  color: Colors.white,
                  size: 23,
                ),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 70,
                width: 80,
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.5)),
                            child: Center(
                              child: Icon(
                                Entypo.user,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            "My Bitmoji",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: darkGrey.withOpacity(0.20),
                    spreadRadius: 20,
                    blurRadius: 40,
                    // changes position of shadow
                  ),
                ], shape: BoxShape.circle, color: Colors.white),
                child: Center(
                  child: Icon(
                    FontAwesome.location_arrow,
                    size: 20,
                  ),
                ),
              ),
              Container(
                height: 70,
                width: 70,
                child: Stack(
                  children: [
                    Positioned(
                      left: 3,
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: Center(
                          child: Container(
                            width: 45,
                            height: 45,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.grey.withOpacity(0.5)),
                            child: Center(
                              child: Icon(
                                Entypo.user,
                                color: Colors.grey,
                                size: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 5, bottom: 5, left: 12, right: 12),
                          child: Text(
                            "Friends",
                            style: TextStyle(
                                fontSize: 11, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  Widget getBody() {
    return GoogleMap(
      mapType: MapType.normal,
      myLocationButtonEnabled: false,
      initialCameraPosition: _kGooglePlex,
      onMapCreated: (GoogleMapController controller) {
        _controller.complete(controller);
      },
    );
  }
}
